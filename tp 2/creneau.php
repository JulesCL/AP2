<?php
	session_start();
?>

<html>
<head>
	<title>reservation</title>
</head>
<body>
	<!-- deconnexion-->
<a href="deconnexion.php">deconnexion</a>

<!-- boutton back -->
</br><a href="reservation.php">Retour en arrière</a>

<!-- css -->
		<link rel="stylesheet" type="text/css" href="css/creneau.css" />

<!-- creation du tableau-->	
	<table id="tableau" data-responsive="table">
	<thead>
		<!-- colonne -->
		<tr>
			<th>Date</th>
			<th>Heure</th>
			<th>Salle reserver</th>
			
		</tr>
	</thead>
	<tbody>
			<?php
				include_once('config.php');

				//recuperation de toutes les lignes dans la bdd
				$result =mysqli_query($mysqli,
				"SELECT *
				FROM creneau
				inner join salle on creneau.id_sal=salle.id_salle 
				ORDER BY date");


// met les valeurs recuperer dans une ligne
while($res = mysqli_fetch_array($result)) {
echo "<tr>";
echo "<td>".$res['date']."</td>";
echo "<td>".$res['heure']."</td>";
echo "<td>".$res['nom_salle']."</td>";


}




?>
			
		
	</tbody>
</table>
</body>
</html>