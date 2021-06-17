<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<base href="/ebook-web/" />
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link
	href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;700&display=swap"
	rel="stylesheet">
<link href="https://cdn.lineicons.com/2.0/LineIcons.css"
	rel="stylesheet">

<link rel="stylesheet" href="assets/readall.css">
<title>Liste des publications</title>
</head>

<body>
	<div class="publis-table-block">

		<h1>Liste des publications</h1>

		<table class="publications-table">

			<c:forEach var="publicationtext" items="${ publicationtexts }">

				<thead>

					<tr class="row-header">
						<th class="typos-table">ID de l'auteur</th>
						<th class="typos-table">Contenu</th>
						<th class="typos-table">Numéro de chapitre</th>

					</tr>

				</thead>
				<tbody>

					<tr class="row-content">
						<td class="test">${publicationtext.user.id}</td>
						<td class="test">${publicationtext.content}</td>
						<td class="test">${publicationtext.chaptering}</td>
						<td><a href="publication-text/edit?id=${publicationtext.id }"><i
								class="lni lni-pencil-alt" alt="Icone �diter"></i> </a></td>
						<td><a href="publication-text/delete/${publicationtext.id }"><i
								class="lni lni-trash" alt="Icone supprimer"></i> </a></td>
					</tr>
				</tbody>

			</c:forEach>
		</table>
		<div class="fakeButton">
			<a href="publication-text/add">Ajouter une publication</a>
		</div>

	</div>

</body>
</html>