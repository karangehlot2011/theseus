#!usr/local/bin/perl
use strict;
use warnings;

no warnings 'uninitialized';

my $html = qq{
	<html>
		<head>
			<title>Theseus Statistics Dashboard</title>
			<style> 
                p {
		            text-align: center;
		            font-family: serif, sans-serif ,times;
		            font-size: 50px;
	            }
	        </style>
		</head>
		<body> 
			<p> Theseus Metrics </p>
		</body>
};

print $html;