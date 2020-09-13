<?php

    $bdd = new PDO('mysql:host=deployment_db_1;dbname=changingenieurs', 'changingenieurs', 'changin'); 
    $bdd->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

    parse_str($query);
    $rfid_id = $id;

    $stmt = $bdd->prepare("SELECT * FROM link WHERE rfid_id = :id");
    $stmt->bindParam(":id", $rfid_id);
    $stmt->execute();
    $precedence = $stmt->fetchAll();
    foreach ($precedence as $row) {
        $fiche = $row["fiche_id"];
    }
    if (isset($fiche)){
        echo "<script language='javascript'>window.location = window.location.href=\"/fiche?id=". $fiche . "\"</script>";
    }
    else {
        echo "<a href=\"accueil.php\">RFID fiche not in bdd</a><br />";
    }
?>