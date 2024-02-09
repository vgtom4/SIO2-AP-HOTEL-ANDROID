<?php
try {
    include("DBModel.php");
    // Récupération des informations de l'hôtel
    $requeteHotel = "SELECT nohotel, nom, adr1, adr2, cp, ville, tel, descourt, deslong, prix FROM hotel WHERE nohotel != 1 AND nohotel = :nohotel ORDER BY nom";

    $resultHotel = $cnn->prepare($requeteHotel);
    $resultHotel->bindParam(':nohotel', $_GET['nohotel'], PDO::PARAM_INT);
    $resultHotel->execute();

    $hotel = $resultHotel->fetch(PDO::FETCH_ASSOC);
    // Fermeture des curseurs
    $resultHotel->closeCursor();

    if ($hotel) {
        // Récupération du nom d'une photo liée à l'hôtel
        $requetePhoto = "select TOP 1 nophoto, nomfichier from photo where nohotel = :nohotel";

        $resultPhoto = $cnn->prepare($requetePhoto);
        $resultPhoto->bindParam(':nohotel', $hotel['nohotel'], PDO::PARAM_INT);
        $resultPhoto->execute();

        $photo = $resultPhoto->fetch(PDO::FETCH_ASSOC);
        $resultPhoto->closeCursor();

        // Ajout du nom de la photo aux informations de l'hôtel
        $hotel['nomfichier'] = $photo['nomfichier'];

        // Sérialisation au format JSON
        echo (json_encode($hotel));
    }
} catch (PDOException $e) {
}
