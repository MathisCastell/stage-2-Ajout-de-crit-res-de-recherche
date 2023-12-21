DROP FUNCTION IF EXISTS egd.fn_Cpta_ExtractStringToSQL;
CREATE FUNCTION egd.`fn_Cpta_ExtractStringToSQL`(in_frm        VARCHAR(50)
                                              , in_filtreName   TEXT) RETURNS text CHARSET utf8
    READS SQL DATA
    SQL SECURITY INVOKER
    COMMENT 'Conversion ExtractString en Clause Where pour les courriers reçu'
BEGIN
    -- Cette fonction renverra la clause WHERE ...
    DECLARE in_chaine TEXT;
    DECLARE var_filtre_1, var_filtre_2, var_filtre_3, var_filtre_4 ,var_filtre_5             VARCHAR(256);
    DECLARE var_filtre_6, var_filtre_7, var_filtre_8, var_filtre_9 ,var_filtre_10            VARCHAR(256);
    DECLARE var_filtre_11, var_filtre_12, var_filtre_13, var_filtre_14, var_filtre_15        VARCHAR(256);
    DECLARE var_filtre_16, var_filtre_17, var_filtre_18, var_filtre_19, var_filtre_20        VARCHAR(256);
    DECLARE var_filtre_21                                                                    VARCHAR(256);

	    -- Les différents filtres
      -- doubler les simple quote pour la concaténation de chaine avec un simple quote
    SET var_filtre_1    := REPLACE(ExtractString(in_filtreName, '|', 1), "'", "''");
    SET var_filtre_2    := REPLACE(ExtractString(in_filtreName, '|', 2), "'", "''"); 
    SET var_filtre_3    := REPLACE(ExtractString(in_filtreName, '|', 3), "'", "''");
    SET var_filtre_4    := REPLACE(ExtractString(in_filtreName, '|', 4), "'", "''");
    SET var_filtre_5    := REPLACE(ExtractString(in_filtreName, '|', 5), "'", "''");
    SET var_filtre_6    := REPLACE(ExtractString(in_filtreName, '|', 6), "'", "''"); 
    SET var_filtre_7    := REPLACE(ExtractString(in_filtreName, '|', 7), "'", "''");
    SET var_filtre_8    := REPLACE(ExtractString(in_filtreName, '|', 8), "'", "''");
    SET var_filtre_9    := REPLACE(ExtractString(in_filtreName, '|', 9), "'", "''");
    SET var_filtre_10   := REPLACE(ExtractString(in_filtreName, '|', 10), "'", "''"); 
    SET var_filtre_11   := REPLACE(ExtractString(in_filtreName, '|', 11), "'", "''");
    SET var_filtre_12   := REPLACE(ExtractString(in_filtreName, '|', 12), "'", "''");
    SET var_filtre_13   := REPLACE(ExtractString(in_filtreName, '|', 13), "'", "''");
    SET var_filtre_14   := REPLACE(ExtractString(in_filtreName, '|', 14), "'", "''"); 
    SET var_filtre_15   := REPLACE(ExtractString(in_filtreName, '|', 15), "'", "''");
    SET var_filtre_16   := REPLACE(ExtractString(in_filtreName, '|', 16), "'", "''");
    SET var_filtre_17   := REPLACE(ExtractString(in_filtreName, '|', 17), "'", "''");
    SET var_filtre_18   := REPLACE(ExtractString(in_filtreName, '|', 18), "'", "''"); 
    SET var_filtre_19   := REPLACE(ExtractString(in_filtreName, '|', 19), "'", "''");
    SET var_filtre_20   := REPLACE(ExtractString(in_filtreName, '|', 20), "'", "''");
    SET var_filtre_21   := REPLACE(ExtractString(in_filtreName, '|', 21), "'", "''");
  
    -- ATTENTION, pour éviter le sproblèmes d'intérprétation dans PHP, utiliser simple quote ' pour entourer une chaîne de carcatères

  CASE in_frm
    WHEN 'frm_AssTr_ObActeGestionPat_List_filtre' THEN
      BEGIN
			  SET in_chaine :=  CONCAT(
              	  -- Critere Protégé (position 1)
                    CASE
                      WHEN IFNULL(var_filtre_1,'') NOT IN ('', '-1') THEN CONCAT(" AND o.fkdossier=",IFNULL(var_filtre_1,''))
                      ELSE ""
                      END
              	  -- Critere Entité (position 2)
                  , CASE
                      WHEN IFNULL(var_filtre_2,'') NOT IN ('', '-1') THEN CONCAT(" AND d.fkEntite='",IFNULL(var_filtre_2,''),"'")
                      ELSE ""
                      END
              	  -- Critere Mjpm (position 3)
                  , CASE
                      WHEN IFNULL(var_filtre_3,'') NOT IN ('', '-1') THEN CONCAT(" AND d.fkUserTuteur='",IFNULL(var_filtre_3,''),"'")
                      ELSE ""
                      END
              	  -- Critere Nature (position 4)
                  , CASE
                      WHEN IFNULL(var_filtre_4,'') NOT IN ('', '-1') THEN CONCAT(" AND o.xNature='",IFNULL(var_filtre_4,''),"'")
                      ELSE ""
                      END
              	  -- Critere Statut (position 5)
                  , CASE 
                      WHEN IFNULL(var_filtre_5,'') NOT IN ('')       THEN CONCAT(" AND o.Statut='",IFNULL(var_filtre_5,''),"'")
                      ELSE ""
                      END
              	  -- Critere DateDebut (position 6)
                  , CASE
                      WHEN IFNULL(var_filtre_6,'') NOT IN ('')       THEN CONCAT(" AND (ISNULL(o.DateDebut) OR o.DateDebut &gt; '",IFNULL(var_filtre_6,''),"' OR o.DateDebut = '",IFNULL(var_filtre_6,''),"')")
                      ELSE ""
                      END
              	  -- Critere DateFin (position 7)
                  , CASE
                      WHEN IFNULL(var_filtre_7,'') NOT IN ('', '-1') THEN CONCAT(" AND (ISNULL(o.DateFin) OR ((o.DateFin &lt; '",IFNULL(var_filtre_7,''),"' OR o.DateFin = '",IFNULL(var_filtre_7,''),"') AND o.DateFin &gt; '",IFNULL(var_filtre_6,''),"'))")
                      ELSE ""
                      END
              	  -- Critere Recherche (position 8)
                  , CASE 
                      WHEN IFNULL(var_filtre_8,'') NOT IN ('', '-1') THEN CONCAT(" AND (o.Reference like '%",IFNULL(var_filtre_8,''),"%' OR o.Intitule like '%",IFNULL(var_filtre_8,''),"%' OR o.Commentaires like '%",IFNULL(var_filtre_8,''),"%')")
                      ELSE ""
                      END
              	  -- Critere En charge (position 9)
                  , CASE
                      WHEN IFNULL(var_filtre_9,'') NOT IN ('', '-1') THEN CONCAT(" AND (d.fkUserTuteur='",IFNULL(var_filtre_9,''),"' OR d.fkUserAdmin='",IFNULL(var_filtre_9,''),"' OR d.fkUserCompta='",IFNULL(var_filtre_9,''),"' OR d.fkUserPatrim='",IFNULL(var_filtre_9,''),"' OR d.fkUserJuridi='",IFNULL(var_filtre_9,''),"')")
                      ELSE ""
                      END
                  -- Critere Etat dossier (position 10)
                  , CASE 
                      WHEN IFNULL(var_filtre_10,'') NOT IN ('', '-1') THEN CONCAT(" AND d.TopArchive='",IFNULL(var_filtre_10,''),"'")
                      ELSE ""
                      END
                );
      END;
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
    WHEN 'frm_EcGenerique_Recherche' THEN
      BEGIN
			  SET in_chaine :=  CONCAT(
                  -- ********************  1) critères indépendants de la nature de l'écriture
                  -- Critere Date comptable (position 1 à 3)
										CASE
											WHEN IFNULL(var_filtre_1,'') NOT IN ('', '-1') THEN CONCAT(" AND ec.DateComptable='", IFNULL(var_filtre_1,''),"'")
											WHEN (IFNULL(var_filtre_2,'') NOT IN ('', '-1') AND IFNULL(var_filtre_3,'') !='') THEN CONCAT(" AND ec.DateComptable BETWEEN '", IFNULL(var_filtre_2,''), "' AND '", IFNULL(var_filtre_3,''), "'")
											ELSE ""
										 END                                         
                  -- Critere Date de création (position 19 à 21)
                  , CASE
											WHEN IFNULL(var_filtre_19,'') NOT IN ('', '-1') THEN CONCAT(" AND DATE(ec.DCreation)='", IFNULL(var_filtre_19,''),"'")
											WHEN (IFNULL(var_filtre_20,'') NOT IN ('', '-1') AND IFNULL(var_filtre_21,'') NOT IN ('', '-1')) THEN CONCAT(" AND DATE(ec.DCreation) BETWEEN '", IFNULL(var_filtre_20,''), "' AND '", IFNULL(var_filtre_21,''), "'")
											ELSE ""
										 END
                 -- Critere Libellé (position 6)   
									,	CASE
											WHEN IFNULL(var_filtre_6,'') NOT IN ('', '-1') THEN CONCAT(" AND  ( op.Libelle LIKE '%", IFNULL(var_filtre_6,''), "%'" 
                                                                                    ," OR op.Commentaires LIKE '%", IFNULL(var_filtre_6,''), "%'" 
                                                                                    ," OR ec.Libelle LIKE '%", IFNULL(var_filtre_6,''), "%'" 
                                                                                ," )"
                                                                                )
											ELSE ""
										 END
                  -- Critere Montant Debit (position 7 à 9)
                  , CASE
											WHEN IFNULL(var_filtre_7,'') NOT IN ('', '-1') THEN CONCAT(" AND IF(ec.xCleComptable LIKE '54___', ec.MontantCredit, ec.MontantDebit)=",CAST(IFNULL(var_filtre_7,'')AS DECIMAL(10,2))
                                                                                ," AND IF(ec.xCleComptable LIKE '54___', ec.MontantDebit, ec.MontantCredit) = 0"
                                                                                )
											WHEN (IFNULL(var_filtre_8,'') NOT IN ('', '-1') AND IFNULL(var_filtre_9,'') NOT IN ('', '-1')) THEN CONCAT(" AND IF(ec.xCleComptable LIKE '54___', ec.MontantCredit, ec.MontantDebit)"
                                                                                                                             ," BETWEEN ",  CAST(IFNULL(var_filtre_8,'')AS DECIMAL(10,2))
                                                                                                                             ," AND ", CAST(IFNULL(var_filtre_9,'')AS DECIMAL(10,2))
                                                                                                                             ," AND IF(ec.xCleComptable LIKE '54___', ec.MontantDebit, ec.MontantCredit) = 0"
                                                                                                                             )
											ELSE ""
										 END
                  -- Critere Montant Credit (position 10 à 12)
                  , CASE
											WHEN IFNULL(var_filtre_10,'') NOT IN ('', '-1') THEN CONCAT(" AND IF(ec.xCleComptable LIKE '54___', ec.MontantDebit, ec.MontantCredit)=",CAST(IFNULL(var_filtre_10,'')AS DECIMAL(10,2))
                                                                                ," AND IF(ec.xCleComptable LIKE '54___', ec.MontantCredit, ec.MontantDebit) = 0"
                                                                                )
											WHEN (IFNULL(var_filtre_11,'') NOT IN ('', '-1') AND IFNULL(var_filtre_12,'') NOT IN ('', '-1')) THEN CONCAT(" AND IF(ec.xCleComptable LIKE '54___', ec.MontantDebit, ec.MontantCredit)"
                                                                                                                   ," BETWEEN ",  CAST(IFNULL(var_filtre_11,'')AS DECIMAL(10,2))
                                                                                                                   ," AND ", CAST(IFNULL(var_filtre_12,'')AS DECIMAL(10,2))
                                                                                                                   ," AND IF(ec.xCleComptable LIKE '54___', ec.MontantCredit, ec.MontantDebit) = 0"
                                                                                                                   )
											ELSE ""
										 END

                  -- Critere Mode de paiement (position 13)  
									,	CASE WHEN IFNULL(var_filtre_13,'') NOT IN ('', '-1') THEN CONCAT(" AND op.xModePaiement='",IFNULL(var_filtre_13,''),"'")
											 ELSE ""
										END
                  -- Critere Num de piece (position 14)
									,	CASE WHEN IFNULL(var_filtre_14,'') NOT IN ('', '-1') THEN CONCAT(" AND op.Numpiece LIKE '%",IFNULL(var_filtre_14,''),"%'")
											 ELSE ""
										END
                  -- Critere Statut (position 15)
									,	CASE WHEN IFNULL(var_filtre_15,'') NOT IN ('', '-1') THEN CONCAT(" AND op.xStatut='",IFNULL(var_filtre_15,''),"'")
											 ELSE ""
										END
                  -- Critere Correspondant (position 17)
									,	CASE WHEN IFNULL(var_filtre_17,'') NOT IN ('', '-1') THEN CONCAT(" AND op.fkTiers=",IFNULL(var_filtre_17,''))
											 ELSE ""
										END
                  /*-- Critere CompteBancaire (position 4)
									,	CASE WHEN IFNULL(var_filtre_4,'') IN ('', '-1')  THEN
                          CASE WHEN IFNULL(var_filtre_5,'') IN ('', '-1') AND IFNULL(var_filtre_16,'') IN ('', '-1') AND IFNULL(var_filtre_18,'') IN ('', '-1')
                            -- si pas de critère compte bancaire(4) => on ne prend que les ec en 54__0 et 54__1 non lettrées
                            THEN  " AND ( (  ec.xCleComptable LIKE '54__0' OR ec.xCleComptable LIKE '54__1') AND ec.fkLettrage IS NULL) "
                            ELSE ""
                          END
											 ELSE 
                           CONCAT (" AND (   (  ec.xCleComptable = '", LEFT(IFNULL(var_filtre_4,''),4),"0'"
                                  ," OR ec.xCleComptable = '", LEFT(IFNULL(var_filtre_4,''),4),"1' )"
                                  ," AND ec.fkLettrage IS NULL )"
                                  )
										END
                  -- Critere Catégorie comptable (position 5)
									,	CASE WHEN IFNULL(var_filtre_5,'') NOT IN ('', '-1') THEN CONCAT(" AND ec.xCleComptable='",IFNULL(var_filtre_5,''),"'")
											 ELSE ""
										END
                  -- Critere contrat (position 16)
									,	CASE WHEN IFNULL(var_filtre_16,'') NOT IN ('', '-1') THEN CONCAT(" AND ec.fkObligation=",IFNULL(var_filtre_16,''))
											 ELSE ""
										END
                  -- Critere bien (position 18)
									,	CASE WHEN IFNULL(var_filtre_18,'') NOT IN ('', '-1') THEN CONCAT(" AND ec.fkBien=",IFNULL(var_filtre_18,''))
											 ELSE ""
										END
                  */
                  -- APOSES : 20230606 - Zendesk 37044
                  
                  -- ********************  2) critères dont l'expression dépend de la nature de l'écriture
                  -- Critères CompteBancaire (pos. 4), Catégorie comptable (pos. 5), contrat(pos. 16) et bien(pos. 18)
                  -- NB : attention à bien distinguer selon qu'on veut récupérer des lignes de ventilation ou des lignes bancaires
                  , CASE
                      -- pas de critère catégorie(5)/contrat(16)/bien(18) donc restitution d'écritures en 54x
                      WHEN (  IFNULL(var_filtre_5,'') IN ('', '-1')
                          AND IFNULL(var_filtre_16,'') IN ('', '-1')
                          AND IFNULL(var_filtre_18,'') IN ('', '-1') )
                        THEN
                          IF( IFNULL(var_filtre_4,'') IN ('', '-1')
                            -- si pas de critère compte bancaire(4) => on ne prend que les ec en 54__0 et 54__1 non lettrées
                            , " AND ( (  ec.xCleComptable LIKE '54__0' OR ec.xCleComptable LIKE '54__1') AND ec.fkLettrage IS NULL) "
                            -- si critère compte bancaire(4) => on filtre sur le compte bancaire
                            , CONCAT ( " AND (   (  ec.xCleComptable = '", LEFT(IFNULL(var_filtre_4,''),4),"0'"
                                      ," OR ec.xCleComptable = '", LEFT(IFNULL(var_filtre_4,''),4),"1' )"
                                      ," AND ec.fkLettrage IS NULL )"
                                      )
                            )
                      -- un critère catégorie(5), contrat(16) ou bien(18) => filtre sur le/les critères en question donc on restituera les écritures en 1/2/6/7x
                      ELSE
                                      -- Critère Catégorie comptable (5)
                          CONCAT (  CASE
                                      WHEN IFNULL(var_filtre_5,'') NOT IN ('', '-1') THEN CONCAT(" AND ec.xCleComptable='",IFNULL(var_filtre_5,''),"'")
                                      ELSE ""
                                      END
                                   -- Critere Contrat (position 16)
                                    , CASE
                                      WHEN IFNULL(var_filtre_16,'') NOT IN ('', '-1') THEN CONCAT(" AND ec.fkObligation=",IFNULL(var_filtre_16,''))
                                      ELSE ""
                                      END
                                      -- Critere Bien (position 18)
                                    ,CASE
                                        WHEN IFNULL(var_filtre_18,'') NOT IN ('', '-1') THEN CONCAT(" AND ec.fkBien=",IFNULL(var_filtre_18,''))
                                        ELSE ""
                                        END
                                 )
                          
                      END
                      
                      
								);
      END;     
      WHEN 'frm_VirementAValider_Filtre' THEN
      BEGIN
			  SET in_chaine :=  CONCAT(
              	  -- Critere Entité (position 1)
                    CASE
                      WHEN IFNULL(var_filtre_1,'') NOT IN ('', '-1') THEN CONCAT(" AND v.fkEntite=",IFNULL(var_filtre_1,''))
                      ELSE ""
                      END
              	  -- Critere En charge (position 2)
                  , CASE
                      WHEN IFNULL(var_filtre_2,'') NOT IN ('', '-1') THEN CONCAT(" AND (do.fkUserTuteur = ", IFNULL(var_filtre_2,''), " OR do.fkUserAdmin = ",IFNULL(var_filtre_2,'') , " OR do.fkUserCompta = ", IFNULL(var_filtre_2,''), ")")
                      -- WHEN IFNULL(var_filtre_2,'') NOT IN ('', '-1') THEN CONCAT(" AND mjpm.jos_users_id=",IFNULL(var_filtre_2,''))
                      ELSE ""
                      END
              	  -- Critere Virement interne (position 3)
                  , CASE IFNULL(var_filtre_3,'')
											WHEN 'IS_VI'    THEN CONCAT(" AND ecc.cOpxType  = 'OpTransfertVirtEbics'")
											WHEN 'ISNOT_VI' THEN CONCAT(" AND ecc.cOpxType != 'OpTransfertVirtEbics'")
                      ELSE ""
                      END
              	  -- Critere Virement périodique (position 4)
                  , CASE IFNULL(var_filtre_4,'')
											WHEN 'IS_VP'    THEN CONCAT(" AND NOT(ISNULL(op.fkPattern) OR op.fkPattern=0)")
											WHEN 'ISNOT_VP' THEN CONCAT(" AND (ISNULL(op.fkPattern) OR op.fkPattern=0)")
                      ELSE ""
                      END
              	  --  Critere Solde compta vir. inclus (position 5)
                  , CASE IFNULL(var_filtre_5,'')
											WHEN '0' THEN CONCAT(" AND so.SoldeComptable &lt; 0")
											WHEN '1' THEN CONCAT(" AND so.SoldeComptable &gt;= 0")
                      ELSE ""
                      END
               	  --  Critere Banque (position 6)
                  , CASE
                      WHEN IFNULL(var_filtre_6,'') NOT IN ('', '-1') THEN CONCAT(" AND v.CpteEmetteurIdBanque='",IFNULL(var_filtre_6,''),"'")
                      ELSE ""
                      END
                -- Critere Montant (position 7 à 9)                     
                  , CASE
											WHEN IFNULL(var_filtre_7,'') NOT IN ('', '-1') THEN CONCAT(" AND IF(ec.xCleComptable LIKE '54___', ec.MontantCredit, ec.MontantDebit)=",CAST(IFNULL(var_filtre_7,'')AS DECIMAL(10,2))
                                                                                ," AND IF(ec.xCleComptable LIKE '54___', ec.MontantDebit, ec.MontantCredit) = 0"
                                                                                )
											WHEN (IFNULL(var_filtre_8,'') NOT IN ('', '-1') AND IFNULL(var_filtre_9,'') NOT IN ('', '-1')) THEN CONCAT(" AND IF(ec.xCleComptable LIKE '54___', ec.MontantCredit, ec.MontantDebit)"
                                                                                                                   ," BETWEEN ",  CAST(IFNULL(var_filtre_8,'')AS DECIMAL(10,2))
                                                                                                                   ," AND ", CAST(IFNULL(var_filtre_9,'')AS DECIMAL(10,2))
                                                                                                                   ," AND IF(ec.xCleComptable LIKE '54___', ec.MontantDebit, ec.MontantCredit) = 0"
                                                                                                                   )
											ELSE ""
										 END
                  -- Critere Date (position 10)		
                  , CONCAT (" AND v.DateEmission &lt; ADDDATE(DATE(NOW()),'", IF(IFNULL(var_filtre_10,'')='', 1,IFNULL(var_filtre_10,'0')),"' +1)")												
                );
      END;   
      WHEN 'frm_AssCpta_MultiVirt_filtre' THEN
      BEGIN
			  SET in_chaine :=  CONCAT(
              	  -- Critere Entité (position 1)
                    CASE
                      WHEN IFNULL(var_filtre_1,'') NOT IN ('', '-1') THEN CONCAT(" AND d.fkEntite=",IFNULL(var_filtre_1,''))
                      ELSE ""
                      END
              	  -- Critere User (position 2)
                  , CASE
                      WHEN IFNULL(var_filtre_2,'') NOT IN ('', '-1') 
                          THEN CONCAT(" AND (d.fkUserTuteur = ", IFNULL(var_filtre_2,''), " OR d.fkUserAdmin = ",IFNULL(var_filtre_2,'') , " OR d.fkUserCompta = ", IFNULL(var_filtre_2,''), ")")
                      ELSE ""
                      END
              	  -- Critere Type (position 3.1 = 3)
                  , CASE 
                      WHEN IFNULL(var_filtre_3,'') NOT IN ('', '-1') THEN CONCAT(" AND ob.xType='",IFNULL(var_filtre_3,''),"'")
                      ELSE ""
                      END
              	  -- Critere Nature (position 3.2 = 4)
                  , CASE 
                      WHEN IFNULL(var_filtre_4,'') NOT IN ('', '-1') THEN CONCAT(" AND ob.xNature='",IFNULL(var_filtre_4,''),"'")
                      ELSE ""
                      END

               	  --  Critere User (position 6)
                  , CASE
                      WHEN IFNULL(var_filtre_6,'') NOT IN ('', '-1') THEN CONCAT(" AND pe.Id=",IFNULL(var_filtre_6,''))
                      ELSE ""
                      END
                  , " AND (ISNULL(ob.DateFin) OR (ob.DateFin &gt; NOW()))"
                  , " AND (ISNULL(ob.DateDebut) OR (ob.DateDebut &lt; NOW()))"
                );
      END;    
      WHEN 'frm_AssCpta_MultiVirt_filtre_Having' THEN
      BEGIN
        -- dans la partie HAVING de frm_AssCpta_MultiVirt_filtre.xml
			  SET in_chaine :=  
              	  --  Critere xSitDossier (position 5) 
                  CASE 
											WHEN IFNULL(var_filtre_5,'') = 'VirtEbicsOk' THEN " HAVING `Sit. télétrans.` IS NOT NULL AND `Sit. mesure`='OK'"
											WHEN IFNULL(var_filtre_5,'') IN ('CS','DCD','Dessaisi','Levee') THEN CONCAT(" HAVING `Sit. mesure`='",IFNULL(var_filtre_5,''),"'")
                      ELSE ""
                      END;
      END;    
      WHEN 'frm_AssCon_Facture_List_filtre' THEN
      BEGIN
        IF (var_filtre_6 NOT IN ('', '-1')) THEN
            -- Recherche par numéro de facture (No position 6) 
            SET in_chaine := CONCAT(" AND f.No=",IFNULL(var_filtre_6,''));
        ELSE
    			  SET in_chaine :=  CONCAT(
        	  -- Critere Entité (position 1)
              CASE
                WHEN IFNULL(var_filtre_1,'') NOT IN ('', '-1') THEN CONCAT(" AND d.fkEntite=",IFNULL(var_filtre_1,''))
                ELSE ""
                END
        	  -- Critere User (position 2)
            , CASE
                WHEN IFNULL(var_filtre_2,'') NOT IN ('', '-1') 
                    THEN CONCAT(" AND (d.fkUserTuteur = ", IFNULL(var_filtre_2,''), " OR d.fkUserAdmin = ",IFNULL(var_filtre_2,'') , " OR d.fkUserCompta = ", IFNULL(var_filtre_2,''), ")")
                ELSE ""
                END
        	  -- Critere DateEmission (position 3)
            , CASE 
                WHEN IFNULL(var_filtre_3,'') NOT IN ('', '-1') THEN CONCAT(" AND f.DEmission='",IFNULL(var_filtre_3,''),"'")
                ELSE ""
                END
        	  -- Critere DateEmission Min Max (positions 4 et 5)
            , CASE 
                WHEN (IFNULL(var_filtre_4,'') NOT IN ('', '-1') OR IFNULL(var_filtre_5,'') NOT IN ('', '-1')) 
                    THEN CONCAT(" AND (f.DEmission &gt;= '",IFNULL(CAST(var_filtre_4 AS DATE),'1900-01-01'),"'"
                                      ," AND f.DEmission &lt;= '",IFNULL(CAST(var_filtre_5 AS DATE),'2999-12-31'),"'"
                                  ,")"      
                                  )
                ELSE ""
                END

        	  -- Critere Numéro Min Max (positions 7 et 8)
            , CASE 
                WHEN (IFNULL(var_filtre_7,'') NOT IN ('', '-1') OR IFNULL(var_filtre_8,'') NOT IN ('', '-1')) 
                    THEN CONCAT(" AND (f.No &gt; ",IFNULL(CAST(var_filtre_7 AS UNSIGNED),0)-1
                                      ," AND f.No &lt; ",IFNULL(CAST(var_filtre_8 AS UNSIGNED),999999)+1
                                      ,")"      
                                  )
                ELSE ""
                END
        	  -- Critere Année de prestation (position 9) 
            , CASE 
                WHEN IFNULL(var_filtre_9,'') NOT IN ('', '-1') THEN CONCAT(" AND fl.AnneePrestation=",IFNULL(var_filtre_9,''))
                ELSE ""
                END
        	  -- Critere Mois de prestation (positions 10 et 11)
            /*, CASE 
                WHEN (IFNULL(var_filtre_10,'') NOT IN ('', '-1') OR IFNULL(var_filtre_11,'') NOT IN ('', '-1')) 
                    THEN CONCAT(" AND (f.PerPrestMoisFinInc &gt; ",IFNULL(CAST(var_filtre_10 AS UNSIGNED),0)-1
                                      ," AND f.PerPrestMoisFinInc &lt; ",IFNULL(CAST(var_filtre_11 AS UNSIGNED),12)+1
                                      ,")"      
                                  )
                ELSE ""
                END
                */
        	  -- Critere Statut (position 12)
            , CASE 
                WHEN IFNULL(var_filtre_12,'') NOT IN ('', '-1') THEN CONCAT(" AND f.xValidationStatut='",IFNULL(var_filtre_12,''),"'")
                ELSE ""
                END
                );
        END IF;        
      END;  
      WHEN 'frm_AssCon_Contribution_List_filtre'  THEN
      BEGIN

    			  SET in_chaine :=  CONCAT(
        	  -- Critere Entité (position 1)
              CASE
                WHEN IFNULL(var_filtre_1,'') NOT IN ('', '-1') THEN CONCAT(" AND d.fkEntite=",IFNULL(var_filtre_1,''))
                ELSE ""
                END
        	  -- Critere User (position 2)
            , CASE
                WHEN IFNULL(var_filtre_2,'') NOT IN ('', '-1') THEN CONCAT(" AND d.fkUserTuteur =", IFNULL(var_filtre_2,''))
                ELSE ""
                END
                
            , CASE
                WHEN IFNULL(var_filtre_4,'')= '3ans' THEN CONCAT(" AND an.Annee &gt; YEAR(now())-3")
                WHEN IFNULL(var_filtre_4,'') NOT IN ('', '-1', '3ans') THEN CONCAT(" AND an.Annee =", IFNULL(var_filtre_4,''))
                ELSE ""
                END
                );
      END; 
      WHEN 'frm_AssCon_Contribution_List_filtre_Count'  THEN
      BEGIN

    			  SET in_chaine :=  CONCAT(
        	  -- Critere Entité (position 1)
              CASE
                WHEN IFNULL(var_filtre_1,'') NOT IN ('', '-1') THEN CONCAT(" AND d.fkEntite=",IFNULL(var_filtre_1,''))
                ELSE ""
                END
        	  -- Critere User (position 2)
            , CASE
                WHEN IFNULL(var_filtre_2,'') NOT IN ('', '-1') THEN CONCAT(" AND d.fkUserTuteur =", IFNULL(var_filtre_2,''))
                ELSE ""
                END
                );
      END; 
      
      WHEN 'frm_AssCon_ReglerMultiMP_filtre'  THEN
      BEGIN

    			  SET in_chaine :=  CONCAT(
        	  -- Critere Entité (position 1)
              CASE
                WHEN IFNULL(var_filtre_1,'') NOT IN ('', '-1') THEN CONCAT(" AND d.fkEntite=",IFNULL(var_filtre_1,''))
                ELSE ""
                END
            -- Critere User (position 2)
            , CASE
                WHEN IFNULL(var_filtre_2,'') NOT IN ('', '-1') 
                    THEN CONCAT(" AND (d.fkUserTuteur = ", IFNULL(var_filtre_2,''), " OR d.fkUserAdmin = ",IFNULL(var_filtre_2,'') , " OR d.fkUserCompta = ", IFNULL(var_filtre_2,''), ")")
                ELSE ""
                END
                );
      END; 
      WHEN 'frm_AssCon_ReglerMultiMP_filtre_HavingTmp'  THEN
      BEGIN

    			  SET in_chaine :=  CONCAT(
        	  -- Critere xSensRglt (position 6) 
              CASE
                WHEN IFNULL(var_filtre_6,'') = 'DecaisstMJPM' THEN CONCAT(" HAVING Montant &lt; 0")
                -- ELSE " HAVING Montant &gt; 0"
                -- DKH 19/06/2023: préférence AssConMinVirm 
                ELSE " HAVING IF(IFNULL(pr.Valeur,0) &gt; 0, Montant &gt; pr.Valeur, Montant &gt; 0)"
                -- FIN DKH
                END
            -- Critere xMontant (position 7)
            , CASE
                WHEN IFNULL(var_filtre_7,'') ='SupSmicHor' 
                    THEN CONCAT(" AND Montant &gt; ValeurBareme_t('SMICHoraire',",IFNULL(var_filtre_3,''),'-01-01',")")
                ELSE ""
                END
                );
      END; 
      WHEN 'frm_AssCon_ReglerMultiMP_filtre_HavingGlobal'  THEN
      BEGIN

    			  SET in_chaine :=  CONCAT(
        	  -- Critere xSitDossier (position 8)  
              CASE
                WHEN IFNULL(var_filtre_8,'') = 'VirtEbicsOk' THEN CONCAT(" HAVING `Sit. télétrans.` IS NOT NULL AND `Sit. mesure`='OK'")
                WHEN IFNULL(var_filtre_8,'') IN ('CS','DCD','Dessaisi','Levee') THEN CONCAT(" HAVING `Sit. mesure`= '",IFNULL(var_filtre_8,''),"'" )
                ELSE ""
                END
                );
      END; 
	  WHEN 'frm_Asstr_RiRib_Recherche'  THEN
      BEGIN
  		IF (var_filtre_1 NOT IN ('', '-1')) THEN
        -- Recherche par IBAN versus multicritères
        SET in_chaine := CONCAT(" AND ri.Iban LIKE '%",IFNULL(var_filtre_1,''),"%'");
       ELSE
  		  SET in_chaine :=  CONCAT(
    	  -- Critere BIC (position 2)
          CASE
            WHEN IFNULL(var_filtre_2,'') NOT IN ('', '-1') THEN CONCAT(" AND ri.Bic LIKE '%", var_filtre_2,"%'")
           ELSE ""
          END
  -- Critere Statut (position 3)
        , CASE
            WHEN IFNULL(var_filtre_3,'') NOT IN ('', '-1') THEN CONCAT("AND ri.xStatut = '", var_filtre_3,"'")
           ELSE ""
          END
    	  -- Critere Date (position 4&5) et condition(position 8)
        , CASE
            WHEN IFNULL(var_filtre_4,'') NOT IN ('', '-1') AND IFNULL(var_filtre_5,'') NOT IN ('', '-1') AND IFNULL(var_filtre_8,'')= '-3' 
  					  THEN CONCAT(" AND ri.Crea_Date BETWEEN '", var_filtre_4,"' AND '", var_filtre_5,"'")
    				WHEN IFNULL(var_filtre_4,'') NOT IN ('', '-1') AND IFNULL(var_filtre_5,'') NOT IN ('', '-1') AND IFNULL(var_filtre_8,'')= '-2'
    					THEN CONCAT(" AND ri.DMAJ BETWEEN '", var_filtre_4,"' AND '", var_filtre_5,"'")
    				ELSE ""
    			 END
         -- Critere créateur (position 6)
  			, CASE 
  				WHEN IFNULL(var_filtre_6,'') NOT IN ('','-1')
  					THEN CONCAT("AND ri.Crea_User = '", var_filtre_6,"'")
           ELSE ""
  				END
         -- Critere modificateur (position 7)
  			, CASE 
  				WHEN IFNULL(var_filtre_7,'') NOT IN ('','-1')
  					THEN CONCAT("AND ri.Maj_User = '", var_filtre_7,"'")
           ELSE ""
  				END
  			, CASE 
  				WHEN IFNULL(var_filtre_9,'') NOT IN ('','-1')
  					THEN CONCAT(" AND ri.Commentaires LIKE '%", var_filtre_9,"%'")
  				 ELSE ""
  				END
                  );
  		END IF;
      END; 
  	WHEN 'frm_AssTr_CmdGenerique_Recherche'  THEN
  	  BEGIN
  		IF (var_filtre_1 NOT IN ('', '-1')) THEN
          -- Recherche par N° commande versus multicritères
          SET in_chaine := CONCAT(" AND c.NumCmd = ",IFNULL(var_filtre_1,''));
         ELSE
         SET in_chaine :=  CONCAT(
      	  -- Critere date (position 2 & 3) et condition(position 8)
            CASE
              WHEN IFNULL(var_filtre_2,'') NOT IN ('', '-1') AND  IFNULL(var_filtre_3,'') NOT IN ('', '-1') AND IFNULL(var_filtre_8,'')= '-3' 
  				THEN CONCAT(" AND c.DEmission BETWEEN '", var_filtre_2,"' AND '", var_filtre_3,"'")
  			WHEN IFNULL(var_filtre_2,'') NOT IN ('', '-1') AND  IFNULL(var_filtre_3,'') NOT IN ('', '-1') AND IFNULL(var_filtre_8,'')= '-2'
  				THEN CONCAT(" AND c.DMaj BETWEEN '", CONCAT(var_filtre_2,' 00:00:00'),"' AND '", CONCAT(var_filtre_3,' 23:59:59'),"'")
             ELSE ""
            END
            -- Critere mot-clé (position 4)
            , CASE 
    				WHEN IFNULL(var_filtre_4,'') NOT IN ('','-1')
    					THEN CONCAT(" AND (c.Commentaires LIKE '%", var_filtre_4,"%' OR c.Intitule LIKE '%", var_filtre_4,"%')")
    				 ELSE ""
    				END
  		  -- Critere Dossier (position 5)
  		  , CASE 
    				WHEN IFNULL(var_filtre_5,'') NOT IN ('','-1')
    					THEN CONCAT(" AND c.fkDossier = ", var_filtre_5)
    				 ELSE ""
    				END
  			-- Critere fournisseur (position 6)
  			, CASE 
    				WHEN var_filtre_6 != -1
    					THEN CONCAT(" AND c.fkDest = ", var_filtre_6)
    				 ELSE ""
    				END
  			-- Critere Signataire (position 7)
  			, CASE 
    				WHEN IFNULL(var_filtre_7,'') NOT IN ('','-1')
    					THEN CONCAT(" AND c.fkUserEmetteur = ", var_filtre_7)
    				 ELSE ""
    				END);
         END IF;
  	  END;
    WHEN 'frm_AssCpta_AAffecter74900_Recherche'  THEN
      BEGIN
			  SET in_chaine :=  CONCAT(
        -- Critere Date comptable (position 1 et 2)
				  CONCAT(" AND (ec.DateComptable BETWEEN '",IFNULL(var_filtre_1,''),"' AND '",IFNULL(var_filtre_2,''), "')")
        -- Critere Montant (position 3 et 4)
        , CASE
            WHEN IFNULL(var_filtre_3,'') NOT IN ('', '-1') AND IFNULL(var_filtre_4,'') NOT IN ('', '-1')
              THEN CONCAT(" AND ( (ec.MontantCredit  BETWEEN ", CAST(IFNULL(var_filtre_3,'')AS DECIMAL(10,2))
                 ," AND ", CAST(IFNULL(var_filtre_4,'')AS DECIMAL(10,2)), ")"
                 ," OR (ec.MontantDebit  BETWEEN ",  CAST(IFNULL(var_filtre_3,'')AS DECIMAL(10,2))
                 ," AND ", CAST(IFNULL(var_filtre_4,'')AS DECIMAL(10,2)), ")"
                 , ")")
            WHEN IFNULL(var_filtre_3,'') NOT IN ('', '-1') AND IFNULL(var_filtre_4,'') IN ('', '-1')
              THEN CONCAT(" AND (ec.MontantCredit >= ", IFNULL(var_filtre_3,''), " OR ec.MontantDebit >= ", IFNULL(var_filtre_3,'') ,")")
            WHEN IFNULL(var_filtre_3,'') IN ('', '-1') AND IFNULL(var_filtre_4,'') NOT IN ('', '-1')
              THEN CONCAT(" AND (ec.MontantCredit <= ", IFNULL(var_filtre_4,''), " OR ec.MontantDebit <= ", IFNULL(var_filtre_4,'') ,")")
            ELSE ""
            END
        -- Critere En charge (position 5)
        , CASE
            WHEN IFNULL(var_filtre_5,'') NOT IN ('', '-1') THEN CONCAT(" AND (do.fkUserTuteur='",IFNULL(var_filtre_5,''),"' OR do.fkUserAdmin='",IFNULL(var_filtre_5,''),"' OR do.fkUserCompta='",IFNULL(var_filtre_5,''),"' OR do.fkUserPatrim='",IFNULL(var_filtre_5,''),"' OR do.fkUserJuridi='",IFNULL(var_filtre_5,''),"')")
            ELSE ""
            END
			);
      END;
    -- DKH 11-09-2023
    WHEN 'frm_AssTr_ReaffectCodeCompta_filtre' THEN
      BEGIN
			  SET in_chaine :=  CONCAT(
              	  -- Critere Protégé (position 1)
                    CASE
                      WHEN IFNULL(var_filtre_1,'') NOT IN ('', '-1') THEN CONCAT(" AND ec.fkdossier=",IFNULL(var_filtre_1,''))
                      ELSE ""
                      END
              	  -- Critere Clé Source (position 2)
                  , CASE
                      WHEN IFNULL(var_filtre_2,'') NOT IN ('', '-1') THEN CONCAT(" AND ec.tmp='",IFNULL(ExtractString(var_filtre_2, '£', 2),''),"'")
                      ELSE ""
                      END
              	  -- Critere Clé Actuelle (position 3)
                  , CASE
                      WHEN IFNULL(var_filtre_3,'') NOT IN ('', '-1') THEN CONCAT(" AND ec.xCleComptable='",IFNULL(var_filtre_3,''),"'")
                      ELSE ""
                      END
              	  -- Critere Nature (position 4)
                  , CASE
                      WHEN IFNULL(var_filtre_4,'') NOT IN ('', '-1') THEN CONCAT(" AND ec.sens='",IFNULL(var_filtre_4,''),"'")
                      ELSE ""
                      END
              	  -- Critere Date Comptable (position 5-6)
                  , CASE
                      WHEN IFNULL(var_filtre_5,'') NOT IN ('', '-1') AND IFNULL(var_filtre_6, '') NOT IN ('', '-1') THEN CONCAT(" AND ec.DateComptable BETWEEN '", IFNULL(var_filtre_5,''), "' AND '", IFNULL(var_filtre_6,''), "'")
                      WHEN IFNULL(var_filtre_5,'') NOT IN ('', '-1') THEN CONCAT(" AND ec.DateComptable &gt;= '", IFNULL(var_filtre_5,''),"'")
                      WHEN IFNULL(var_filtre_6, '') NOT IN ('', '-1') THEN CONCAT(" AND ec.DateComptable &lt;= '", IFNULL(var_filtre_6,''),"'")
                      ELSE ""
                      END
              	  -- Critere Recherche sur Libellé (position 7) 
                  , CASE 
                      WHEN IFNULL(var_filtre_7,'') NOT IN ('')       THEN CONCAT(" AND ec.Libelle LIKE '%",IFNULL(var_filtre_7,''),"%'")
                      ELSE ""
                      END
                  -- Critere Recherche sur le compte bancaire (position 8) 
                  , CASE 
                      WHEN IFNULL(var_filtre_8,'') NOT IN ('-1','')       THEN CONCAT(" AND cb.CleComptable = '",IFNULL(var_filtre_8,''),"'")
                      ELSE ""
                      END
                  -- Critere Recherche sur la nature du compte bancaire (position 9) 
                  , CASE 
                      WHEN IFNULL(var_filtre_9,'') NOT IN ('-1','')       THEN CONCAT(" AND cb.xNature = '",IFNULL(var_filtre_9,''),"'")
                      ELSE ""
                      END
                  -- Critere Recherche sur l'entité (position 10) 
                  , CASE 
                      WHEN IFNULL(var_filtre_10,'') NOT IN ('-1','')       THEN CONCAT(" AND en.id = '",IFNULL(var_filtre_10,''),"'")
                      ELSE ""
                      END
                );
      END;    
    -- FIN DKH
    ELSE
     SET  in_chaine := "";
  END CASE;
  RETURN in_chaine;
END;
