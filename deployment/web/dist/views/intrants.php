<?php
    include("utils/bdd_connect.php");
?>


<style>
button, .nom{
  background: none!important;
  border: none;
  padding: 0!important;
  /*input has OS specific font-family*/
  cursor: pointer;
  margin: 5px;
}
</style>

<div class="container">
    <h2>Intrants</h2>
    <table class="table">
        <thead>
            <tr>
                <th>Nom</th>
                <th>Date d'expiration</th>
                <th>Quantité</th>
            </tr>
        </thead>
        <tbody>
<?php
    function edit(){
        if (! isset($bdd)){
            $bdd = new PDO('mysql:host=deployment_db_1;dbname=changingenieurs', 'changingenieurs', 'changin'); 
            $bdd->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
            $bdd->setAttribute(PDO::ATTR_EMULATE_PREPARES, false);
        }
        
        $stmt = $bdd->prepare("UPDATE intrants SET expiration_date = :expiration_date, quantite = :quantite where nom = :nom");
        $stmt->bindParam(":expiration_date", $_POST["expiration_date"]);
        $stmt->bindParam(":quantite", $_POST["quantite"]);    
        $stmt->bindParam(":nom", $_POST["nom"]);
        $stmt->execute();

        echo"<script language='javascript'>window.location = window.location</script>";
    }

    function add(){
        try {
            if (! isset($bdd)){
                $bdd = new PDO('mysql:host=deployment_db_1;dbname=changingenieurs', 'changingenieurs', 'changin'); 
                $bdd->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
                $bdd->setAttribute(PDO::ATTR_EMULATE_PREPARES, false);
            }

            $stmt = $bdd->prepare("INSERT INTO intrants (nom, expiration_date, quantite) VALUES (:nom, :expiration_date, :quantite)");
            $stmt->bindParam(":nom", $_POST["add_nom"]);
            $stmt->bindParam(":expiration_date", $_POST["add_expiration_date"]);
            $stmt->bindParam(":quantite", $_POST["add_quantite"]);        
            $stmt->execute();

            echo"<script language='javascript'>window.location = window.location</script>";
        }
        catch (Exception $e)
        {
            echo "Intrant déjà existant !";
        }

    }

    function delete(){
        if (! isset($bdd)){
            $bdd = new PDO('mysql:host=deployment_db_1;dbname=changingenieurs', 'changingenieurs', 'changin'); 
            $bdd->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
            $bdd->setAttribute(PDO::ATTR_EMULATE_PREPARES, false);
        }
        $stmt = $bdd->prepare("DELETE FROM intrants where nom = :nom");
        $stmt->bindParam(":nom", $_POST["nom"]);
        $stmt->execute();

        echo"<script language='javascript'>window.location = window.location</script>";
    }

    // get rows and we display them
    $stmt = $bdd->prepare("SELECT * FROM intrants");
    $stmt->execute();

    $intrants = $stmt->fetchAll();
    foreach ($intrants as $row) {
        $editing = False;
        echo "<form method=\"post\" action=\"/intrants\"><tr><td><label type=\"text\" for=\"nom\"></label><input readonly type=\"text\" class=\"nom\" name=\"nom\" value=\"";
        print $row["nom"];
        echo "\"></td><td><label for=\"expiration_date\"></label><input type=\"text\" name=\"expiration_date\" value=\"";
        print $row["expiration_date"];
        echo "\"></td><td><label type=\"text\" for=\"quantite\"></label><input type=\"text\" name=\"quantite\" value=\"";
        print $row["quantite"];
        echo "\"></td><td>";
        echo "<button type=\"submit\" name=\"edit\"><i class=\"far fa-edit\" style=\"color:blue\">Editer</i></button>";
        echo "<button type=\"submit\" name=\"delete\"><i class=\"fas fa-trash\" style=\"color:red\">Supprimer</i></button>";
        echo "</td></tr></form>";
    }

    echo "<form method=\"post\" action=\"/intrants\"><tr><td><label type=\"text\" for=\"add_nom\"></label><input type=\"text\" name=\"add_nom\" value=\"";
    echo "\"></td><td><label for=\"add_expiration_date\"></label><input type=\"text\" name=\"add_expiration_date\" value=\"";
    echo "\"></td><td><label type=\"text\" for=\"add_quantite\"></label><input type=\"text\" name=\"add_quantite\" value=\"";
    echo "\"></td><td>";
    echo "<button type=\"submit\" name=\"add\"><i class=\"fas fa-plus\" style=\"color:green\">Add</i></button>";
    echo "</td></tr></form>";

    if (isset($_POST['edit'])) {
        edit();
    } 
    if (isset($_POST['add'])) {
        add();
    }
    if (isset($_POST['delete'])) {
        delete();
    }

?>
        </tbody>
    </table>
</div>