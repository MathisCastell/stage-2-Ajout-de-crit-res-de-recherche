# Ajout de critères de recherche sur l'écran recherche écriture

## Demande

![image](https://github.com/MathisCastell/stage-2-Ajout-de-crit-res-de-recherche/assets/148212506/a2b57d77-625b-40bf-9d14-02b03c66dedd)

## Page de recherche

J'ai dans un premier temps défini les différentes partie à ajouter du formulaire de recherche dans la première partie.

![image](https://github.com/MathisCastell/stage-2-Ajout-de-crit-res-de-recherche/assets/148212506/5ff05974-b1eb-44b0-ac77-9d80648467f1)

J'ai ensuite alimenté les listes déroulantes en faisant une requête SQL

![image](https://github.com/MathisCastell/stage-2-Ajout-de-crit-res-de-recherche/assets/148212506/4830e321-bbf1-4260-8974-b826c6c4b58e)

Et enfin j'ai affiché dans la page du formulaire  

![image](https://github.com/MathisCastell/stage-2-Ajout-de-crit-res-de-recherche/assets/148212506/28a140e6-7a3e-41c8-a9b2-390a7ef9b3ea)

Résultat 

![image](https://github.com/MathisCastell/stage-2-Ajout-de-crit-res-de-recherche/assets/148212506/6010e845-5f1f-4644-9a95-f5d27ff6881f)


## Page d'affichage

J'ai ajouté des éléments pour afficher les critères de recherche

![image](https://github.com/MathisCastell/stage-2-Ajout-de-crit-res-de-recherche/assets/148212506/97f864fd-debf-474a-80e8-0950a205d306)

## FONCTION SQL

Ajout de partie afin des les mettres par la suite dans le WHERE de la page d'affichage

WHEN 'frm_AssTr_EcGenerique_Recherche' THEN
      BEGIN
			  SET in_chaine :=  CONCAT(
                   -- Critere Catégorie comptable (position 2)
									CASE
											WHEN IFNULL(var_filtre_2,'') NOT IN ('', '-1') THEN CONCAT(" AND  ec.DateComptable &gt;='",IFNULL(var_filtre_2,''),"'")
											ELSE ""
										 END   
                  -- Critere Catégorie comptable (position 3)
									,	CASE
											WHEN IFNULL(var_filtre_3,'') NOT IN ('', '-1') THEN CONCAT(" AND  ec.DateComptable &lt;='",IFNULL(var_filtre_3,''),"'")
											ELSE ""
										 END  
                  -- Critere Catégorie comptable (position 5)
									,	CASE
											WHEN IFNULL(var_filtre_5,'') IN ('', '-1') THEN CONCAT(" AND ec.xCleComptable LIKE '54___' AND ec.fkLettrage IS NULL")
											WHEN IFNULL(var_filtre_5,'') NOT IN ('', '-1') THEN CONCAT(" AND  ec.xCleComptable='",IFNULL(var_filtre_5,''),"'")
											ELSE ""
										 END    
                     
                  -- Critere Montant Debit (position 8)
                  , CASE  
                      WHEN IFNULL(var_filtre_8,'') NOT IN ('', '-1') THEN CONCAT(" AND ec.MontantDebit &gt;=",IFNULL(var_filtre_8,''))
                      ELSE ""
                      END
                      
                  -- Critere Montant Debit (position 9)
                  , CASE  
                      WHEN IFNULL(var_filtre_9,'') NOT IN ('', '-1') THEN CONCAT(" AND ec.MontantDebit &lt;=",IFNULL(var_filtre_9,''))
                      ELSE ""
                      END
                 
                  -- Critere Montant Credit (position 11)
                  , CASE  
                      WHEN IFNULL(var_filtre_11,'') NOT IN ('', '-1') THEN CONCAT(" AND ec.MontantCredit &gt;='",IFNULL(var_filtre_11,''),"'")
                      ELSE ""
                      END
                      
                  -- Critere Montant Credit (position 12)
                  , CASE  
                      WHEN IFNULL(var_filtre_12,'') NOT IN ('', '-1') THEN CONCAT(" AND ec.MontantCredit &lt;='",IFNULL(var_filtre_12,''),"'")
                      ELSE ""
                      END
                  
                  -- Critere Statut (position 15)
                  , CASE 
                      WHEN IFNULL(var_filtre_15,'') NOT IN ('', '-1') THEN CONCAT(" AND op.xStatut='",IFNULL(var_filtre_15,''),"'")
                      ELSE ""
                      END
                  
                  -- Critere Catégorie comptable (position 20)
									,	CASE
											WHEN IFNULL(var_filtre_20,'') NOT IN ('', '-1') THEN CONCAT(" AND  op.DCreation &gt;='",IFNULL(var_filtre_20,''),"'")
											ELSE ""
										 END   
                  -- Critere Catégorie comptable (position 21)
									,	CASE
											WHEN IFNULL(var_filtre_21,'') NOT IN ('', '-1') THEN CONCAT(" AND  op.DCreation &lt;='",IFNULL(var_filtre_21,''),"'")
											ELSE ""
										 END 
                  
								);
      END;    
