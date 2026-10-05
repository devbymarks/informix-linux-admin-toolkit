#!/usr/bin/env ksh
###############################################################################
# Extents report for an IBM Informix database.
# Based on the operational report supplied with the source project.
# Usage: ./extents_report.ksh DATABASE
###############################################################################

DATABASE="$1"

if [ -z "$DATABASE" ]; then
  print "Usage: $0 DATABASE" >&2
  exit 1
fi

TMPFILE1="/tmp/extents_frag.$$.unl"
TMPFILE2="/tmp/extents_nonfrag.$$.unl"
TMPFILE3="/tmp/extents_report.$$.tmp"

trap 'rm -f "$TMPFILE1" "$TMPFILE2" "$TMPFILE3"' EXIT INT TERM

dbaccess "$DATABASE" <<-! 2>/dev/null
set isolation to dirty read;

unload to $TMPFILE1
select st.tabname, sf.partn, sf.nrows, st.fextsize, sf.npused
from 'informix'.sysfragments sf, 'informix'.systables st
where st.tabid = sf.tabid
and st.tabtype = 'T'
and sf.fragtype = 'T';

unload to $TMPFILE2
select tabname, nrows, fextsize, npused
from 'informix'.systables
where tabid > 99
and tabtype = 'T'
and tabid not in (
  select tabid
  from 'informix'.sysfragments
  where fragtype = 'T'
);
!

print "create temp table t1 \
       (tabname char(18), partn int, nrows int, fextsize int, npused int) with no log; \
       load from $TMPFILE1 \
       insert into t1; \
       create temp table t2(tabname char(18), nfrags smallint, nextns smallint, nrows int, fextsize int, pages_alloc int, pages_used int) with no log; \
       insert into t2 \
       select t1.tabname, count(*) nfrags, sum(spt.nextns) nextns, sum(t1.nrows) nrows, sum(t1.fextsize) / 2, \
              sum(spt.nptotal) pages_alloc, sum(t1.npused) pages_used \
       from t1, sysptnhdr spt \
       where t1.partn = spt.partnum \
       group by 1; \
       drop table t1; \
       create temp table t1(tabname char(18), nrows int, fextsize int, npused int) with no log; \
       load from $TMPFILE2 \
       insert into t1; \
       insert into t2(tabname, nextns, nrows, fextsize, pages_alloc, pages_used) \
       select t1.tabname, count(*), t1.nrows, t1.fextsize / 2, sum(se.size), t1.npused \
       from t1, 'informix'.sysextents se \
       where se.dbsname = \"$DATABASE\" \
       and t1.tabname = se.tabname \
       group by 1, 3, 4, 6; \
       select *, case when pages_alloc = 0 then 0 else round(pages_used / pages_alloc * 100,2) end perc_used \
       from t2 \
       order by pages_alloc desc, tabname;" | dbaccess sysmaster 2>/dev/null | grep -v '^$' > "$TMPFILE3"

print "TABLE EXTENTS REPORT - DATABASE: $DATABASE   INFORMIXSERVER: $INFORMIXSERVER   HOST: $(hostname)   DATE: $(date)\n"

awk 'BEGIN {
       printf("                                                     Fextsize (pages)       Alloc       Alloc     Used Data     Used Data     Perc\n");
       printf("Tabname               Nfrags   Nextns        Nrows        [sum frags]       Pages      MBytes         Pages        MBytes     Used\n\n");
       total_pages_alloc=0; total_pages_used=0
     }
     {
       if(NR % 8 == 1) tabname = $2
       if(NR % 8 == 2) nfrags = $2
       if(NR % 8 == 3) nextns = $2
       if(NR % 8 == 4) nrows = $2
       if(NR % 8 == 5) fextsize = $2
       if(NR % 8 == 6) { pages_alloc = $2; total_pages_alloc += pages_alloc }
       if(NR % 8 == 7) { pages_used = $2; total_pages_used += pages_used }
       if(NR % 8 == 0) {
         perc_used = $2
         if (nfrags == "")
           printf("%-18s%19d%13d%19d%12d%12.2f%14d%14.2f%9.2f\n", tabname, nextns, nrows, fextsize, pages_alloc, pages_alloc / 512, pages_used, pages_used / 512, perc_used)
         else
           printf("%-18s%10d%9d%13d%19d%12d%12.2f%14d%14.2f%9.2f\n", tabname, nfrags, nextns, nrows, fextsize, pages_alloc, pages_alloc / 512, pages_used, pages_used / 512, perc_used)
       }
     }
     END {
       total_perc = (total_pages_alloc == 0 ? 0 : total_pages_used / total_pages_alloc * 100)
       printf("                                                                       ----------   ---------    ----------     ---------   ------\n");
       printf("%81d%12.2f%14d%14.2f%9.2f\n", total_pages_alloc, total_pages_alloc / 512, total_pages_used, total_pages_used / 512, total_perc);
       printf("                                                                       ==========   =========    ==========     =========   ======\n");
     }' "$TMPFILE3"
