clear
/home/mysql/mariadb/columnstore/mysql/bin/mysql --defaults-extra-file=/home/mysql/mariadb/columnstore/mysql/my.cnf -uimdbuser -ppassword < create_schema.sql

for fileName in $(ls *.dat | sort)
do
  tableName=${fileName%%.*}
  echo "$(date) - Started Loading ${fileName} -> ${tableName}"
  /home/mysql/mariadb/columnstore/bin/cpimport imdb ${tableName} ${fileName}
  echo $(date) - Loading Done for ${tableName}
  echo -
done
