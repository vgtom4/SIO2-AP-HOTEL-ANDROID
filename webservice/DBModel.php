<?php
try
{
	$server = "VGTOM\\SQLSERVEREXPRESS";
	$dbname = "bdhotel_lepers-vieillard";
	$user = "sa";
	$password = "mdpsa";
	$cnn = new PDO("sqlsrv:Server=$server;Database=$dbname", $user, $password);
} 
catch(Exception $e) 
{
	die('Erreur : '.$e->getMessage());
}
?>
