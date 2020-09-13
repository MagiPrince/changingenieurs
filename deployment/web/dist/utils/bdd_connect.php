<?php

    $servername = "deployment_db_1";
    $dbname = "changingenieurs";
    $username = "changingenieurs";
    $password = "changin";

    try {
        $bdd = new PDO("mysql:host=$servername;dbname=$dbname", $username, $password);
        // set the PDO error mode to exception
        $bdd->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    }
    catch(PDOException $e) {
        echo "Connection failed: " . $e->getMessage();
    }

?>