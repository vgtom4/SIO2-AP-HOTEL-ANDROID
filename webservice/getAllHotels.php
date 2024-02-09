<?php
include("DBModel.php");

$requete = "select nohotel, nom from hotel where nohotel != 1 order by nom";

$result = $cnn->prepare($requete);
$result->execute();

$lesHotels = $result->fetchAll(PDO::FETCH_ASSOC);

//--- Sérialisation au format Json
echo(json_encode($lesHotels));
$result->closeCursor();
?>
