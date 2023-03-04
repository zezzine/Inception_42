# Start the MariaDB service

# if [ ! -d "/run/mysqld" ]; then
# 	mkdir -p /run/mysqld
# 	chown -R mysql:mysql /run/mysqld
# fi

# service mysql stop

# mysql -u root << EOF
# UPDATE mysql.user SET authentication_string = PASSWORD('$db_pass') WHERE User = 'root';
# FLUSH PRIVILEGES;
# EOF
# service mysql start 
# Create a new database
service mysql start 
mysql -u root -e "create database if not exists  $db_name;"
mysql -u root -e "CREATE USER if not exists '$db_user'@'%' IDENTIFIED BY '$db_pass';"
mysql -u root -e "GRANT ALL PRIVILEGES ON $db_name.* TO '$db_user'@'%';"
mysql -u root --password=${db_pass} -e "use mysql; update user set password = password('${db_pass}') , plugin = '' where user = 'root';"
mysql -u root -e "FLUSH PRIVILEGES;"
# service mysql stop

# Create a new user and grant permissions
# Flush the privileges


# mysqld 
# tail ÷-f