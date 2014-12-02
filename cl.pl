#! /usr/bin/perl -w
use strict;
use warnings;

while(<>){
	s/\/\/.*//;
	print $_;
}
