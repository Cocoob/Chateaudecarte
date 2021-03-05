<?php 
    try 
    {
        $bdd = new PDO("mysql:host=localhost;dbname=Formulaire;charset=utf8", "root", "root");
    }
    catch(Exception $e)
    {
        die('Erreur : '.$e->getMessage());
    }
?>