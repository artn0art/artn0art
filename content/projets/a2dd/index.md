---
title: "a2dd — Assistant 2 Didier"
description: "Pipeline de gestion et d'enrichissement de collection musicale DJ."
date: 2026-04-14
draft: true
projetId: a2dd
projetType: project
heroTitle: "a2dd — Assistant 2 Didier"
heroLead: "Pipeline de gestion et d'enrichissement de collection musicale DJ."
image: /images/projet_bricodeur.webp
tags: ["Python"]
status: "5310 tracks"
universe: a2dd
breadcrumbTrail:
  - title: Bricodeur
    href: /projets/bricodeur/
cta:
  title: "Échanger sur le catalogage automatisé"
  body: "Scripts DJ, enrichissement de bibliothèque et intégration APIs Discogs / Spotify."
  emails:
    - artn0art@proton.me
---

**a2dd** est un outil sur mesure pour gérer, trier et enrichir une collection musicale de DJ. L'idée de départ : 15 ans de tracks accumulés dans un seul dossier, sans logique, sans métadonnées utiles. L'outil restaure le sens — un à un — jusqu'à faire revivre la bibliothèque.

## Ce que fait a2dd

Un pipeline en 11 étapes qui part d'un fichier audio brut et produit un fichier enrichi, trié, prêt à jouer :

1. **Download** : collecte depuis sources variées (Bandcamp, labels, promos)
2. **Formatage** : normalisation nom de fichier, conversion audio si besoin
3. **Détection genre** : depuis 32 genres configurés (techno, house, ambient, downtempo, dub...)
4. **Détection sous-genre / mood** : EP (energetic peak), UD (uplifting dancefloor), etc.
5. **Pays d'origine** : croisement MusicBrainz + Discogs
6. **Année de sortie** : API MB, Discogs, Spotify
7. **Énergie** : score 1-9 (calm → peak time)
8. **Attributs complémentaires** : vocal, instrumental, live, remix
9. **Écriture TCON** : tag ID3 "Genre" en 9 positions — `GENRE, MOOD, ENERGY, SG, ATTR1, ATTR2, PAYS, LANGUE, ANNÉE`
10. **Transcodage** : export Rekordbox-ready
11. **Triage physique** : déplacement dans `mx/GENRE/pays/`

## Stack technique

- **Langage** : Python 3.11+
- **APIs** : MusicBrainz, Discogs, Spotify
- **Structure** : Hub+Spokes (11 briques indépendantes + hub coordinateur)
- **Dashboard** : web local, statut par brique
- **Philosophie** : chaque brique = un module testable isolément, tout est reproductible

## Pourquoi ce projet ?

Parce que mixer avec 5000 tracks sans structure, c'est un enfer. Parce que chaque heure passée à chercher un track est une heure qui n'est pas passée à jouer. Parce que la richesse d'une collection ne vaut que si on peut y naviguer — et que les outils commerciaux n'offrent pas cette granularité.

## État actuel (avril 2026)

- 32 genres actifs, v9 de la classification
- 5310 tracks indexés et taggés
- Pipeline stable, corrections S125-S126 intégrées
- Prochaine étape : enrichissement années/pays sur le résidu non-couvert

## Liens

Suivez l'avancée et les écoutes : [SoundCloud artn0art](https://soundcloud.com/artn0art)
