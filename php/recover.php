<?php 
    require_once 'config.php';

    if(!empty($_GET['u']) && !empty($_GET['token']) ){
        $u = htmlspecialchars(base64_decode($_GET['u']));
        $token = htmlspecialchars(base64_decode($_GET['token']));

        $check = $bdd->prepare('SELECT * FROM Mdp_oublie WHERE Token_user = ? AND Token = ?');
        $check->execute(array($u, $token));
        $row = $check->rowCount();
        $data = $check->fetch();

        if($row){
            
            $get = $bdd->prepare('SELECT Token FROM Connexion WHERE Token = ?');
            $get->execute(array($u));
            $data_u = $get->fetch();

            if(hash_equals($data_u['Token'], $u)){

                header('Location: password_change.php?u='.base64_encode($u));
                die();
            }else{
                echo "Erreur : compte non valide";
            }
        }else{
            echo "Lien non valide";
        }
    }