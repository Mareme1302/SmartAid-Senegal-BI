CREATE DATABASE SmartAid_Senegal;
USE SmartAid_Senegal;
CREATE TABLE Region (
    id_region INT AUTO_INCREMENT PRIMARY KEY,
    nom_region VARCHAR(50) NOT NULL
);
CREATE TABLE Bailleur (
    id_bailleur INT AUTO_INCREMENT PRIMARY KEY,
    nom_bailleur VARCHAR(100) NOT NULL
);
CREATE TABLE Projet (
    id_projet INT AUTO_INCREMENT PRIMARY KEY,
    nom_projet VARCHAR(150) NOT NULL,
    secteur VARCHAR(100) NOT NULL,
    budget_total DECIMAL(15, 2) NOT NULL,
    statut VARCHAR(50) NOT NULL,
    date_debut DATE NOT NULL,
    date_fin DATE NOT NULL,
    id_bailleur INT NOT NULL,
    FOREIGN KEY (id_bailleur) REFERENCES Bailleur(id_bailleur)
);
CREATE TABLE Activite (
    id_activite INT AUTO_INCREMENT PRIMARY KEY,
    nom_activite VARCHAR(150) NOT NULL,
    cout DECIMAL(15, 2) NOT NULL,
    statut VARCHAR(50) NOT NULL,
    date_activite DATE NOT NULL,
    cible_objectif INT ,
    realise_actuel INT,
    id_projet INT NOT NULL,
    id_region INT NOT NULL,
    FOREIGN KEY (id_projet) REFERENCES Projet(id_projet),
    FOREIGN KEY (id_region) REFERENCES Region(id_region)
);
CREATE TABLE Beneficiaire (
    id_beneficiaire INT AUTO_INCREMENT PRIMARY KEY,
    sexe VARCHAR(10) NOT NULL,
    age INT NOT NULL,
    id_projet INT NOT NULL,
    id_region INT NOT NULL,
    FOREIGN KEY (id_projet) REFERENCES Projet(id_projet),
    FOREIGN KEY (id_region) REFERENCES Region(id_region)
);

