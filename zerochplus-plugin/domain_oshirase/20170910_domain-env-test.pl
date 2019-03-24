#!/usr/bin/perl

use strict;
# use warnings;

print <<"OWARI";
Content-type: text/plain;

SERVER_NAME:	$ENV{'SERVER_NAME'}
HTTP_HOST:	$ENV{'HTTP_HOST'}
OWARI
