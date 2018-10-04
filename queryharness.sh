#!/bin/bash
clear
repFile=out/executionReport.csv
echo "File Name", "Start Time", "End Time", "Execution Time(sec)" > $repFile
for filename in $(ls queries/q*.sql | sort); do
 start=`date +%s`
 outFile=out/$(basename $filename).out
 echo Started Executing $filename
 /home/mariadb-user/mariadb/columnstore/mysql/bin/mysql --defaults-extra-file=/home/mariadb-user/mariadb/columnstore/mysql/my.cnf -u root cs_tpch < $filename 2>&1 > $outFile
 end=`date +%s`
 runtime=$((end-start))
 echo $filename " execution time(sec) is:" $runtime
 echo $filename, $start, $end, $runtime >> $repFile
 echo
done
