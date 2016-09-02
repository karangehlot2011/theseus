#!usr/local/bin/perl
use strict;
use warnings;

no warnings 'uninitialized';

my $html = qq{
	<html>
		<head>
			<title>Theseus Statistics Dashboard</title>
			<style> 
                #heading {
		            text-align: center;
		            font-family: serif, sans-serif ,times;
		            font-size: 50px;
	            }
	        </style>
	        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	        <script>
	        	jQuery(document).ready(function() {
	        		jQuery("button").click(function() {
	        			jQuery("#tohide").hide();
	        		});
	        	});
	        </script>

		</head>
		<body> 
			<p id='heading'> Theseus Metrics </p>
			<button>Click me to hide the hide paragraph.</button>
			<p id="tohide"> This is to hide</p>


		</body>
};

print $html;