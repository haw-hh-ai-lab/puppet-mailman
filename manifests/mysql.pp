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
    root_password => 'mysecret',
    provider => systemd
  }
  # Creates a database with a user and assign some privileges
  mysql::db { 'mailman':
    user     => 'mailman_db',
    password => 'mysecret',
    host     => $mysql_host,
    grant    => ['all'],
  }

}
