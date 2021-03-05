<?php 
    require_once 'config.php';

    if(!empty($_POST['pseudo']) && !empty($_POST['email']) && !empty($_POST['password']) && !empty($_POST['password_retype']) && !empty($_POST['nom']))
    {
        $pseudo = htmlspecialchars($_POST['pseudo']);
        $email = htmlspecialchars($_POST['email']);
        $password = htmlspecialchars($_POST['password']);
        $password_retype = htmlspecialchars($_POST['password_retype']);
        $nom = htmlspecialchars($_POST['nom']);

        $check = $bdd->prepare('SELECT * FROM Connexion WHERE Email = ?');
        $check->execute(array($email));
        $data = $check->fetch();
        $row = $check->rowCount();

        if($row == 0){ 
            if(strlen($pseudo) <= 100){
                if(strlen($email) <= 100){
                    if(filter_var($email, FILTER_VALIDATE_EMAIL)){
                        if($password == $password_retype){

                            $cost = ['cost' => 12];
                            $password = password_hash($password, PASSWORD_BCRYPT, $cost);
                            
                          

                            $insert = $bdd->prepare('INSERT INTO Connexion(Pseudo,Nom,Mdp,Email,Token) VALUES(:Pseudo, :Nom, :Mdp, :Email, :Token)');
                            $insert->execute(array(
                                'Pseudo' => $pseudo,
                                'Nom' => $nom,
                                'Mdp' => $password,
                                'Email' => $email,
                                'Token' => bin2hex(openssl_random_pseudo_bytes(24))
                            ));

                            header('Location:inscription.php?reg_err=success');
                            die();
                        }else{ header('Location: inscription.php?reg_err=password'); die();}
                    }else{ header('Location: inscription.php?reg_err=email'); die();}
                }else{ header('Location: inscription.php?reg_err=email_length'); die();}
            }else{ header('Location: inscription.php?reg_err=pseudo_length'); die();}
        }else{ header('Location: inscription.php?reg_err=already'); die();}
    }