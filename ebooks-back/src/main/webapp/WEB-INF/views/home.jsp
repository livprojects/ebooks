<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="fr">
<head>
<base href="/ebook-web/" />
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Ebooks : la plateforme pour les amateurs de fictions en
	tous genres !</title>
<link rel="preconnect" href="https://fonts.gstatic.com">
<link
	href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;700&family=Satisfy&display=swap"
	rel="stylesheet">
<link rel="stylesheet" type="text/css" href="assets/homepageStyles.css" />
</head>
<body>

	<div class="main-content-block">

		<div class="header">
			<!-- Menu de navigation -->
			<nav class="eb-navmenu">
				<a href="/ebook-web/publication-details"
					class="nav-button menu-item"> Dernières publications</a> <a
					href="/ebook-web/genre" class="nav-button menu-item">
					Catégories de fictions </a> <a href="/ebook-web/typology"
					class="nav-button menu-item"> Types d'écrits </a> <a
					href="/ebook-web/institutions" class="nav-button menu-item">
					Nos institutions</a> <a href="#information"
					class="nav-button menu-item"> Qui sommes-nous ?</a> <a
					href="#contact" class="nav-button menu-item"> Contact</a>

			</nav>


			<!-- Partie inscription et connexion -->

			<div id="authentification">
				<c:if test="${ isLogged == null }">

					<div>
						<form action="http://localhost:8080/ebook-web/signup">
							<button class="btn-signup">Inscription</button>
						</form>

					</div>
				</c:if>


				<div>
					<c:if test="${ isLogged == null }">
						<form action="http://localhost:8080/ebook-web/login">
							<button class="btn-signin">Connexion</button>

						</form>
					</c:if>
					<%@ page pageEncoding="UTF-8"%>
					<c:if test="${ isLogged == true }">
						<p>Bonjour ${ email } !!</p>
					</c:if>

				</div>

				<div>
					<form action="http://localhost:8080/ebook-web/logout">
						<button class="btn-signin">Déconnexion</button>
					</form>
				</div>
			</div>
		</div>



		<!-- Nav bar -->


		<h1>Ebooks</h1>

		<!-- Centre de la page : Bienvenue et tuto -->
		<section class="eb-container">
			<h2>Ebooks : la plateforme pour les amateurs de fictions en tous
				genres !</h2>

			<p class="welcome">Lorem ipsum dolor sit amet consectetur
				adipisicing elit. Perspiciatis non voluptatum laborum totam
				doloribus? Quam odio provident magnam veritatis numquam, quibusdam
				earum excepturi dolore voluptate! Quibusdam nisi fugit quo est.
				Lorem ipsum ad minim ven. Lorem ipsum dolor sit amet. Lorem ipsum
				dolor sit amet consectetur adipisicing elit. Perspiciatis non
				voluptatum laborum totam doloribus? Quam odio provident magnam
				veritatis numquam, quibusdam earum excepturi dolore voluptate!
				Quibusdam nisi fugit quo est. Lorem ipsum ad minim ven. Lorem ipsum
				dolor sit amet.</p>

			<p class="welcome">Lorem ipsum dolor sit amet consectetur
				adipisicing elit. Perspiciatis non voluptatum laborum totam
				doloribus? Quam odio provident magnam veritatis numquam, quibusdam
				earum excepturi dolore voluptate! Quibusdam nisi fugit quo est.
				Lorem ipsum ad minim ven. Lorem ipsum dolor sit amet. Lorem ipsum
				dolor sit amet consectetur adipisicing elit. Perspiciatis non
				voluptatum laborum totam doloribus? Quam odio provident magnam
				veritatis numquam, quibusdam earum excepturi dolore voluptate!
				Quibusdam nisi fugit quo est. Lorem ipsum ad minim ven. Lorem ipsum
				dolor sit amet.</p>

			<h2>Débutez votre aventure chez Ebooks !</h2>

			<p>Accédez dès maintenant aux écrits de nos membres.</p>

			<p>Partagez également vos propres oeuvres et passez de poids
				plume à plume acérée en un rien de temps.</p>

			<p>Lorem ipsum dolor sit amet consectetur adipisicing elit.
				Perspiciatis non voluptatum laborum totam doloribus? Quam odio
				provident magnam veritatis numquam, quibusdam earum excepturi dolore
				voluptate! Quibusdam nisi fugit quo est. Lorem ipsum ad minim ven.
				Lorem ipsum dolor sit amet.</p>


		</section>

	</div>


	<!-- Footer contact et CopyRight -->
	<footer class="contact-copyright"> Copyright Ebooks </footer>


</body>
</html>