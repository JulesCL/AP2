<?php 

session_start();
?>
<!-- css -->
<link rel="stylesheet" type="text/css" href="css/modification_salle.css" />

<!-- deconnexion -->
<a href="deconnexion.php">deconnexion</a>

<!-- boutton back -->
</br><a href="admin.php">Retour en arrière</a>

<!-- creation du tableau -->
<table id="tableau" data-responsive="table">
	<thead>
		<!-- colonne -->
		<tr>
			
			<th>Numero</th>
			<th>Nom des salles</th>
			
			<!-- boutton pour rajouter une salle -->
			<th> <a href="ajouter_salle.php">ajouter une salle</a></th>
			<th> </th>
			
		</tr>
	</thead>
	<tbody>

<?php

				//recuperation de toutes les lignes dans la bdd
				include('config.php');
				$result =mysqli_query($mysqli,
					"SELECT *
					FROM salle;");
				

// met les valeurs recuperer dans une ligne
while($res = mysqli_fetch_array($result)) {
echo "<tr>";
echo "<td>".$res['id_salle']."</td>";
echo "<td>".$res['nom_salle']."</td>";

// boutton pour modifier une salle
echo "<td><a href=\"mod_salle.php?id=$res[id_salle]&nom=$res[nom_salle]\">Modifier </a>";

// boutton pour supprimer une salle
echo "<td><a href=\"suppression.php?id=$res[id_salle]\">Supprimer</a>";


}
?>


			


</tbody>
</table>
</body>
</html>

