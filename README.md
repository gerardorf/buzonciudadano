postgresql in ubuntu:

`sudo -u postgres psql`

`CREATE USER buzonciudadano WITH PASSWORD 'buzon' CREATEUSER CREATEDB;`

configure postgres:
/etc/postgresql/9.2/main/pg_hba.conf

`host    all             all             0.0.0.0/0               md5`

`local   all             all                                     md5`

Additionaly, inside /etc/postgresql/9.2/main/postgresql.conf uncomment `listen_address` so it is as follows:

`listen_addresses='*'`


