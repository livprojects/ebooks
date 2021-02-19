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

<link rel="stylesheet" href="assets/readall.css" >
<title>Liste des publications</title>
</head>

<body>
	<div class="typos-table-block">

		<h1>Liste des publications</h1>

		<table class="typos-table">

			<c:forEach var="publicationDetails" items="${ publicationDetails }">

				<thead>

					<tr class="row-header">
						
						<th class="typos-table">Auteur</th>
						<th class="typos-table">Titre</th>
						<th class="typos-table">Evaluations</th>
					</tr>

				</thead>
				<tbody>

					<tr class="row-content">
						<td class="test">${publicationDetails.user.id}</td>
						<td class="test">${publicationDetails.title}</td>
						<td class="test">${publicationDetails.ratings}</td>
						<%-- <td class="test">${publicationDetails.user}</td> --%>
						<td><a href="publication-details/edit?id=${publicationDetails.id }"><i
								class="lni lni-pencil-alt" alt="Icone �diter"></i> </a></td>
						<td><a href="publication-details/delete/${publicationDetails.id }"><i
								class="lni lni-trash" alt="Icone supprimer"></i> </a></td>
					</tr>
				</tbody>

			</c:forEach>
		</table>
		<div class="fakeButton"><a href="publication-details/add">Ajouter une publication</a></div>
	</div>
</body>
</html>