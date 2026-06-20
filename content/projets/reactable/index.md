---
title: "Reactable — instrument tangible"
description: "Performance live interactive : des disques sur une table deviennent des couches sonores."
date: 2026-04-14
draft: true
projetId: reactable
projetType: project
heroTitle: "Reactable — instrument tangible"
heroLead: "Performance live interactive : des disques sur une table deviennent des couches sonores."
image: /images/projet_bricodeur.webp
tags: ["Recherche"]
status: "R&D en cours"
universe: reactable
breadcrumbTrail:
  - title: Bricodeur
    href: /projets/bricodeur/
cta:
  title: "Discuter de l'instrumentation tangible"
  body: "Échanges techniques sur la musique tangible, la spatialisation et les performances live."
  emails:
    - artn0art@proton.me
---

Un **instrument de musique tangible** : on pose des disques sur une table rétroéclairée, le logiciel détecte leur position, leur orientation et leur présence, puis génère du son en temps réel dans un espace sonore multi-canal.

## Le principe

Chaque disque porte un marqueur visuel (ArUco) qui représente une **intention sonore** : ancrage, cœur, mouvement, texture, clarté, silence actif. On les dépose, on les déplace, on les tourne — et la musique vit.

- **Position** du disque → pan / azimuth spatial
- **Hauteur** dans le cadre → volume
- **Rotation** → paramètre expressif (filtre, reverb, pitch, tempo...)
- **Présence** → fade-in / fade-out doux

Six disques à ce stade, calqués sur les six intentions du travail en sonothérapie. Extensible à douze pour couvrir plus de territoires (éléments, chakras, couleurs).

## Chaîne technique

```
Webcam → OpenCV ArUco → Python → OSC → Ableton Live 12 → multi-enceintes / dôme
                                              ↕
                                        Envelop for Live
                                    (spatialisation ambisonic)
```

## Roadmap en 3 sprints

- **Sprint 1 — 5 €** : un disque carton, une webcam, un filtre Ableton qui bouge. Valider la chaîne.
- **Sprint 2 — ~50 €** : six disques, mapping complet des six intentions, spatialisation basique.
- **Sprint 3 — 300-800 €** : table physique dédiée, 4-8 canaux spatialisés, disques tournés, captation vidéo pro.

## Pourquoi ce projet ?

Les contrôleurs MIDI sont précis mais froids. Les tables tactiles sont pratiques mais désincarnées. La réactable propose un retour à la matière : le geste de **poser** un disque est un engagement physique, visible, partageable. En performance, le public voit la cause et l'effet — la musique redevient lisible.

Lié à un travail de bains sonores et de sonothérapie : chaque disque porte une intention thérapeutique, et la table devient un outil de séance autant qu'un instrument de scène.

## État actuel (avril 2026)

- Documentation technique complète (roadmap, mapping ArUco, tracker Python squelette)
- Intentions sonores documentées (6 × fréquences + instruments favoris)
- Prochaine étape : Sprint 1 — 1 weekend de travail, disque carton, premier test vidéo

## Connexions

- Production musicale dans Ableton Live 12
- Formation spatialisation en cours (Whiti Audio, 10 modules sur 3 ans)
- Sonothérapie : fréquences, intentions, séances
