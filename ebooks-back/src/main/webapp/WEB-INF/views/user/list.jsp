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
<title>Liste des utilisateurs</title>
</head>

<body>
	<div class="users-table-block">

		<h1>Liste des utilisateurs</h1>

		<table class="users-table">
			<c:forEach var="user" items="${ users }" varStatus="userStatus">
				<thead>

					<tr class="row-header">
						<th class="users-table">Pseudo</th>
						<th class="users-table">E-mail</th>
						<th class="users-table">Rang</th>
						<th class="users-table">Rôle</th>
						<th class="users-table">Prénom</th>
						<th class="users-table">Nom</th>
						<th class="users-table">Description</th>
						<th class="users-table">Date de naissance</th>

					</tr>

				</thead>
				<tbody>

					<tr class="row-content">
						<td class="test">${user.pseudo}</td>
						<td>${user.mail}</td>
						<td>${user.rank}</td>
						<td>${user.role}</td>
						<td>${user.firstname}</td>
						<td>${user.lastname}</td>
						<td>${user.description}</td>
						<td>${user.birthdate}</td>

			
						<td><a href="user/edit?id=${user.id}"><i
								class="lni lni-pencil-alt" alt="Icone éditer"></i> </a></td>
						<td><a href="user/delete/${user.id}"><i
								class="lni lni-trash" alt="Icone supprimer"></i> </a></td>
					</tr>
				</tbody>
			</c:forEach>
		</table>
		<div class="fakeButton"><a href="user/add">Ajouter un utilisateur</a></div>
	</div>
</body>
</html>