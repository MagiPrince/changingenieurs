<a href="accueil.php">Error 404 not found</a><br />

<!-- <?php

    echo ("Now working with PHP engine ! :)");
    
    $bdd = new PDO('mysql:host=deployment_db_1;dbname=changingenieurs', 'changingenieurs', 'changin'); 
    $bdd->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    $bdd->setAttribute(PDO::ATTR_EMULATE_PREPARES, false);

    $stmt = $bdd->prepare("INSERT INTO intrants (nom, expiration_date, quantite) VALUES (:nom, CURRENT_TIMESTAMP(), :quantite)");
    $stmt->bindParam(":nom", $name);
    $stmt->bindParam(":quantite", $value);
    
    // insert one row
    $name = 'g_name';
    $value = "testfff";
    $stmt->execute();

    // get rows and we display them
    $stmt = $bdd->prepare("SELECT * FROM intrants");
    $stmt->execute();

    $intrant = $stmt->fetchAll();

    print("<br />");
    foreach ($intrant as $row) {
        print $row["nom"] . "<br/>";
    }


?> -->