<!DOCTYPE html>
<html>

    <head>
    </head>

    <body>

        <h1>Bienvenue sur notre site</h1>
        <h3>Ici, vous pouvez voir toutes les fiches actuelles</h3>

        <?php

            include('utils/bdd_connect.php');

            $stmt = $bdd->prepare("SELECT * FROM link");
            $stmt->execute();

            $link = $stmt->fetchAll();
            $linked_fiches = array();
            foreach ($link as $row) {
                array_push($linked_fiches, $row["fiche_id"]);
            }

            $stmt = $bdd->prepare("SELECT * FROM fiche WHERE fiche_id IN (".implode(',',$linked_fiches).") ORDER BY salle");
            $stmt->execute();

            $fiches = $stmt->fetchAll();

            $actual_salle = $row["salle"];
            foreach ($fiches as $row) {

                if ($row["salle"] == ""){
                    print("</div><br /><br />");
                    print("<div id='salle_none' style=\"display: inline-block;\">");
                    print("<h4>Salle inconnue</h4>");
                }

                // this is to manage the line break between the rooms
                if ($row["salle"] != $actual_salle){

                    print("</div><br /><br />");

                    $actual_salle = $row["salle"];
                    
                    print("<div id='salle_" . $actual_salle . "'style=\"display: inline-block;\">");
                    print("<h4>Salle n°" . $actual_salle . "</h4>");

                }

                // for each card, print "millesime" and "vinif_if"
                ?>
                <div class="card card_fiche_<?php echo $row["fiche_id"]; ?>" style="width: 18rem; margin-bottom: 2px; display: inline-block;">
                    <div class="card-body">
                        <h5 class="card-title"><?php print($row["millesime"] . " - " . $row["vinif_id"]) ?></h5>
                        <p class="card-text">Volume : <?php print($row["volume"])?></p>
                        <a href="/fiche?id=<?php echo $row["fiche_id"]; ?>" class="btn btn-primary">Go</a>
                    </div>
                </div>
                <?php

            }
            print("</div>");


            if(array_key_exists('add_rfid', $_POST)) {
                $stmt = $bdd->prepare("INSERT INTO fiche (`salle`, `millesime`, `vinif_id`, `encave`, `cepage`, `appelation`, `volume`, `sondage`, `etat_san`, `egrappage`, `foulage`, `operation_prefermentaire`, `so_2`, `so_2_date`, `collage`, `collage_date`, `adjuvants`, `adjuvants_date`, `enzymes`, `enzymes_date`, `levure`, `levure_date`, `chaptalisation`, `chaptalisation_date`, `soutirage`, `soutirage_date`, `stabilisation_chimique`, `stabilisation_chimique_a`, `desacidifie`, `desacidifie_a`, `mis_au_froid_le`, `degaze`, `prefiltrer`, `mise_le`) VALUES ('', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '')");
                $stmt->execute();

                $stmt = $bdd->prepare("SELECT MAX(fiche_id) AS new_id FROM fiche");
                $stmt->execute();
                $fiche = $stmt->fetchAll();
                foreach ($fiche as $row) {
                    $new = $row["new_id"];
                }

                $stmt = $bdd->prepare("INSERT INTO link (`rfid_id`, `fiche_id`) VALUES (:rfid, :fiche)");
                $stmt->bindParam(":rfid", $_POST["rfid_id"]);
                $stmt->bindParam(":fiche", $new);
                $stmt->execute();
                echo "<script language='javascript'>window.location = window.location</script>";
            }

        ?>

        <br>
        <br>
        <div style="float:left;">
            <h3>Ajouter une nouvelle puce rfid</h3>
            <form method="post">
                <label for="rfid_id">Numéro de la rfid:</label><br>
                <input type="text" id="rfid_id" name="rfid_id"><br>
                <input type="submit" name="add_rfid"
                        class="button" value="ajouter rfid" />
            </form>
        </div>
    </body>

</html>



