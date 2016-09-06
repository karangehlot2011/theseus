#!usr/local/bin/perl
use strict;
use warnings;

no warnings 'uninitialized';

use Athena::Lib qw/:athena :intranet/;
use AthenaUtils;
use Hydra::Schedule;
use Data::Dumper;
use AthenaDate;


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
	            	border-spacing: 10px;
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
			<br>
			<div class='showtable' align='center'>
				<table class='showtable'>
};

my $dbh = AthenaUtils::DBConnect({
	INSTANCE => 'TITAN',
	SCHEMA => 'HYDRA',
});

my $currentbuild = Hydra::Schedule::GetLatestBuild($dbh);

my @upcomingbuilds = Hydra::Schedule::GetUpcomingBuilds($dbh,{
	INCLUDEMONTHLY => 1,
});

my $today = AthenaDate::Today();
my @dates = AthenaDate::ListDates(AthenaDate::AddDays($today,-6),$today);

$html .= qq{
					<tr>
						<th colspan='3'>Class Type</th>
						<th colspan='10'>Prod</th>
						<th colspan='10'>$upcomingbuilds[0]->{BUILD}</th>
						<th colspan='10'>$upcomingbuilds[2]->{BUILD}</th>
						<th colspan='10'>$upcomingbuilds[4]->{BUILD}</th>
						<th colspan='10'>$upcomingbuilds[6]->{BUILD}</th>
					</tr>
					<tr>
						<td colspan='3'></td>
			};

$html .= qq{
                        <td colspan='1'> T </td>
                        <td colspan='1'>T-1</td>
                        <td colspan='1'>T-2</td>
                        <td colspan='1'>T-3</td>
                        <td colspan='1'>T-4</td>
                        <td colspan='1'>T-5</td>
                        <td colspan='1'>T-6</td>
                        <td colspan='3'></td>
} x 5;


	
print $html;