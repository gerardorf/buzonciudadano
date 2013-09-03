postgresql in ubuntu:

`sudo -u postgres psql`

`CREATE USER buzonciudadano WITH PASSWORD 'buzon' CREATEUSER CREATEDB;`

`sudo -u postgres psql -U buzonciudadano template1`
`CREATE DATABASE buzonciudadano_development`
`CREATE DATABASE buzonciudadano_test`


configure postgres:
/etc/postgresql/9.2/main/pg_hba.conf

`host    all             all             0.0.0.0/0               md5`

`local   all             all                                     md5`

Additionaly, inside /etc/postgresql/9.2/main/postgresql.conf uncomment `listen_address` so it is as follows:

`listen_addresses='*'`


##install phppgadmin
https://bdhacker.wordpress.com/2011/05/06/postgresql-phppgadmin-php5-ubuntu/
`ln -s /usr/share/phppgadmin /var/www/phppgadmin`
`ensure to allow remote conections in /etc/phppgadmin/apache.conf`