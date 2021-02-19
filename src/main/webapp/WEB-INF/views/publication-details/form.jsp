<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="fr">
<head>
<base href="/ebook-web/" />
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link
	href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;700&display=swap"
	rel="stylesheet">
<link rel="stylesheet" href="assets/genreTypoStyles.css">
<c:if test="${ publicationDetails.id == 0 || publicationDetails == null }">
	<title>Ajouter une nouvelle publication</title>
</c:if>

<c:if test="${ publicationDetails.id != 0 && publicationDetails != null }">
	<title>Modifier une publication</title>
</c:if>
</head>
<body>
	<div class="container">
		<c:if test="${ publicationDetails.id == 0 || publicationDetails == null }">
			<h1>Ajouter une nouvelle publication</h1>
		</c:if>
		<c:if test="${ publicationDetails.id != 0 && publicationDetails != null }">
			<h1>Modifier une publication</h1>
		</c:if>

		<c:if test="${ publicationDetails  == null }">
			<p>Veuillez remplir les champs indiqués afin d'ajouter une
				nouvelle publication</p>
		</c:if>
		<c:if test="${ publicationDetails != null }">
			<p>Veuillez remplir les champs indiqués afin de modifier une
				publication existante</p>
		</c:if>

		<!-- D�but du formulaire -->
		<form method="POST">

			<c:if test="${ error.hasErrors() }">
				<div class="alert alert-danger" role="alert">
					<ul>
						<c:forEach var="err" items="${ error.allErrors }">
							<li>${ err.defaultMessage }</li>
						</c:forEach>
					</ul>
				</div>
			</c:if>
			<div class="form-group">

				<div class="form-group author-id">

					<label for="author-id">Id de l'auteur :</label> <input
						type="number" class="form-control" name="user.id" id="author-id"
						value="${publicationDetails.user.id}" />
				</div>
				<label class="formulaire" for="title">Titre de la
					publication :</label>
				<!-- <label> Ajouter un type d'�crit</label>  -->
				<input type="text" class="form-text" id="title" name="title"
					value="${ publicationDetails.title }">
			</div>

			<div class="form-group">
				<label class="formulaire" for="ratings">Evaluations de la
					publication :</label>
				<!-- <label> Ajouter un type d'�crit</label>  -->
				<input type="text" class="form-text" id="ratings" name="ratings"
					value="${ publicationDetails.ratings }">
			</div>

			<div class="submit-group">
				<button type="reset" class="btn btn-annuler">Annuler</button>
				<c:if test="${ publicationDetails.id == 0 || publicationDetails == null  }">
					<button type="submit" class="btn btn-envoyer">Ajouter la
						publication</button>
				</c:if>
				<c:if test="${ publicationDetails.id != 0 && publicationDetails != null }">
					<button type="submit" class="btn btn-envoyer">Enregistrer
						la modification</button>
				</c:if>


			</div>
		</form>
	</div>


	<footer>
		<p>Copyright Ebooks</p>
	</footer>
</body>
</html>