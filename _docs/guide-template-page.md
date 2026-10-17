# Guide & Charte du Gabarit de Page Thématique (artn0art)

Ce guide définit les règles, contraintes et gabarits normés pour les pages secondaires des 4 piliers du site artn0art (**Jukbike**, **DJ**, **Production**, **Bricodage**).
La page **Jukbike** (`/projets/jukbike/`) constitue l'étalon de référence.

---

## 1. Philosophie & Principes Directeurs

1. **Fiche sobre et épurée** :
   - **Zéro barre de boutons / pastilles en haut** : la lecture commence directement sur le contenu sans menu parasite.
   - Typographie soignée, contrastes maîtrisés, palettes de couleurs d'accents douces.
2. **Hiérarchie verticale en 3 blocs** :
   - **Haut** : En-tête sobre (titre, sous-titre lead, tags de statut éventuels).
   - **Centre** : Encarts d'activités principaux (`modules`), déployables avec concepts et photos.
   - **Bas** : Encarts secondaires d'informations (`sections`, `transmission`, `ressources`, `bio`), **toujours repliés par défaut**.
3. **Pied de page** :
   - CTA sobre de contact / booking / réservation par email.

---

## 2. Structure Type d'une Page Secondaire

```
┌────────────────────────────────────────────────────────┐
│ 1. EN-TÊTE SOBRE (Hero discret ou Titre + Lead)        │
└────────────────────────────────────────────────────────┘
                           │
                           ▼
┌────────────────────────────────────────────────────────┐
│ 2. PROPOSITIONS / ACTIVITÉS (Modules principaux)       │
│    - Dépliables individuellement                       │
│    - Icône 72x72, titre, tag de formule, descriptif    │
└────────────────────────────────────────────────────────┘
                           │
                           ▼
┌────────────────────────────────────────────────────────┐
│ 3. ENCARTS SECONDAIRES D'INFORMATION (Repliés en bas)  │
│    - Genèse & Chiffres Clés / Spécificités             │
│    - Références & Partenaires                          │
│    - 🤝 Fiche Transmission (médiation / ateliers)      │
│    - 📋 Fiches Techniques & Ressources (B site + A Drive)│
│    - 👤 Bio dédiée par thématique (tout en bas)        │
└────────────────────────────────────────────────────────┘
                           │
                           ▼
┌────────────────────────────────────────────────────────┐
│ 4. CTA CONTACT / BOOKING (Discret en pied)             │
└────────────────────────────────────────────────────────┘
```

---

## 3. Spécification du Frontmatter YAML

Chaque page secondaire est configurée via son fichier markdown racine (`index.md` ou `_index.md`).

### Schéma complet des paramètres

```yaml
---
# --- 1. MÉTADONNÉES & AFFICHAGE ---
title: "Jukbike — Vélo disco mobile"
heroTitle: "Jukbike"
heroLead: "vélo disco mobile"
description: "Système son autonome à vélo pour festivals, événements..."
hideHero: true           # true si le titre est déjà dans le bandeau ou premier module
hideHeroImage: true      # true pour éviter une grosse bannière redondante
aliases:
  - /jukbike/            # URL courte directe

# --- 2. ACTIVITÉS & PROPOSITIONS PRINCIPALES (Modules) ---
modules:
  - id: jukbox
    icon: /images/modules/jukbox.webp
    title: "Djing à vélo"
    tag: "Vélo disco mobile"
    concept: "Une régie DJ ouverte où le public participe à la sélection musicale."
    ambiance: "Festive, conviviale et interactive."
    photos:
      - src: /images/galerie/jukbike/velo-festival-A.webp
        alt: "Le Jukbike en festival"

# --- 3. INFORMATIONS HISTORIQUES / CONTEXTUELLES ---
sections:
  - title: "Genèse & Chiffres Clés"
    body: |
      Historique de création, dates clés et chiffres d'activité.
  - title: "Références & Collaboration"
    body: |
      Collectivités, festivals et structures partenaires.

# --- 4. TRANSMISSION PAR THÉMATIQUE ---
transmission:
  title: "Transmission : Ateliers vélo-son & participation citoyenne"
  body: |
    Ateliers pratiques de découverte, prise en main et médiation.

# --- 5. FICHES TECHNIQUES & RESSOURCES (Option B + A) ---
ressources:
  title: "Fiches Techniques & Ressources"
  intro: "Documents pour programmateurs, régisseurs et partenaires techniques."
  items:
    - title: "Plaquette officielle Jukbike 2026"
      type: "pdf"               # 'pdf', 'doc' ou 'drive'
      badge: "PDF officiel"
      href: "/documents/jukbike-plaquette-2026.pdf"
      description: "Dossier de présentation complet au format PDF."
    - title: "Fiche Technique & Logistique"
      type: "doc"
      badge: "Technique"
      href: "#ressources"
      description: "Autonomie batterie, dimensions, installation."
    - title: "Espace Partagé Jukbike (Photos HD & Visuels)"
      type: "drive"
      badge: "Drive"
      href: "https://drive.google.com/drive/folders/artn0art-jukbike"
      description: "Dossier Drive avec visuels haute résolution et logos vectoriels."

# --- 6. BIO DÉDIÉE PAR THÉMATIQUE (TOUT EN BAS) ---
bio:
  title: "Bio — Arnaud Bannais"
  body: |
    Parcours, expérience et vision artistique spécifiques à cet univers.
  points:
    - "Référence 1 : formation ou expérience clé."
    - "Référence 2 : structures et projets emblématiques."

# --- 7. CTA / CONTACT ---
hideCTA: false
cta:
  variant: compact
  devisLabel: "Contacter / Réserver"
  devisHref: "mailto:artn0art@proton.me?subject=Demande d'information Jukbike"
---

{{< modules >}}

{{< sections >}}
```

---

## 4. Règles & Contraintes Impératives

| Règle | Statut | Description |
|---|---|---|
| **Pas de barre de boutons** | **OBLIGATOIRE** | Aucune barre de boutons ou pastilles d'activités en haut de page. Le visiteur entre immédiatement dans le contenu. |
| **Encarts repliés en bas** | **OBLIGATOIRE** | Tous les accordéons secondaires (`sections`, `transmission`, `ressources`, `bio`) doivent être **pliés par défaut** (`open` interdit par défaut). |
| **Bio dédiée tout en bas** | **OBLIGATOIRE** | La bio ne se place jamais au milieu des activités. Elle est contextualisée par univers et clôture la liste des encarts. |
| **Ressources B + A** | **OBLIGATOIRE** | Documents légers (PDF, specs) hébergés sur le site (B) + Lien vers dossier Google Drive partagé pour les médias lourds (A). |
| **Pages brouillons** | **OBLIGATOIRE** | Toute page en cours de conception ou non retenue immédiatement porte `draft: true` pour ne jamais être publiée par erreur. |
| **a2dd hors site** | **OBLIGATOIRE** | L'outil personnel `a2dd` ne doit pas figurer dans le menu ni dans le site public. |

---

## 5. Cas de Référence : Jukbike (`/projets/jukbike/`)

La page Jukbike illustre fidèlement ces principes :
- **Titre épuré** sans bandeau écrasant.
- **4 modules de propositions** : Djing à vélo, Crieur de Rue, Open Mic, Karaoké de Rue.
- **5 encarts secondaires empilés en bas** :
  1. *Genèse & Chiffres Clés*
  2. *Références & Collaboration*
  3. *Transmission : Ateliers vélo-son & participation citoyenne*
  4. *Fiches Techniques & Ressources* (avec PDF 2026, Fiche Technique et lien Drive)
  5. *Bio — Arnaud Bannais* (axée sur la culture vélo et le sound system nomade)

---

## 6. Plan de Déploiement sur les Autres Pages

1. **DJ** (`content/dj/_index.md`) :
   - Modules : Cours & Ateliers DJ (1-2 encarts), embeds Soundcloud de sélections.
   - Encarts repliés en bas : Tarifs, Transmission (ateliers jeunes), Ressources (régie DJ + Drive tracklists), Bio DJ.
2. **Production** (`content/mao/_index.md`) :
   - Modules : Push 3, Move, Max for Live.
   - Encarts repliés en bas : Offres, Tarifs, Transmission (pédagogie 3 questions), Ressources (projets Live, stems + Drive), Bio Formateur.
3. **Bricodage** (`content/bricodage/_index.md`) :
   - Modules : Audio-livre, Animateur numérique, Vélo son DIY.
   - Encarts repliés en bas : Spécifications, Transmission (Petits Débrouillards), Ressources (plans, code + Drive), Bio Bricodeur.
4. **Pages Futures (Reactable, Massage)** :
   - Reste en `draft: true` jusqu'à validation des textes complets par Didier.
