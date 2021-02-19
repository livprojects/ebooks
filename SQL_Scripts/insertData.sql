INSERT INTO user (USER_MAIL, USER_PASSWORD, USER_PSEUDO, USER_FIRSTNAME, USER_LASTNAME, USER_BIRTHDATE, USER_DESCRIPTION)
VALUES
('test@yopmail.com', 'blabladu52', 'testdu52', 'Test', 'TestNom', '1990-06-05', 'Ceci est une description.'), 
('saraya@chak.com', 'sarayachak', 'sarayatest', 'Saraya', 'Chak', '1994-01-23', 'Ceci est une description de Saraya'), 
('liv@liv.com', 'blabladu72', 'testtestallotest', 'Liv', 'Livnom', '1994-03-05', 'Ceci est une description de Liv.'), 
('virgo@despentes.com', 'blabladespentes', 'alloicidespentes', 'Virginie', 'Despentes', '1975-04-05', 'Ceci est une description de Virginie Despentes.'); 


INSERT INTO publication_details (AUTHOR_ID, PUBLICATION_TITLE, RATINGS)
VALUES
(1, 'Ceci est un titre', 4), 
(2, 'Ceci est un titre de Saraya', 3), 
(3, 'Ceci est un titre de Liv', 5), 
(4, 'Ceci est un titre de Virginie', 2); 

INSERT INTO publication_text (AUTHOR_ID, PUBLICATION_CONTENT, CHAPTERING)
VALUES
(1, 'Ceci est un texte de publication', 1), 
(2, 'Il était une fois...Une Base de données', 1),
(2, 'Il était une fois...Une base de données avec des inserts', 2),
(3, 'Il était une fois...Une base de données trop cool en MySQL...', 1), 
(4, 'Ceci est le premier chapitre du livre de Virginie Despentes', 1); 

INSERT INTO typology (TYPOLOGY_LABEL)
VALUES
('Article'), 
('Nouvelle'), 
('Poésie'), 
('Roman'), 
('Pièce de théâtre'); 

INSERT INTO genre (GENRE_LABEL)
VALUES
('Policier'), 
('Romance'), 
('Horreur'), 
('Drame'), 
('Humour'); 

INSERT INTO institutions (INSTITUTION_LABEL)
VALUES
('Prix Goncourt'), 
('Prix Nobel de littérature'), 
('Prix Senghor'), 
('Prix Première'),
('Prix Renaudot'),
('Prix Femina'); 

INSERT INTO author_publications (AUPU_AUTHOR_ID, AUPU_PUBLICATION_ID)
VALUES
(1, 1), 
(2, 2), 
(3, 3), 
(4, 4); 

INSERT INTO genre_publications (GEPU_GENRE_ID, GEPU_PUBLICATION_ID)
VALUES
(1, 1), 
(2, 2), 
(3, 3), 
(4, 4),
(5, 1); 

INSERT INTO typology_publications (TYPU_TYPOLOGY_ID, TYPU_PUBLICATION_ID)
VALUES
(1, 1), 
(1, 3), 
(3, 4); 