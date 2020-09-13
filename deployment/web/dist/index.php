<head>
  <!-- Latest compiled and minified CSS -->
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
  <!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css"> -->
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <script src="https://kit.fontawesome.com/a350d9b3a7.js" crossorigin="anonymous"></script>
</head>


<ul>
  <li><a href="/">Accueil</a></li>
  <li><a href="/intrants">Intrants</a></li>
</ul>

<style>

  ul {
    list-style-type: none;
    margin: 0;
    margin-bottom: 15px;
    padding: 0;
    overflow: hidden;
    background-color: #333;
  }

  li {
    float: left;
  }

  li a {
    display: block;
    color: white;
    text-align: center;
    padding: 14px 16px;
    text-decoration: none;
  }

  /* Change the link color to #111 (black) on hover */
  li a:hover {
    background-color: #111;
  }

  html {
      margin: 25px;
  }

</style>

<?php

$request = $_SERVER['REQUEST_URI'];

$parsed_url = parse_url($request);
$path     = isset($parsed_url['path']) ? $parsed_url['path'] : ''; 
$query    = isset($parsed_url['query']) ? $parsed_url['query'] : ''; 

switch ($path) {
    case '/' :
        require __DIR__ . '/views/accueil.php';
        break;
    case '/fiche' :
        require __DIR__ . '/views/fiche.php';
        break;
    case '/intrants' :
        require __DIR__ . '/views/intrants.php';
        break;
    case '/link' :
        require __DIR__ . '/views/link.php'; 
    default:
        http_response_code(404);
        require __DIR__ . '/views/index.php';
        break;
}
