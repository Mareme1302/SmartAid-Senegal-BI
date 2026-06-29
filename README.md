# SmartAid-Senegal-BI
 SmartAid Sénégal – Système de Pilotage des Projets de Développement
 Présentation du Projet:Ce projet de portfolio présente la conception et le déploiement d'une solution décisionnelle complète (End-to-End) pour une ONG internationale fictive basée au Sénégal. L'objectif est d'automatiser le suivi-évaluation des programmes, de piloter la performance financière et de mesurer l'impact social auprès des populations locales.
---## 🛠️ Technologies & Outils Utilisés
**Modélisation** : Conception UML (Diagramme de classes, Modèle en Étoile)*  
**Base de Données** : MySQL Workbench (Serveur local)*  
**Pipeline ETL** : Power Query (Ingestion via passerelle ODBC 9.x)*   
**Moteur de Calcul** : Langage DAX (Data Analysis Expressions)*   
**Restitution / Restitution** : Power BI Desktop
---## 📐 Architecture des Données (Modèle en Étoile)
Le projet repose sur un schéma en étoile optimisé pour les requêtes analytiques :
*   **Tables de Dimensions** : `Region` (14 régions officielles du Sénégal), `Bailleur` (10 partenaires financiers).
*   **Tables de Faits** : `Projet` (50 programmes suivis), `Activite` (1 000 actions terrain), `Beneficiaire` (10 000 profils démographiques).
---## 📈 Fonctionnalités Clés du Tableau de Bord (5 Pages)
1. **Vue d'Ensemble (Executive Dashboard)** : Vision macro des indicateurs financiers (Budget alloué, consommé, taux d'exécution global de 99%)
2. **Carte du Sénégal** : Cartographie interactive (Bing Maps) ventilant dynamiquement les budgets et bénéficiaires par région.
3.  **Impact Social** : Analyse démographique fine de la population par genre et par tranche d'âge grâce à un regroupement personnalisé.
4.  **Performance Projets** : Matrice de suivi opérationnel avec **mise en forme conditionnelle** (Alertes visuelles Vert/Orange/Rouge) selon le taux de réussite.
5.  **Suivi Bailleurs** : Analyse des flux financiers par partenaire pour orienter la stratégie de plaidoyer.
---## 🚀 Résolution de Défis Techniques (DAX Avancé)Pour corriger une perte de contexte sur l'axe géographique et ventiler correctement le budget des projets par région, j'ai implémenté une formule DAX avancée forçant temporairement la bidirectionnalité des filtres :
```dax
Budget Alloué = 
CALCULATE(
    SUM('smartaid_senegal projet'[budget_total]),
    CROSSFILTER('smartaid_senegal activite'[id_projet], 'smartaid_senegal projet'[id_projet], Both)
)
```
---## 📁 Structure du Répertoire
*   `/1-SQL-Database` : Contient le script de création des tables et les 11 requêtes d'analyse métier.
*   `/2-Power-BI-Dashboard` : Contient le fichier `.pbix` d'architecture du tableau de bord.
*   `/3-Documentation` : Contient le rapport final complet d'analyse de 10 pages au format PDF.
---## 💼 ContactJe suis actuellement à la recherche d'une opportunité en tant que **Data Analyst Junior**.
N'hésitez pas à me contacter pour échanger sur ce projet !
Mareme SECK,
Seckmareme739@gmail.com
