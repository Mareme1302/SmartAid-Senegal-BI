# 🇸🇳 SmartAid-Senegal-BI
### SmartAid Sénégal – Système de Pilotage des Projets de Développement

**Présentation du Projet :**  
Ce projet de portfolio présente la conception et le déploiement d'une solution décisionnelle complète (End-to-End) pour une ONG internationale fictive basée au Sénégal. L'objectif est d'automatiser le suivi-évaluation des programmes, de piloter la performance financière et de mesurer l'impact social auprès des populations locales.

---

## 🛠️ Technologies & Outils Utilisés
* **Modélisation** : Conception UML (Diagramme de classes, Modèle en Étoile)
* **Base de Données** : MySQL Workbench (Serveur local)
* **Pipeline ETL** : Power Query (Ingestion via passerelle ODBC 9.x)
* **Moteur de Calcul** : Langage DAX (Data Analysis Expressions)
* **Restitution & Dataviz** : Power BI Desktop

---

## 📐 Architecture des Données (Modèle en Étoile)
Le projet repose sur un schéma en étoile optimisé pour les requêtes analytiques et la fluidité des filtres croisés :
* **Tables de Dimensions** : `Region` (Les 14 régions officielles du Sénégal), `Bailleur` (10 partenaires financiers).
* **Tables de Faits** : `Projet` (50 programmes suivis), `Activite` (1 000 actions terrain), `Beneficiaire` (10 000 profils démographiques).

---

## 📊 Exploration SQL & Analyse Métier
Le dossier `/1-SQL-Database` contient l'ensemble des scripts de création ainsi que **11 requêtes analytiques complexes** écrites pour répondre aux besoins de la direction. Exemples de requêtes incluses :
* Calcul du taux d'avancement des projets par secteur d'activité.
* Identification des régions prioritaires présentant le plus faible ratio Budget/Bénéficiaire.
* Analyse de la saisonnalité des dépenses opérationnelles.

---

## 📈 Fonctionnalités Clés du Tableau de Bord (5 Pages)
1. **Vue d'Ensemble (Executive Dashboard)** : Vision macro des indicateurs financiers (Budget alloué, consommé, taux d'exécution global de 99%).
2. **Carte du Sénégal** : Cartographie interactive (Bing Maps) ventilant dynamiquement les budgets et bénéficiaires par région.
3. **Impact Social** : Analyse démographique fine de la population par genre et par tranche d'âge grâce à un regroupement personnalisé.
4. **Performance Projets** : Matrice de suivi opérationnel avec **mise en forme conditionnelle** (Alertes visuelles Vert/Orange/Rouge) selon le taux de réussite.
5. **Suivi Bailleurs** : Analyse des flux financiers par partenaire pour orienter la stratégie de plaidoyer et de levée de fonds.

*(💡 Conseil : Ajoutez ici une ou deux images de votre dashboard avec la syntaxe `![Nom de la page](chemin/vers/image.png)`)*

---

## 🚀 Résolution de Défis Techniques (DAX Avancé)
Pour corriger une perte de contexte sur l'axe géographique et ventiler correctement le budget des projets par région, j'ai implémenté une formule DAX avancée. Cette approche force temporairement la bidirectionnalité des filtres entre la table des activités et celle des projets, garantissant une intégrité totale des résultats sur les visuels cartographiques :

```dax
Budget Alloué = 
CALCULATE(
    SUM('smartaid_senegal projet'[budget_total]),
    CROSSFILTER('smartaid_senegal activite'[id_projet], 'smartaid_senegal projet'[id_projet], Both)
)
```

---

## 📂 Structure du Répertoire
* **`/1-SQL-Database`** : Contient le script complet de création des tables (DDL) et les 11 requêtes d'analyse métier (DML).
* **`/2-Power-BI-Dashboard`** : Contient le fichier `.pbix` fonctionnel avec l'architecture complète du modèle et des visuels.
* **`/3-Documentation`** : Contient le rapport final complet de cadrage et d'analyse de 10 pages au format PDF.

---

## 💼 Contact
Je suis actuellement à la recherche d'une opportunité en tant que **Data Analyst Junior**. N'hésitez pas à me contacter pour échanger sur ce projet ou sur vos opportunités ouvertes !

* **Nom** : Mareme SECK  
* **Email** : Seckmareme739@gmail.com  
* **LinkedIn** : *[Ajoutez le lien vers votre profil ici]*
