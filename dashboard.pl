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
	        		jQuery("#result").click(function() {
	        			jQuery("#tohide").hide();
	        			jQuery('#result').hide();
	        		});
	        	});

	        </script>

		</head>
		<body> 
			<p id='heading'> Theseus Metrics </p>
			<p id="tohide"> This is to hide</p>
			<div align='center' id='result'>
				<button type='button'>Click Me!</button>
			</div>
		</body>
	</html>
};


print $html;