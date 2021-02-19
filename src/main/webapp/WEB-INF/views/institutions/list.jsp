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
<title>Liste des institutions</title>
</head>

<body>
	<div class="typos-table-block">

		<h1>Liste des institutions</h1>

		<table class="typos-table">

			<c:forEach var="institution" items="${ institutions }">

				<thead>

					<tr class="row-header">
						<th class="typos-table">ID</th>
						<th class="typos-table">Intitulé</th>
					</tr>

				</thead>
				<tbody>

					<tr class="row-content">
						<td class="test">${institution.id}</td>
						<td class="test">${institution.label}</td>
						<td><a href="institutions/edit?id=${institution.id }"><i
								class="lni lni-pencil-alt" alt="Icone éditer"></i> </a></td>
						<td><a href="institutions/delete/${institution.id }"><i
								class="lni lni-trash" alt="Icone supprimer"></i> </a></td>
					</tr>
				</tbody>

			</c:forEach>
		</table>
		<div class="fakeButton"><a href="institutions/add">Ajouter une institution</a></div>
	</div>
</body>
</html>