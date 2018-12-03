#!/usr/lib/perl
#Autor: Luis Serrano
#Fecha: 03/12/2018
#Contacto: serranol82@gmail.com
#Descripción: Conexion y consulta totalmente funcinoal

use DBI;


# Configuracion de conexion
my $dbname = 'dbname';
my $host = 'host';
my $port = 5432;
my $username = 'postgres';
my $password = 'postgres';

# Creando la conexion a la base de datos
my $dbh = DBI -> connect("dbi:Pg:dbname=$dbname;host=$host;port=$port",
                            $username,
                            $password,
                            {AutoCommit => 0, RaiseError => 1}
                         ) or die $DBI::errstr;

# Hacemos un query y mostramos los resultados
# Ejecutamos el query SELECT
my $sth = $dbh->prepare("SELECT smtpprefix, smtpprefixdetail FROM tabla");
$sth->execute();

# iterate through resultset
# print values
while(my $ref = $sth->fetchrow_hashref()) {
    print "Prefijo SMTP: $ref->{'smtpprefix'} Detalles del Prefijo SMTP: $ref->{'smtpprefixdetail'}\n";
}

# clean up
$dbh->disconnect();
