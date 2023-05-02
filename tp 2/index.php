<?php
 session_start(); 
 ?>

<html>


	<head>
		<title>Connection</title>
	</head>

	<body>

		</form>
		<!-- css -->
		<link rel="stylesheet" type="text/css" href="css/index.css" />

    <!-- formulaire de connexion -->
    <form action="login.php" method="POST">
        <p>Login : <input type="text" name="login" /></p>
        <p>Mot de passe : <input type="password" name="mdp" /></p>
        <p><input type="submit" value="OK"></p>
    </form>
    <!-- fin du formulaire -->


	</body>

</html>