<?php

    include('bdd_connect.php');

    $stmt = $bdd->prepare("UPDATE `fiche` SET `salle` = :salle, `millesime` = :millesime, `vinif_id` = :vinif_id, `encave` = :encave, `cepage` = :cepage, `appelation` = :appelation, `volume` = :volume, `sondage` = :sondage, `etat_san` = :etat_san, `egrappage` = :egrappage, `foulage` = :foulage, `operation_prefermentaire` = :operation_prefermentaire, `so_2` = :so_2, `so_2_date` = :so_2_date, `collage` = :collage, `collage_date` = :collage_date, `adjuvants` = :adjuvants, `adjuvants_date` = :adjuvants_date, `enzymes` = :enzymes, `enzymes_date` = :enzymes_date, `levure` = :levure, `levure_date` = :levure_date, `chaptalisation` = :chaptalisation, `chaptalisation_date` = :chaptalisation_date, `soutirage` = :soutirage, `soutirage_date` = :soutirage_date, `stabilisation_chimique` = :stabilisation_chimique, `stabilisation_chimique_a` = :stabilisation_chimique_a, `desacidifie` = :desacidifie, `desacidifie_a` = :desacidifie_a, `mis_au_froid_le` = :mis_au_froid_le, `degaze` = :degaze, `prefiltrer` = :prefiltrer, `mise_le` = :mise_le WHERE (`fiche_id` = :fiche_id);");
    $stmt->execute([
        "salle" => $_GET["salle"],
        "millesime" => $_GET["millesime"],
        "vinif_id" => $_GET["vinif_id"],
        "encave" => $_GET["encave"],
        "cepage" => $_GET["cepage"],
        "appelation" => $_GET["appelation"],
        "volume" => $_GET["volume"],
        "sondage" => $_GET["sondage"],
        "etat_san" => $_GET["etat_san"],
        "egrappage" => $_GET["egrappage"],
        "foulage" => $_GET["foulage"],
        "operation_prefermentaire" => $_GET["operation_prefermentaire"],
        "so_2" => $_GET["so_2"],
        "so_2_date" => $_GET["so_2_date"],
        "collage" => $_GET["collage"],
        "collage_date" => $_GET["collage_date"],
        "adjuvants" => $_GET["adjuvants"],
        "adjuvants_date" => $_GET["adjuvants_date"],
        "enzymes" => $_GET["enzymes"],
        "enzymes_date" => $_GET["enzymes_date"],
        "levure" => $_GET["levure"],
        "levure_date" => $_GET["levure_date"],
        "chaptalisation" => $_GET["chaptalisation"],
        "chaptalisation_date" => $_GET["chaptalisation_date"],
        "soutirage" => $_GET["soutirage"],
        "soutirage_date" => $_GET["soutirage_date"],
        "stabilisation_chimique" => $_GET["stabilisation_chimique"],
        "stabilisation_chimique_a" => $_GET["stabilisation_chimique_a"],
        "desacidifie" => $_GET["desacidifie"],
        "desacidifie_a" => $_GET["desacidifie_a"],
        "mis_au_froid_le" => $_GET["mis_au_froid_le"],
        "degaze" => $_GET["degaze"],
        "prefiltrer" => $_GET["prefiltrer"],
        "mise_le" => $_GET["mise_le"],
        "fiche_id" => $_GET["fiche_id"]
    ]);


?>