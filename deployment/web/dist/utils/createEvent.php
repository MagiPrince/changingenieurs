<?php

    include('bdd_connect.php');

    $stmt = $bdd->prepare("INSERT INTO evenements (fiche_id, date_evenement, evenement, cuve_id, volumes, visa) VALUES (:fiche_id, NOW(), :evenement, :cuve_id, :volumes, :visa);");
    $stmt->execute([
        "fiche_id" => $_POST["fiche_id"],
        "evenement" => $_POST["evenement"],
        "cuve_id" => $_POST["cuve_id"],
        "volumes" => $_POST["volumes"],
        "visa" => $_POST["visa"]
    ]);

    header("Location: ../fiche?id=" . $_POST["fiche_id"]);

?>