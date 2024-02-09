<?php
include("DBModel.php");

try {
    if (isset($_GET["numres"]) && ctype_digit($_GET["numres"])) {
        $noresglobale = $_GET["numres"];
        $requete = "select noresglobale, nores, datedeb, datefin, reservation.nom as nom, email, codeacces, hotel.nohotel, hotel.nom as nomhotel from reservation " .
            "inner join hotel on hotel.nohotel = reservation.nohotel " .
            "where noresglobale = :noresglobale";

        $result = $cnn->prepare($requete);
        $result->bindParam(":noresglobale", $noresglobale, PDO::PARAM_INT);
        $result->execute();

        $uneReservation = $result->fetch(PDO::FETCH_ASSOC);
        $result->closeCursor();

        if ($uneReservation) {
            $requete2 =  "select reserver.nochambre from reserver " .
                "inner join reservation on reserver.noresglobale = reservation.noresglobale " .
                "where reservation.noresglobale = :noresglobale order by nochambre;";

            $result2 = $cnn->prepare($requete2);
            $result2->bindParam(":noresglobale", $noresglobale, PDO::PARAM_INT);
            $result2->execute();

            $lesChambres = $result2->fetchAll(PDO::FETCH_COLUMN);
            $result2->closeCursor();
            $uneReservation["chambres"] = $lesChambres;

            echo (json_encode($uneReservation));
            $result2->closeCursor();
        }
        $result->closeCursor();
    }
} catch (Exception $ex) {
    //--- Sérialisation au format Json
    echo (json_encode(null));
}
