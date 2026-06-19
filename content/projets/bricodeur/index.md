---
title: "Bricodeur — Code, Audio & Hardware"
description: "Code, électronique DIY & détournement d'outils audio."
date: 2026-04-14
projetId: bricodeur
heroTitle: "Bricodeur / Créatif Tech"
heroLead: "Code, électronique DIY & détournement d'outils audio."
image: /images/projet_bricodeur.png
tags: ["Atelier"]
status: "Audio DIY"
cta:
  title: "Intéressé par un projet créatif tech ?"
  body: "Prototypage, développement audio et collaborations sur mesure."
  emails:
    - artn0art@proton.me
---

Pour Arnaud (artnoart), la technique n'est jamais un simple outil de production : c'est un terrain de jeu. La casquette de **Bricodeur** réunit le développement logiciel (Python), l'électronique DIY (Arduino, capteurs) et le détournement d'outils musicaux, pour façonner des expériences tangibles ou fluidifier son workflow d'artiste.

Trois chantiers techniques occupent l'atelier :

---

## 1. La Reactable (Instrument Tangible)

La **Reactable** est une table musicale interactive rétroéclairée. En posant, tournant ou déplaçant des disques physiques sur la table, on manipule directement des couches sonores et des effets en temps réel.

*   **Le fonctionnement** : Une webcam filme la table par le dessous. Les disques portent des marqueurs visuels (ArUco).
*   **La stack technique** :
    *   **Image Processing** : Python + OpenCV pour la détection en temps réel des marqueurs (IDs, rotation, coordonnées).
    *   **Communication** : Protocole OSC (Open Sound Control) envoyant les données de position au séquenceur.
    *   **Synthèse sonore** : Ableton Live 12 + Envelop for Live (pour une spatialisation sonore ambisonique sur 4 à 8 enceintes).
*   **Objectif** : Rendre la performance électronique visuelle, physique et lisible pour le public. Utilisée pour des performances lives et des séances immersives de sonothérapie.

[👉 Découvrir la fiche détaillée du projet Reactable](/projets/reactable/){.projet-hub-link}

---

## 2. a2dd (Assistant DJ & Data Pipeline)

Né du besoin de trier 15 ans d'accumulation de fichiers audio sans structure ni métadonnées cohérentes, **a2dd (Assistant 2 Didier)** est un pipeline Python d'enrichissement et d'indexation de bibliothèque musicale DJ (~5300 morceaux traités).

*   **Le pipeline (11 étapes)** :
    *   **Ingestion** : Téléchargement et normalisation des noms de fichiers audio.
    *   **Enrichissement API** : Requêtes automatisées sur les APIs MusicBrainz, Discogs et Spotify pour récupérer l'année de sortie, le pays d'origine de l'artiste et le genre initial.
    *   **Classification** : Analyse d'énergie (1-9) et catégorisation parmi 32 genres musicaux précis.
    *   **Tagging ID3** : Écriture automatisée d'un tag ID3 Genre (TCON) structuré sous forme de code à 9 positions (`GENRE, MOOD, ENERGY, SG, ATTR1, ATTR2, PAYS, LANGUE, ANNÉE`).
    *   **Rangement** : Tri physique automatique dans l'arborescence du disque dur (classement par genre/pays).
*   **Objectif** : Restaurer le sens et la navigabilité au sein d'une collection DJ massive.

[👉 Découvrir la fiche détaillée du projet a2dd](/projets/a2dd/){.projet-hub-link}

---

## 3. Proto-Audio-Livre (Arduino & NFC)

Un prototype d'objet interactif combinant du matériel physique et de la lecture audio pour un usage simple et intuitif.

*   **Le fonctionnement** : Un lecteur RFID/NFC lit des cartes thématiques (contenant des puces intégrées). En posant la carte d'un livre ou d'une sélection musicale sur l'objet, le système lance la lecture du fichier audio correspondant.
*   **La stack technique** : Arduino, lecteur NFC PN532, module de lecture audio SD (DFPlayer Mini), haut-parleur intégré.
*   **Objectif** : Proposer une alternative physique, sans écran, pour naviguer dans du contenu audio.

---

## Stack Technique Globale

*   **Langages** : Python 3.11+, JavaScript (HTML5/CSS/Node.js).
*   **Librairies clés** : OpenCV, python-osc, Mutagen (tagging audio).
*   **Microcontrôleurs** : Arduino, ESP32, capteurs divers.
