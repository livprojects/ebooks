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
<c:if test="${ publicationtext == null || publicationtext.id == 0}">
	<title>Créer une publication</title>
</c:if>
<c:if test="${ publicationtext != null && publicationtext.id != 0 }">
	<title>Modifier une publication</title>
</c:if>
</head>

<body>

	<c:if test="${ publicationtext == null || publicationtext.id == 0 }">
		<h2>Créer une publication</h2>
	</c:if>
	<c:if test="${ publicationtext != null && publicationtext.id != 0}">
		<h2>Modifier une publication</h2>
	</c:if>

	<form method="POST">

		<div class="form-body">

			<c:if test="${ error.hasErrors() }">
				<div class="alert alert-danger" role="alert">
					<ul>
						<c:forEach var="err" items="${ error.allErrors }">
							<li>${ err.defaultMessage }</li>
						</c:forEach>
					</ul>
				</div>
			</c:if>

			<div class="form-group author-id">

				<label for="author-id">Id de l'auteur :</label> <input type="number"
					class="form-control" name="user.id" id="author-id"
					value="${publicationtext.user.id}" />
			</div>
			<div class="form-group publi-content">
				<label for="content">Contenu : </label> <input type="text"
					class="form-control" name="content" id="content"
					value="${publicationtext.content}" />
			</div>

			<div class="form-group publi-id">
				<label for="chaptering">Numéro de chapitre : </label> <input
					type="number" class="form-control" name="chaptering"
					id="chaptering" value="${publicationtext.chaptering }" />
			</div>


			<div class="form-submit">
				<button type="reset" class="btn btn-annuler">Annuler</button>
 								<c:if test="${ publicationtext == null || publicationtext.id == 0 }">
					<button type="submit" class="btn btn-envoyer">Créer la
						publication</button>
				</c:if> 
				<c:if test="${publicationtext != null && publicationtext.id != 0 }">
					<button type="submit" class="btn btn-envoyer">Enregistrer
						les modifications</button>
				</c:if>
			</div>
		</div>
	</form>

</body>

</html>