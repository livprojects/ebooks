<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="fr">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://cdn.lineicons.com/2.0/LineIcons.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="assets/readAll.css">
    <title>Ebooks, votre espace littérature</title>
</head>

<body>
 

    <div class="users-table-block">
        <h2>Utilisateurs</h2>
    
        <table class="users-table">
          <c:forEach var="user" items="${ users }" varStatus= "userStatus">
            <thead>
          
                <tr class="row-header"> 
                    <th class="users-table">Pseudo </th>
                    <th class="users-table">E-mail </th>
                    <th class="users-table">Rang </th>
                    <th class="users-table">R�le </th>
                    
                    
                </tr>
               
            </thead>
            <tbody>
             
                <tr class="row-content">
                    <td class="test">${user.pseudo}</td>
                    <td>${user.mail}</td>
                    <td>${user.rank}</td>
                    <td>${user.role}</td>
                    <td><a href = "user-add"><i class="lni lni-circle-plus" alt="Icone ajouter"></i> </a> </td>
                    <td><a href = "user-edit?id=${user.id }"><i class="lni lni-pencil-alt" alt="Icone �diter"></i> </a> </td>
                    <td><a href = "user-delete?id=${user.id }"><i class="lni lni-trash" alt="Icone supprimer"></i> </a></td>
                </tr>
            </tbody>
         </c:forEach>
        </table>
    </div>

    <div class="typos-table-block">
        <h2>Types d'�crits</h2>
    
        <table class="users-table">
            <thead>
                <tr class="row-header">
                    <th class="users-table">Libell�</th>
                    <th class="users-table" colspan="3">Actions</th>
                </tr>
            </thead>
            <tbody>
                <tr open class="row-content">
                    <td>Pi�ces de th��tre</td>
                    <td><i class="lni lni-circle-plus" alt="Icone ajouter"></i></td>
                    <td><i class="lni lni-pencil-alt" alt="Icone �diter"></i></td>
                    <td><i class="lni lni-trash" alt="Icone supprimer"></i></td>
                </tr>

                <tr class="row-content">
                    <td>Romans</td>
                    <td><i class="lni lni-circle-plus" alt="Icone ajouter"></i></td>
                    <td><i class="lni lni-pencil-alt" alt="Icone �diter"></i></td>
                    <td><i class="lni lni-trash" alt="Icone supprimer"></i></td>
                </tr>
                <tr class="row-content">
                    <td>Po�sies</td>
                    <td><i class="lni lni-circle-plus" alt="Icone ajouter"></i></td>
                    <td><i class="lni lni-pencil-alt" alt="Icone �diter"></i></td>
                    <td><i class="lni lni-trash" alt="Icone supprimer"></i></td>
                </tr>
            </tbody>
        </table>



    </div>

    <div class="genres-table-block">
        <h2>Genres</h2>
    
        <table class="users-table">
        <c:forEach var="genre" items="${ genres }" varStatus= "genreStatus">
            <thead>
                <tr class="row-header">
                    <th class="users-table">Libell�</th>
                    <th class="users-table" colspan="3">Actions</th>
                </tr>
            </thead>
            <tbody>
                <tr class="row-content">
                    <td class="test">${genre.id}</td>
                    <td>${genre.label}</td>
                    <td><a href = "genre-add"><i class="lni lni-circle-plus" alt="Icone ajouter"></i> </a> </td>
                    <td><a href = "genre-edit?id=${genre.id }"><i class="lni lni-pencil-alt" alt="Icone �diter"></i> </a> </td>
                    <td><a href = "genre-delete?id=${genre.id }"><i class="lni lni-trash" alt="Icone supprimer"></i> </a></td>
                </tr>
            </tbody>
            </c:forEach>
        </table>
    </div>


    <details>
        <summary>Un utilisateur :</summary>
        <table>
            <thead>
                <tr class="row-header">
                    <th class="users-table">Pr�nom</th>
                    <th class="users-table">Nom</th>
                    <th class="users-table">Date de naissance</th>
                    <th class="users-table">Description</th>

                </tr>
            </thead>
            <tbody>
                <tr class="row-content">
                    <td>Gugusse</td>
                    <td>Premier</td>
                    <td>40/12/1965</td>
                    <td>Je suis un grand �crivain</td>
                </tr>
            </tbody>
            
        </table>
    </details> 


    <!-- >> Pseudo >> Email >> Rang >> R�le >> Ajouter >> Modifier >> Supprimer 
    >> Pr�nom >> Nom de famille >> Date de naissance >> 
    >> Description 
    >> Genres
    >> Libell� >> Ajouter >> Modifier >> Supprimer 
    >> Typologies 
    >> Libell� >> Ajouter >> Modifier >> Supprimer  -->


</body>

</html>