INSERT INTO TbLanguages (`language`)
VALUES ("French"),
("English");
INSERT INTO TbCountries (idLanguage,countryName)
VALUES ((SELECT idLanguage FROM TbLanguages WHERE `language` = "French") , "France"),
((SELECT idLanguage FROM TbLanguages WHERE `language` = "English") , "United Kingdom"),
((SELECT idLanguage FROM TbLanguages WHERE `language` = "English") , "United States"),
((SELECT idLanguage FROM TbLanguages WHERE `language` = "English") , "Hong Kong");

INSERT INTO TbUserTitles (titleName)
VALUES ("Plongeur"),
("Stagiaire"),
("Apprenti"),
("Second Commis"),
("Premier Commis"),
("Chef de Partie"),
("Second de Cuisine"),
("Chef de cuisine");

INSERT INTO TbUserTypes (userType)
VALUES ("Public"), -- Everybody can see the recipes you posted --
("Private"), -- You just want everything for yourself and nobody else --
("Shared"); -- Shared meaning the profile is just shared between you and your followers --
