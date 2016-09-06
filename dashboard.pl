#!usr/local/bin/perl
use strict;
use warnings;

no warnings 'uninitialized';

use Athena::Lib qw/:athena :intranet/;
use AthenaUtils;


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

	            .showtable {
	            	color: #fff;
	            	font-family: Century Gothic;
	            	width: 90%;
	            	border-collapse: collapse;
	            	border-spacing: 1px;
	            }

	            .showtable table,th,td {
	            	text-align: center;
	            	font-size: 20px;
	            }

	            .showtable th{
	            	background: #61B329;
	            	color: #fff;
	            	font-weight: bold;
	            	font-size: 20px;
	            	font-family: Century Gothic;
	            	vertical-align: middle;
	            }

	            .showtable td{
	            	border: 1px solid opaque;
	            	height: 30px;
	            	transition: all 0.3s;
	            	background: #FAFAFA;
	            	text-align: center;
	            	color: black;
	            }

	            .showtable #project {
	            	width: 80%;
	            	text-align: left;
	            }

	            .showtable tr:nth-child(even) td {
	            	background: #F1F1F1;
	            }

	            .showtable tr:nth-child(odd) td {
	            	background: #FEFEFE;
	            }

	            .showtable tr td:hover {
	            	background: #664088;
	            	color: #FFF;
	            	cursor:pointer;
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
			<div class='showtable' align='center'>
				<table class='showtable'>
					<tr>
						<th>Test</th>
						<th> Long test</th>
					</tr>
					<tr>
						<td>This is </td>
						<td> again a long test</td>
					</tr>
				</table>
			</div>
		</body>
	</html>
};


print $html;