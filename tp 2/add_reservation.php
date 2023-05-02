<?php


	include_once("config.php");
	session_start();

//recuperation des donnees formulaire
	$id= $_SESSION['id'];
	$date= $_POST['date'];
	$heure= $_POST['heure'];
	$id_salle= $_POST['id_salle'];
	
//requete pour savoir si une salle est deja utilisé
	$result =mysqli_query($mysqli,
				"SELECT date,heure,id_sal
				FROM creneau
				where date='$date'
				and heure='$heure'
				and id_sal='$id_salle';");


// regarde le resultat de la requete
		if(mysqli_num_rows($result) > 0)  {
 		echo "cette salle est deja prise a cette date";
 		header("location: reservation.php");
 	}


	
//insertion des donnees recuperé pour les rentrer dans la bdd
 	else{
 		$add = mysqli_query($mysqli, "INSERT INTO `creneau` (`id_creneau`, `date`, `heure`, `id_sal`, `id_us` ) 
								  VALUES (NULL, '$date', '$heure', '$id_salle', $id);");

		header("location: creneau.php");

 	}









?>