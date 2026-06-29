USE SmartAid_Senegal;

-- REQUÊTE 1 : Top 10 des projets les plus performants
SELECT p.nom_projet, p.secteur, 
SUM(a.cible_objectif) AS Objectif_Total, 
SUM(a.realise_actuel) AS Realise_Total,
 ROUND((SUM(a.realise_actuel) / SUM(a.cible_objectif)) * 100, 2) AS Taux_Realisation_Pourcent
 FROM Projet p
 JOIN Activite a ON p.id_projet = a.id_projet
 GROUP BY p.id_projet, p.nom_projet, p.secteur 
 ORDER BY Taux_Realisation_Pourcent 
 DESC LIMIT 10;

-- REQUÊTE 2 : Top régions par financement
SELECT r.nom_region,
 COUNT(DISTINCT p.id_projet) AS Nombre_Projets, 
 FORMAT(SUM(p.budget_total), 2) AS Budget_Total_Alloue_FCFA 
 FROM Region r JOIN Activite a ON r.id_region = a.id_region
 JOIN Projet p ON a.id_projet = p.id_projet 
 GROUP BY r.id_region, r.nom_region 
 ORDER BY SUM(p.budget_total) DESC;

-- REQUÊTE 3 : Coût moyen par bénéficiaire
SELECT p.nom_projet, p.secteur, p.budget_total AS Budget_Projet_FCFA,
 COUNT(b.id_beneficiaire) AS Total_Beneficiaires, 
 ROUND(p.budget_total / COUNT(b.id_beneficiaire), 0) AS Cout_Moyen_Par_Beneficiaire_FCFA 
 FROM Projet p JOIN Beneficiaire b ON p.id_projet = b.id_projet 
 GROUP BY p.id_projet, p.nom_projet, p.secteur, p.budget_total 
 ORDER BY Cout_Moyen_Par_Beneficiaire_FCFA DESC;

-- REQUÊTE 4 : Taux d’exécution budgétaire
SELECT p.nom_projet, p.budget_total AS Budget_Initial_FCFA,
 SUM(a.cout) AS Budget_Consomme_FCFA, 
 ROUND((SUM(a.cout) / p.budget_total) * 100, 2) AS Taux_Execution_Pourcent 
 FROM Projet p 
 JOIN Activite a ON p.id_projet = a.id_projet 
 GROUP BY p.id_projet, p.nom_projet, p.budget_total 
 ORDER BY Taux_Execution_Pourcent DESC;

-- REQUÊTE 5 : Projets en retard
SELECT nom_projet, secteur, date_debut, date_fin, 
DATEDIFF('2026-06-22', date_fin) AS Jours_De_Retard 
FROM Projet 
WHERE statut = 'En retard' 
ORDER BY Jours_De_Retard DESC;

-- REQUÊTE 6 : Bailleurs les plus actifs
SELECT b.nom_bailleur,
 COUNT(p.id_projet) AS Nombre_Projets_Finances,
 FORMAT(SUM(p.budget_total), 2) AS Financement_Total_FCFA 
 FROM Bailleur b 
 LEFT JOIN Projet p ON b.id_bailleur = p.id_bailleur 
 GROUP BY b.id_bailleur, b.nom_bailleur 
 ORDER BY SUM(p.budget_total) DESC;

-- REQUÊTE 7 : Répartition Homme / Femme des bénéficiaires
SELECT sexe, 
COUNT(id_beneficiaire) AS Nombre_Beneficiaires,
 ROUND((COUNT(id_beneficiaire) / 10000) * 100, 2) AS Pourcentage_Du_Total 
 FROM Beneficiaire 
 GROUP BY sexe;

-- REQUÊTE 8 : Impact par secteur
SELECT p.secteur,
 COUNT(DISTINCT p.id_projet) AS Nombre_Projets, 
 COUNT(b.id_beneficiaire) AS Total_Beneficiaires_Touches, 
 ROUND(AVG(b.age), 1) AS Age_Moyen_Des_Beneficiaires 
 FROM Projet p 
 JOIN Beneficiaire b ON p.id_projet = b.id_projet
 GROUP BY p.secteur 
 ORDER BY Total_Beneficiaires_Touches DESC;

-- REQUÊTE 9 : Segmentation par tranche d'âge
use Smartaid_Senegal;
SELECT 
CASE 
WHEN age <= 25 THEN 'Jeunes (-25 ans)' 
WHEN age BETWEEN 26 AND 45 THEN 'Adultes (26-45 ans)' 
ELSE 'Vieux (+46 ans)' END AS Tranche_Age, 
COUNT(id_beneficiaire) AS Nombre_Beneficiaires, 
ROUND((COUNT(id_beneficiaire) / 10000) * 100, 2) AS Pourcentage
FROM Beneficiaire 
GROUP BY Tranche_Age 
ORDER BY Nombre_Beneficiaires DESC;

-- REQUÊTE 10  : Santé des projets (Double Risque)
SELECT p.nom_projet, p.secteur, p.statut,
 p.budget_total AS Budget_Initial, 
 SUM(a.cout) AS Total_Depense, 
 ROUND((SUM(a.cout) / p.budget_total) * 100, 2) AS Taux_Execution_Pourcent 
 FROM Projet p 
 JOIN Activite a ON p.id_projet = a.id_projet 
 WHERE p.statut = 'En retard' 
 GROUP BY p.id_projet, p.nom_projet, p.secteur, p.statut, p.budget_total 
 HAVING Taux_Execution_Pourcent > 90.00 
 ORDER BY Taux_Execution_Pourcent DESC;

-- REQUÊTE 11  : Top 3 des activités les plus coûteuses par secteur

SELECT nom_projet, secteur, nom_activite, cout AS Cout_Activite_FCFA
FROM (
    SELECT 
        p.nom_projet, p.secteur, a.nom_activite, a.cout,
        ROW_NUMBER() OVER (PARTITION BY p.secteur ORDER BY a.cout DESC) AS Rang
    FROM Projet p
    JOIN Activite a ON p.id_projet = a.id_projet
) AS Sous_Table
WHERE Rang <= 3;

