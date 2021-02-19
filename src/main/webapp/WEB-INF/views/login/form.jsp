<!DOCTYPE html>
<html lang="fr">
<head>
	<base href="/ebook-web/" />
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link rel="stylesheet" href="assets/userform.css">
    <title>Connectez-vous</title>
</head>
<body>
    <form method= "POST">
        <h2>Connectez-vous</h2>
        <div class="form-body">
            
            <div class="form-group email">
                <label for="email">Votre E-mail : <span class="text-danger">*</span></label>
                <input required type="email" class="form-control" id="email" name = "email" placeholder="Adresse e-mail" />
            </div>
            <div class="form-group">
                <label for="password">Votre mot de passe : <span class="text-danger">*</span></label>
                <input required type="password" class="form-control" id="password" name = "password" placeholder="Mot de passe" />
            </div>


            <div class="form-submit">
                <button type="submit" class="submit-button-create">Se connecter</button>
                <button type="reset" class="submit-button-cancel">Annuler</button>
            </div>
          </div>
    </form>


</body>
</html>