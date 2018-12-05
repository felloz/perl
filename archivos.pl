#!/usr/lib/perl
#Autor: Luis Serrano
#Fecha: 03/12/2018
#Contacto: serranol82@gmail.com
#Descripción:Sistema para retirar de un documento todos los errores con texto 550
#Inicio del sistema
use strict;
use warnings;
#Declaracion de Variables
my $resultado;
my $smtpDiagnosticCode;
my $smtpDiagnosticCode1;
my %smtpDiagnosticCode1;
my %devueltos;
my %row;
my $i;
my %smtpCode;
my $smtpCode;
my $row;
#my $archivo = '/home/lserrano/Documentos/perl/files/devueltos2018ls.txt';
#open (my $file, '<:encoding(UTF-8)', $archivo)
#  or die "No se pudo abrir el archivo '$archivo' $!";

#  while (my $row = <$file>) {
#    chomp $row;
#    print "$row\n";
#  }
#Abro el archivo y lo guardo en la variable de busqueda BUSCAR
open (BUSCAR, "<", "/home/lserrano/Documentos/perl/files/devueltos2018ls.txt");
#print <BUSCAR>;
while (<BUSCAR>){
  #$smtpDiagnosticCode = undef;
  #(m/([1-9])\1/)
  if($_ =~ (m/([\d{3}]\s\d[.]\d[.]\d)/)){
   #if ($_ =~ /^(\d{3}\s\d{1}\.\d{1}\.\d{1})/ig){
   $smtpDiagnosticCode = $_;
   $smtpDiagnosticCode1 = substr($smtpDiagnosticCode, 5,10);
   #print $smtpDiagnosticCode1;
   if ($smtpDiagnosticCode1 =~ /550\s\d\.\d\.\d$/){
      print $smtpDiagnosticCode1 . "\n";
   }
  };
}
