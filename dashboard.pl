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

# Theseus DB handler
my $theseusdbh = AthenaUtils::DBConnect({
	INSTANCE => 'TITAN',
	SCHEMA => 'THESEUS',
});

# Geting the current build and upcoming builds.
my $currentbuild = Hydra::Schedule::GetLatestBuild($dbh);
my @upcomingbuilds = Hydra::Schedule::GetUpcomingBuilds($dbh,{
	INCLUDEMONTHLY => 1,
});

# Getting the today's date and the dates in the 
# last week.
my $today = AthenaDate::Today();
my @dates = AthenaDate::ListDates(AthenaDate::AddDays($today,-6),$today);

# Adding the upcoming build columns.
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
						<td colspan='53'>No. of tests executed in the last week</td>
					</tr>
					<tr>
						<td colspan='3'></td>
			};

# Adding the T, T-6 columns to the table.
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

# Getting the data from the execution table.
# Using hte foreach loops to get  the data.

my @branchids = SQLColumnValues("select id from branch",$theseusdbh);
foreach my $branch (@branchids) {
	foreach (1..7) {
		my $prev = $_ - 1;
		my $sql = "select count(execution.id) total from execution,branch where branch.id = execution.branchid and branch.id = $branch and execution.created > sysdate - $_ and execution.created < sysdate - $prev";
		my ($value) = SQLValues($sql,$theseusdbh);

		# Appending the html content to incorporate
		# the number in the table.	
	}

}


$html .= qq{
					</tr>

};	
print $html;