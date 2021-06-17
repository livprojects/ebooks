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
<link rel="stylesheet" href="assets/userform.css">
<c:if test="${ typology.id == 0 || typology == null }">
	<title>Ajouter un type d'écrit</title>
</c:if>
<c:if test="${ typology != null && typology.id != 0}">
	<title>Modifier un type d'écrit</title>
</c:if>
<link rel="stylesheet" type="text/css"
	href="WEB-INF/assets/genreTypoStyles.css" />
</head>
<body>
	<div class="container">
		<c:if test="${ typology.id == 0 || typology == null }">
			<h1>Ajouter un type d'écrit</h1>
		</c:if>
		<c:if test="${ typology != null && typology.id != 0}">
			<h1>Modifier un type d'écrit</h1>
		</c:if>

		<c:if test="${ typology == null }">
			<p>Veuillez remplir les champs indiqués afin d'ajouter un nouveau
				type d'écrit.</p>
		</c:if>
		<c:if test="${ typology != null }">
			<p>Veuillez remplir les champs indiqués afin de modifier l'écrit
				que vous souhaitez éditer.</p>
		</c:if>

		<!-- DÃ©but du formulaire -->
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
				<label class="formulaire" for="label">Nom du type d'écrit :</label>
				<!-- <label> Ajouter un type d'Ã©crit</label>  -->
				<input type="text" class="form-text" id="label" name="label"
					value="${ typology.label }">
			</div>

			<div class="submit-group">
				<button type="reset" class="btn btn-annuler">Annuler</button>
				<c:if test="${ typology.id == 0 || typology == null }">
					<button type="submit" class="btn btn-envoyer">Ajouter le
						type d'écrit</button>
				</c:if>
				<c:if test="${ typology != null && typology.id != 0 }">
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