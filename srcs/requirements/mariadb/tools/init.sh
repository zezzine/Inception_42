# service mysql start 

# mysql -u root -e "create database if not exists  $db_name;"
# mysql -u root -e "CREATE USER if not exists '$db_user'@'%' IDENTIFIED BY '$db_pass';"
# mysql -u root -e "GRANT ALL PRIVILEGES ON $db_name.* TO '$db_user'@'%';"
# # mysql -u root -e "FLUSH PRIVILEGES;"
# # mysql -u root -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '12345';"
# # mysql -u root --password=${db_pass} -e "use mysql; update user set password = password('${db_pass}') , plugin = '' where user = 'root';"
# #The FLUSH PRIVILEGES command in MySQL forces the server to reload
# #the grant tables and apply any changes that have been made to user privileges.

# mysql -u root -e "FLUSH PRIVILEGES;"

service mysql start 
mysql -u root -e "create database if not exists  zezzine;"
mysql -u root -e "CREATE USER if not exists 'zack'@'%' IDENTIFIED BY '123';"
mysql -u root -e "GRANT ALL PRIVILEGES ON zezzine.* TO 'zack'@'%';"
mysql -u root -e "FLUSH PRIVILEGES;"