-- Move/recreate the SysAdmin database in a dedicated dbspace.
-- Review the target dbspace and execute with appropriate administrative access.

execute function sysadmin:task("reset sysadmin", "dbs_sysadmin");
