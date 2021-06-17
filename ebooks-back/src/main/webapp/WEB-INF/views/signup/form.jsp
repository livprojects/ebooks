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
<title>Inscription</title>
</head>

<body>


	<form method="POST">


		<h2>Inscription</h2>
		<p>Merci de remplir le formulaire suivant pour vous inscrire.</p>

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
			<div class="form-group"></div>

			<div class="form-group userpseudonym">
				<label for="userpseudonym">Pseudonyme :<span
					class="text-danger">*</span></label> <input type="text"
					class="form-control" name="pseudo" value="${user.pseudo}"
					id="userpseudonym" />
			</div>
			<div class="form-group email">
				<label for="email">E-mail :<span class="text-danger">*</span></label>
				<input type="email" class="form-control" name="mail" id="email"
					value="${user.mail}" />
			</div>

			<div class="form-group password">
				<label for="password">Mot de passe :<span
					class="text-danger">*</span></label> <input type="password"
					class="form-control" name="password" id="password"
					value="${user.password}" />
			</div>

			<div class="form-group">
				<label for="birthdate">Date de naissance :</label> <input
					type="date" class="form-control" name="birthdate" id="birthdate"
					value="${user.birthdate}" />
			</div>

			<div class="form-group userdescription">
				<label for="userdescription">Description :</label> <input
					type="text" class="form-control" name="description"
					id="userdescription" value="${ user.description }">
			</div>



			<div class="form-submit">
				<button type="reset" class="btn btn-annuler">Annuler</button>
				<button type="submit" class="btn btn-envoyer">S'inscrire</button>
			</div>
		</div>
	</form>

</body>

</html>