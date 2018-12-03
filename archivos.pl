#!/usr/lib/perl
#Autor: Luis Serrano
#Fecha: 03/12/2018
#Contacto: serranol82@gmail.com
#Descripción:

use strict;
use warnings;

my $resultado;

#my $archivo = '/home/lserrano/Documentos/perl/files/devueltos2018ls.txt';
#open (my $file, '<:encoding(UTF-8)', $archivo)
#  or die "No se pudo abrir el archivo '$archivo' $!";

#  while (my $row = <$file>) {
#    chomp $row;
#    print "$row\n";
#  }

open (BUSCAR, "<", "/home/lserrano/Documentos/perl/files/devueltos2018ls.txt");

while (<BUSCAR>){
  if(m/([1-9])\1/){
    $resultado = $_;
    print $resultado;
  };
}
