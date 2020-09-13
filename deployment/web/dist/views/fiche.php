

<?php
    include("utils/bdd_connect.php");
?>


<div>
    <?php
        parse_str($query);
        $fiche_num = $id;
        
        $stmt = $bdd->prepare("SELECT * FROM precedence WHERE current_fiche = :id");
        $stmt->bindParam(":id", $fiche_num);
        $stmt->execute();
        $precedence = $stmt->fetchAll();
        foreach ($precedence as $row) {
            $prec = $row["prec_fiche"];
        }
        
        $stmt = $bdd->prepare("SELECT * FROM precedence WHERE prec_fiche = :id");
        $stmt->bindParam(":id", $fiche_num);
        $stmt->execute();
        $precedence = $stmt->fetchAll();
        foreach ($precedence as $row) {
            $suiv = $row["current_fiche"];
        }

        if(array_key_exists('prec', $_POST)) { 
            echo "<script language='javascript'>window.location = window.location.href=\"/fiche?id=". $prec . "\"</script>";
        } 
        else if(array_key_exists('suiv', $_POST)) { 
            echo "<script language='javascript'>window.location = window.location.href=\"/fiche?id=". $suiv . "\"</script>";

        }
        else if(array_key_exists('nouv', $_POST)) { 
            $stmt = $bdd->prepare("INSERT INTO fiche (`salle`, `millesime`, `vinif_id`, `encave`, `cepage`, `appelation`, `volume`, `sondage`, `etat_san`, `egrappage`, `foulage`, `operation_prefermentaire`, `so_2`, `so_2_date`, `collage`, `collage_date`, `adjuvants`, `adjuvants_date`, `enzymes`, `enzymes_date`, `levure`, `levure_date`, `chaptalisation`, `chaptalisation_date`, `soutirage`, `soutirage_date`, `stabilisation_chimique`, `stabilisation_chimique_a`, `desacidifie`, `desacidifie_a`, `mis_au_froid_le`, `degaze`, `prefiltrer`, `mise_le`) VALUES ('', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '')");
            $stmt->execute();
            
            $stmt = $bdd->prepare("SELECT MAX(fiche_id) AS new_id FROM fiche");
            $stmt->execute();
            $fiche = $stmt->fetchAll();
            foreach ($fiche as $row) {
                $new = $row["new_id"];
            }
            
            $stmt = $bdd->prepare("INSERT INTO precedence (current_fiche, prec_fiche) VALUES (:new, :id)");
            $stmt->bindParam(":new", $new);
            $stmt->bindParam(":id", $fiche_num);
            $stmt->execute();

            $stmt = $bdd->prepare("UPDATE link SET `fiche_id` = :new WHERE (`fiche_id` = :id)");
            $stmt->bindParam(":new", $new);
            $stmt->bindParam(":id", $fiche_num);
            $stmt->execute();

            echo "<script language='javascript'>window.location = window.location.href=\"/fiche?id=". $new . "\"</script>";
        }
    ?> 
  
    <form method="post"> 
        <?php if (isset($prec)){ ?>
        <input type="submit" name="prec"
                class="button" value="Précédente fiche" /> 
        
        <?php } if (isset($suiv)) { ?>
        
        <input type="submit" name="suiv"
                class="button" value="Suivante fiche" />
        
        <?php } else { ?>
        
        <input type="submit" name="nouv"
                class="button" value="Lier nouvelle fiche" /> 
        <?php } ?>
    </form>
</div>

<div class="container">
    <h2>Fiche</h2>
    <table class="table" id="fiche-table">
        <thead>
            <tr>
                <th style="text-align: left">Changin le retour, la fiche du vin</th>
            </tr>
        </thead>
        <tbody>
<?php

    // get rows and we display them
    parse_str($query);
    $fiche_num = $id;
    echo("<script>var fiche_id = $fiche_num;</script>");
    $stmt = $bdd->prepare("SELECT * FROM fiche WHERE fiche_id = '".$fiche_num."'");
    $stmt->execute();
    $fiche = $stmt->fetchAll();

    foreach ($fiche as $row) {

        foreach ($row as $i => $value) {
            if ($value === "") $row[$i] = " (à remplir) ";
        }


        echo "<tr><td>";
        echo "Salle: ";
        echo '<span id="salle" data-state="show" onclick="edit(this)">' . $row["salle"] .'</span>';
        echo "</td></tr>";

        echo "<tr><td>";
        echo "Millésime: ";
        echo '<span id="millesime" data-state="show" onclick="edit(this)">' . $row["millesime"] . '</span>';
        echo "</td><td>";
        echo "Encavé le:";
        echo '<span id="encave" data-state="show" onclick="edit(this)">' . $row["encave"] . '</span>';
        echo "</td><td>";
        echo "N° de vinif: ";
        echo '<span id="vinif_id" data-state="show" onclick="edit(this)">' . $row["vinif_id"] . '</span>';
        echo "</td></tr>";

        echo "<tr><td>";
        echo "Cépage/Appelation: ";
        echo '<span id="cepage" data-state="show" onclick="edit(this)">' . $row["cepage"] . '</span>'; 
        echo "/"; 
        echo '<span id="appelation" data-state="show" onclick="edit(this)">' . $row["appelation"] . '</span>';
        echo "</td><td>";
        echo "Volume (kg/l):";
        echo '<span id="volume" data-state="show" onclick="edit(this)">' . $row["volume"] . '</span>';
        echo "</td><td>";
        echo "Sondage ('Os)/Etat san: ";
        echo '<span id="sondage" data-state="show" onclick="edit(this)">' . $row["sondage"] . '</span>'; 
        echo "/"; 
        echo '<span id="etat_san" data-state="show" onclick="edit(this)">' . $row["etat_san"] . '</span>';
        echo "</td></tr>";

        echo "<tr><th style='text-align: left'>";
        echo "Encavage / Suivi FA + FML";
        echo "</th><tr>";

        echo "<tr><td>";
        echo "Egrappage: ";
        echo '<span id="egrappage" data-state="show" onclick="edit(this)">' . $row["egrappage"] . '</span>';
        echo "</td><td>";
        echo "Opération Préfermentaire:";
        echo '<span id="operation_prefermentaire" data-state="show" onclick="edit(this)">' . $row["operation_prefermentaire"] . '</span>';
        echo "</td><td>";
        echo "Foulage: ";
        echo '<span id="foulage" data-state="show" onclick="edit(this)">' . $row["foulage"] . '</span>';
        echo "</td></tr>";

        echo "<tr><td>";
        echo "SO2: ";
        echo '<span id="so_2" data-state="show" onclick="edit(this)">' . $row["so_2"] . '</span>'; 
        echo " / Le: "; 
        echo '<span id="so_2_date" data-state="show" onclick="edit(this)">' . $row["so_2_date"] . '</span>';
        echo "</td><td>";
        echo "Collage:";
        echo '<span id="collage" data-state="show" onclick="edit(this)">' . $row["collage"] . '</span>'; 
        echo " / Le: "; 
        echo '<span id="collage_date" data-state="show" onclick="edit(this)">' . $row["collage_date"] . '</span>';
        echo "</td><td>";
        echo "Adjuvants: ";
        echo '<span id="adjuvants" data-state="show" onclick="edit(this)">' . $row["adjuvants"] . '</span>'; 
        echo " / Le: "; 
        echo '<span id="adjuvants_date" data-state="show" onclick="edit(this)">' . $row["adjuvants_date"] . '</span>';
        echo "</td></tr>";

        echo "<tr><td>";
        echo "Enzymes: ";
        echo '<span id="enzymes" data-state="show" onclick="edit(this)">' . $row["enzymes"] . '</span>'; 
        echo " / Le: "; 
        echo '<span id="enzymes_date" data-state="show" onclick="edit(this)">' . $row["enzymes_date"] . '</span>';
        echo "</td><td>";
        echo "Levures:";
        echo '<span id="levure" data-state="show" onclick="edit(this)">' . $row["levure"] . '</span>'; 
        echo " / Le: "; 
        echo '<span id="levure_date" data-state="show" onclick="edit(this)">' . $row["levure_date"] . '</span>';
        echo "</td><td>";
        echo "Chaptalisation: ";
        echo '<span id="chaptalisation" data-state="show" onclick="edit(this)">' . $row["chaptalisation"] . '</span>'; 
        echo " / Le: "; 
        echo '<span id="chaptalisation_date" data-state="show" onclick="edit(this)">' . $row["chaptalisation_date"] . '</span>';
        echo "</td></tr>";

        echo "<tr><td>";
        echo "Soutirage: ";
        echo '<span id="soutirage" data-state="show" onclick="edit(this)">' . $row["soutirage"] . '</span>'; 
        echo " / Le: "; 
        echo '<span id="soutirage_date" data-state="show" onclick="edit(this)">' . $row["soutirage_date"] . '</span>';
        echo "</td><td>";
        echo "Stabilisation chimique: ";
        echo '<span id="stabilisation_chimique" data-state="show" onclick="edit(this)">' . $row["stabilisation_chimique"] . '</span>'; 
        echo " à: "; 
        echo '<span id="stabilisation_chimique_a" data-state="show" onclick="edit(this)">' . $row["stabilisation_chimique_a"] . '</span>'; 
        echo "dl/hf SO2 5%";
        echo "</td></tr>";

        echo "<tr><td>";
        echo "Désacidifié : ";
        echo '<span id="desacidifie" data-state="show" onclick="edit(this)">' . $row["desacidifie"] . '</span>'; 
        echo " à: "; 
        echo '<span id="desacidifie_a" data-state="show" onclick="edit(this)">' . $row["desacidifie_a"] . '</span>';
        echo "</td><td>";
        echo "Mis au froid le: "; 
        echo '<span id="mis_au_froid_le" data-state="show" onclick="edit(this)">' . $row["mis_au_froid_le"] . '</span>';
        echo "</td></tr>";
    
        echo "<tr><td>";
        echo "Dégazé le: ";
        echo '<span id="degaze" data-state="show" onclick="edit(this)">' . $row["egrappage"] . '</span>';
        echo "</td><td>";
        echo "Préfiltré le: ";
        echo '<span id="prefiltrer" data-state="show" onclick="edit(this)">' . $row["prefiltrer"] . '</span>';
        echo "</td><td>";
        echo "Misé le: ";
        echo '<span id="mise_le" data-state="show" onclick="edit(this)">' . $row["mise_le"] . '</span>';
        echo "</td></tr>";

    }

    ?>
        </tbody>
        </table>

        <table class="table" id="events_table">
        <thead>
            <?php
                echo "<tr><th>";
                echo "Date";
                echo "</th><th>";
                echo "Travaux/Traitements/Observations";
                echo "</th><th>";
                echo "N° Cuve";
                echo "</th><th>";
                echo "Volumes";
                echo "</th><th>";
                echo "Visa";
                echo "</th></tr>";
            ?>
        </thead>
        <tbody>

    <?php

    $stmt = $bdd->prepare("SELECT * FROM evenements WHERE fiche_id = ?");
    $stmt->execute([
        $fiche_num
    ]);
    $events = $stmt->fetchAll();

    $counter_events = 0;
    foreach ($events as $event) {
        $counter_events++;
        echo "<tr id=event_".$event['evenement_id']." data-id_event=".$event['evenement_id']."><td>";
        echo '<span data-bdd-column="date_evenement" id=date_evenement_' . $event['evenement_id'] . ' data-state="show" onclick="edit(this, \'events\')">' . $event["date_evenement"] . '</span>';
        echo "</td><td>";
        echo '<span data-bdd-column="evenement" id=evenement_' . $event['evenement_id'] . ' data-state="show" onclick="edit(this, \'events\')">' . $event["evenement"] . '</span>';
        echo "</td><td>";
        echo '<span data-bdd-column="cuve_id" id=cuve_id_' . $event['evenement_id'] . ' data-state="show" onclick="edit(this, \'events\')">' . $event["cuve_id"] . '</span>';
        echo "</td><td>";
        echo '<span data-bdd-column="volumes" id=volumes_' . $event['evenement_id'] . ' data-state="show" onclick="edit(this, \'events\')">' . $event["volumes"] . '</span>';
        echo "</td><td>";
        echo '<span data-bdd-column="visa" id=visa_' . $event['evenement_id'] . ' data-state="show" onclick="edit(this, \'events\')">' . $event["visa"] . '</span>';
        echo "</td></tr>";
    }

?>

                <form id="create_event" action="../utils/createEvent.php" method="POST">
                    <tr id="event_new">
                        <td>
                            <input type="text" name="date_evenement" value="maintenant" disabled />
                        </td>
                        <td>
                            <input type="text" name="evenement" />
                        </td>
                        <td>
                            <input type="text" name="cuve_id" />
                        </td>
                        <td>
                            <input type="text" name="volumes" />
                        </td>
                        <td>
                            <input type="text" name="visa" />
                        </td>
                        <td>
                            <input type="submit" value="Ajouter" />
                        </td>
                        <input type="hidden" name="fiche_id" value=<?php echo $fiche_num; ?> />
                        
                    </tr>
                </form>
            </tbody>
        </table>

        <br />

        <button id="apply" style="display: none;" onclick="apply()">Modifier</button>
        <button id="apply_event" style="display: none;" onclick="apply_event('will_be_set_later')">Modifier</button>
        <span id="result"></span>

        <script>
            function edit(elem, type){

                if (typeof(type)==='undefined') type = "datas";

                element = document.getElementById(elem.id);

                if (element.getAttribute("data-state") == "show") {
                    element.setAttribute("data-state", "edit");
                    if (type === "datas")
                        document.getElementById("apply").setAttribute("style", "display: block;");
                    else { // events
                        var buttonEdit = document.getElementById("apply_event");
                        buttonEdit.setAttribute("style", "display: block;");
                        buttonEdit.onclick = function(){ apply_event(elem.parentElement.parentElement.getAttribute("data-id_event")) };
                    }

                    text = element.innerHTML;
                    element.innerHTML = "<input type='text' value='" + text + "' />"
                }

            }

            function apply(){

                url = "../utils/update_fiche.php"
                params = "?fiche_id=" + fiche_id + "&";

                document.getElementById("apply").setAttribute("style", "display: none;");

                var table = document.getElementById("fiche-table");
                var listSpan = table.getElementsByTagName("span");
                var counter = 0;

                for (var i = 0; i < listSpan.length; i++) {
                    elem = listSpan[i];
                    params += elem.id + "="
                    if (elem.getAttribute("data-state") == "edit"){
                        params += elem.getElementsByTagName("input")[0].value;
                        counter += 1;
                    }
                    else
                        params += elem.innerHTML;

                    params += "&";
                }

                url += params;
                console.log(httpGet(url));

                if (counter > 1)
                    document.getElementById("result").innerHTML = counter + " éléments mis à jour !";
                else
                    document.getElementById("result").innerHTML = counter + " élément mis à jour !";

                counter = 0;

            }

            function apply_event(event_id){
                console.log(event_id)
                url = "../utils/update_event.php"
                params = "?evenement_id=" + event_id + "&fiche_id=" + fiche_id + "&";

                document.getElementById("apply_event").setAttribute("style", "display: none;");

                var event = document.getElementById("event_" + event_id);
                // var table = document.getElementById("fiche-events");
                var listSpan = event.getElementsByTagName("span");
                var counter = 0;

                for (var i = 0; i < listSpan.length; i++) {
                    elem = listSpan[i];
                    params += elem.getAttribute("data-bdd-column") + "="
                    if (elem.getAttribute("data-state") == "edit"){
                        params += elem.getElementsByTagName("input")[0].value;
                        counter += 1;
                    }
                    else
                        params += elem.innerHTML;

                    params += "&";
                }

                url += params;
                console.log(httpGet(url));

                if (counter > 1)
                    document.getElementById("result").innerHTML = counter + " elements updated !";
                else
                    document.getElementById("result").innerHTML = counter + " element updated !";

                counter = 0;

            }

            function httpGet(theUrl)
            {
                var xmlHttp = new XMLHttpRequest();
                xmlHttp.open( "GET", theUrl, false ); // false for synchronous request
                xmlHttp.send( null );
                return xmlHttp.responseText;
            }

        </script>
    </body>
</html>
