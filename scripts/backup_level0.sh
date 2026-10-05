#!/usr/bin/env bash
set -euo pipefail

: "${INFORMIXSERVER:?INFORMIXSERVER não definido}"
: "${INFORMIXDIR:?INFORMIXDIR não definido}"

BACKUP_DIR="${BACKUP_DIR:-/backup/ontape}"
LOG_FILE="${LOG_FILE:-/var/log/informix/backup_level0.log}"
ONCONFIG_FILE="${ONCONFIG:-onconfig.${INFORMIXSERVER}}"
SQLHOSTS_FILE="${INFORMIXSQLHOSTS:-${INFORMIXDIR}/etc/sqlhosts}"

mkdir -p "$BACKUP_DIR" "$(dirname "$LOG_FILE")"

exec >>"$LOG_FILE" 2>&1

echo "============================================================"
echo "Backup iniciado: $(date -Is)"
echo "INFORMIXSERVER: $INFORMIXSERVER"
echo "Destino: $BACKUP_DIR"

command -v ontape >/dev/null 2>&1 || {
  echo "Erro: ontape não encontrado no PATH."
  exit 1
}

onstat -c | grep -E '^L?TAPE|^BACKUP_FILTER|^RESTORE_FILTER' || true

# Backup nível 0. Revise a configuração TAPEDEV/LTAPEDEV do ONCONFIG
# antes de automatizar esta rotina em produção.
ontape -s -L 0

cd "$BACKUP_DIR"

onstat -d > dbspaces.txt
onstat -   > instance_status.txt

if [ -f "$INFORMIXDIR/etc/$ONCONFIG_FILE" ]; then
  cp "$INFORMIXDIR/etc/$ONCONFIG_FILE" "${ONCONFIG_FILE}.snapshot"
else
  echo "Aviso: ONCONFIG não encontrado: $INFORMIXDIR/etc/$ONCONFIG_FILE"
fi

if [ -f "$SQLHOSTS_FILE" ]; then
  cp "$SQLHOSTS_FILE" sqlhosts.snapshot
else
  echo "Aviso: sqlhosts não encontrado: $SQLHOSTS_FILE"
fi

echo "Backup finalizado: $(date -Is)"
