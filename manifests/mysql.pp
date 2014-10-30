#
# create a external lists database, stored in a mysql database
#
# Arguements:
#  server_pw: the root password to the mysql server. Only needed if the
#             the databases is not already created.
#
class mailman::mysql(
   $mysql_host = 'localhost',
   $server_pw = 'none',
  ){
  class { '::mysql::server':
    root_password => '15380d6f4f95f6b36ee4574afedc95cd',
  }
  # Creates a database with a user and assign some privileges
  mysql::db { 'mailman':
    user     => 'mailman_db',
    password => '922336dbed39426cfc0f096b4b935624',
    host     => $mysql_host,
    grant    => ['all'],
  }

}
