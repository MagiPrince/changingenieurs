<?php

    include('bdd_connect.php');

    $stmt = $bdd->prepare("UPDATE `evenements` SET `fiche_id` = :fiche_id, `date_evenement` = :date_evenement, `evenement` = :evenement, `cuve_id` = :cuve_id, `volumes` = :volumes, `visa` = :visa WHERE (`evenement_id` = :evenement_id);");
    $stmt->execute([
        "fiche_id" => $_GET["fiche_id"],
        "date_evenement" => $_GET["date_evenement"],
        "evenement" => $_GET["evenement"],
        "cuve_id" => $_GET["cuve_id"],
        "volumes" => $_GET["volumes"],
        "visa" => $_GET["visa"],
        "evenement_id" => $_GET["evenement_id"],

    ]);

?>