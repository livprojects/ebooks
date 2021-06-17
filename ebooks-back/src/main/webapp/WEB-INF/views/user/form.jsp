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
<c:if test="${ user == null || user.id == 0 }">
	<title>Ajouter un utilisateur</title>
</c:if>
<c:if test="${ user != null && user.id != 0 }">
	<title>Modifier un utilisateur</title>
</c:if>
</head>

<body>

	<form method="POST">

		<c:if test="${user == null || user.id == 0 }">
			<h2>Ajouter un utilisateur</h2>
		</c:if>
		<c:if test="${ user != null && user.id != 0 }">
			<h2>Modifier un utilisateur</h2>
		</c:if>

		<c:if test="${ error.hasErrors() }">
			<div class="alert alert-danger" role="alert">
				<ul>
					<c:forEach var="err" items="${ error.allErrors }">
						<li>${ err.defaultMessage }</li>
					</c:forEach>
				</ul>
			</div>
		</c:if>

		<div class="form-body">
			<div class="form-group firstname">
				<label for="firstname">Prénom : </label> <input type="text"
					class="form-control" name="firstname" value="${user.firstname}"
					id="firstname" />
			</div>
			<div class="form-group familyname">
				<label for="familyname">Nom de famille : </label> <input type="text"
					class="form-control" name="lastname" value="${user.lastname}"
					id="familyname" />
			</div>
			<div class="form-group">
				<label for="userrole">Rôle :</label> <select class="form-control"
					name="role" id="userrole">

					<c:if test="${ user != null }">
						<option selected="selected" value="${user.role}">${user.role}</option>
					</c:if>
					<option value="Lecteur">Lecteur</option>
					<option value="Auteur">Auteur</option>
					<option value="Modérateur">Modérateur</option>
					<option value="Administrateur">Administrateur</option>
				</select>

			</div>

			<div class="form-group userpseudonym">
				<label for="userpseudonym">Pseudonyme :</label> <input type="text"
					class="form-control" name="pseudo" value="${user.pseudo}"
					id="userpseudonym" />
			</div>
			<div class="form-group email">
				<label for="email">E-mail :</label> <input type="email"
					class="form-control" name="mail" id="email" value="${user.mail}" />
			</div>

			<div class="form-group password">
				<label for="password">Mot de passe :</label> <input type="password"
					class="form-control" name="password" id="password"
					value="${user.password}" />
			</div>

			<div class="form-group">
				<label for="birthdate">Date de naissance :</label> <input
					type="date" class="form-control" name="birthdate" id="birthdate"
					value="${user.birthdate}" />
			</div>

			<div class="form-group">
				<label for="userrank">Rang :</label> <select class="form-control"
					name="rank" id="userrank">
					<c:if test="${ user != null }">
						<option selected="selected" value="${user.rank}">${user.rank}</option>
					</c:if>
					<option value="Poids plume">Poids plume</option>
					<option value="Plume montante">Plume montante</option>
					<option value="Plume acérée">Plume acérée</option>
				</select>
			</div>

			<div class="form-group userdescription">
				<label for="userdescription">Description :</label> <input
					type="text" class="form-control" name="description"
					id="userdescription" value="${ user.description }">
			</div>

			<div class="form-submit">
				<button type="reset" class="btn btn-annuler">Annuler</button>
				<c:if test="${ user == null || user.id == 0 }">
					<button type="submit" class="btn btn-envoyer">Ajouter
						l'utilisateur</button>
				</c:if>
				<c:if test="${ user != null && user.id != 0 }">
					<button type="submit" class="btn btn-envoyer">Enregistrer
						la modification</button>
				</c:if>
			</div>
		</div>
	</form>

</body>

</html>