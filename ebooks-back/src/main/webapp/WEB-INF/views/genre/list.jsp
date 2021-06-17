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

<link href="assets/readall.css" rel="stylesheet">
<title>Liste des genres</title>
</head>

<body>
	<div class="typos-table-block">

		<h1>Liste des genres</h1>

		<table class="typos-table">

			<c:forEach var="genre" items="${ genres }">

				<thead>

					<tr class="row-header">
						<th class="typos-table">ID</th>
						<th class="typos-table">Intitulé</th>
					</tr>

				</thead>
				<tbody>

					<tr class="row-content">
						<td class="test">${genre.id}</td>
						<td class="test">${genre.label}</td>
						<td><a href="genre/edit?id=${genre.id}"><i
								class="lni lni-pencil-alt" alt="Icone éditer"></i> </a></td>
						<td><a href="genre/delete/${genre.id}"><i
								class="lni lni-trash" alt="Icone supprimer"></i> </a></td>
					</tr>
				</tbody>

			</c:forEach>
		</table>
		<div class="fakeButton"><a href="genre/add">Ajouter un genre</a></div>
	</div>
</body>
</html>