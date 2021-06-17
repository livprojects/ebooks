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
<c:if test="${ genre == null || genre.id == 0 }">
	<title>Ajouter un nouveau genre</title>
</c:if>
<c:if test="${ genre != null && genre.id != 0 }">
	<title>Modifier un genre</title>
</c:if>
<body>
	<div class="container">
		<c:if test="${ genre == null || genre.id == 0 }">
			<h1>Ajouter un nouveau genre</h1>
		</c:if>
		<c:if test="${ genre != null && genre.id != 0 }">
			<h1>Modifier un genre</h1>
		</c:if>

		<c:if test="${ genre == null || genre.id == 0 }">
			<p>Veuillez remplir les champs indiqués afin d'ajouter un nouveau
				genre.</p>
		</c:if>
		<c:if test="${ genre != null && genre.id != 0 }">
			<p>Veuillez remplir les champs indiqués afin de modifier un genre
				existant</p>
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

				<label class="formulaire" for="label">Nom du genre :</label>
				<!-- <label> Ajouter un type d'�crit</label>  -->
				<input type="text" class="form-text" id="label" name="label"
					value="${ genre.label }">
			</div>

			<div class="submit-group">
				<button type="reset" class="btn btn-annuler">Annuler</button>
				<c:if test="${ genre == null || genre.id == 0 }">
					<button type="submit" class="btn btn-envoyer">Ajouter le
						genre</button>
				</c:if>
				<c:if test="${ genre != null && genre.id != 0 }">
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