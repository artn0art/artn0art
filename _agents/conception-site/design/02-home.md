# Spécification Page d'Accueil — Grille de Cartes (Phase 2)

Ce document décrit le maquettage de la page d'accueil (Hub principal) du site **artn0art** sous forme de grille de cartes, en reproduisant l'expérience esthétique de **fors.fm/devices**. Il sert de spécification technique pour l'implémentation par **Cursor**.

---

## 1. Structure Générale & Conteneur

- **Largeur maximale du conteneur (`main`)** : Élargie à `64rem` (1024px) au lieu de `52rem` pour offrir l'espace nécessaire au déploiement de la grille sur 2 colonnes sans compresser les textes.
- **Grille de Cartes (`.device-list`)** :
  - Colonnes (Desktop) : `grid-template-columns: repeat(2, 1fr)`.
  - Espacement (Gap) : `1.5rem` (`24px`).
  - Alignement des éléments : Les cartes s'étirent sur toute la hauteur de leur ligne de grille (`align-items: stretch`).

---

## 2. Organisation de la Hiérarchie Visuelle

La page s'articule autour de l'accroche unique en haut de page et des deux groupes d'univers définis dans [data/profils.yaml](file:///Users/artnoart/Code/_projets/artn0art/data/profils.yaml).

### 2.1. L'Accroche Principale
- Titre : `ARTN0ART` (uppercase, extra-bold).
- Lead : `DJ · Musicien · Créatif · Sonothérapeute` (regular).
- Ligne de séparation : Bordure fine basse (`1px solid rgba(0, 0, 0, 0.1)`).

### 2.2. Section 1 : "En scène" (Featured)
- Kicker : `Pour ta considération` (en lettres capitales espacées).
- Titre de section : `En scène` (Space Grotesk bold).
- Subtitle : *Les facettes que je propose en public — booking, scène et animation.*
- Contenu : Grille de 2 colonnes affichant les cartes **DJ / Mixage** et **Jukbike**.
- Rôle : Ces deux profils captent immédiatement l'attention par leur importance commerciale et scénique.

### 2.3. Section 2 : "Autres facettes" (Secondary)
- Kicker : `En coulisses` (en lettres capitales espacées).
- Titre de section : `Autres facettes` (Space Grotesk bold).
- Subtitle : *Studio, code, soins — expérimentations et créations en arrière-plan.*
- Contenu : Grille de 2 colonnes (dont la dernière ligne se cale sur une seule carte centrée ou alignée à gauche) affichant les cartes **Producteur**, **Bricodeur** et **Massage & Sonothérapie**.
- Rôle : Met en avant le travail créatif de studio, le code DIY et le bien-être qui alimentent les projets de scène.

---

## 3. Comportement des États d'Interaction (Hover & Focus)

Lorsqu'un utilisateur survole une carte :
1. **Éclaircissement de la surface** : Le fond de la carte s'éclaircit en passant de `var(--surface)` (`#ebebeb`) à `var(--row-hover)` (`#f3f3f3`).
2. **Translation verticale** : La carte monte subtilement de -2px (`transform: translateY(-2px)`).
3. **Ombre de profondeur** : Ajout d'une ombre floue et légère (`box-shadow: 0 10px 28px rgba(0, 0, 0, 0.09)`).
4. **Zoom Image** : L'image à l'intérieur de `.device-thumb` grossit légèrement (`transform: scale(1.02)`), avec un effet amorti (`transition: transform 0.35s cubic-bezier(0.16, 1, 0.3, 1)`). L'overflow reste masqué par les bords de la carte.
5. **Couleur d'Univers** : La bordure grise par défaut devient de la couleur d'univers correspondante (`1px solid var(--u-color)`).

---

## 4. Spécifications du Rendu (Wireframes)

### 4.1. Rendu Desktop (≥ 680px)

```text
+-------------------------------------------------------------------+
|  ARTN0ART                                                         |
|  DJ · Musicien · Créatif · Sonothérapeute                          |
|  ---------------------------------------------------------------  |
|                                                                   |
|  POUR TA CONSIDÉRATION                                            |
|  En scène                                                         |
|  Les facettes que je propose en public...                         |
|                                                                   |
|  +----------------------------+   +----------------------------+  |
|  |           IMAGE            |   |           IMAGE            |  |
|  |           (DJ)             |   |         (Jukbike)          |  |
|  +----------------------------+   +----------------------------+  |
|  | DJ / Mixage    [Booking]   |   | Jukbike        [Sur devis] |  |
|  | (Live Set)                 |   | (Plein air)                |  |
|  | Lecture de salle...        |   | Le vélo-sono...            |  |
|  +----------------------------+   +----------------------------+  |
|                                                                   |
|  ---------------------------------------------------------------  |
|                                                                   |
|  EN COULISSES                                                     |
|  Autres facettes                                                  |
|  Studio, code, soins...                                           |
|                                                                   |
|  +----------------------------+   +----------------------------+  |
|  |           IMAGE            |   |           IMAGE            |  |
|  |        (Producteur)        |   |        (Bricodeur)         |  |
|  +----------------------------+   +----------------------------+  |
|  | Producteur   [Boom Bap...] |   | Bricodeur      [Audio DIY] |  |
|  | (Studio)                   |   | (Atelier)                  |  |
|  | Beats taillés...           |   | Là où le code...           |  |
|  +----------------------------+   +----------------------------+  |
|                                                                   |
|  +----------------------------+                                   |
|  |           IMAGE            |                                   |
|  |       (Sonothérapie)       |                                   |
|  +----------------------------+                                   |
|  | Sonothérapie  [Relaxation] |                                   |
|  | (Cabinet)                  |                                   |
|  | Le corps qui se relâche... |                                   |
|  +----------------------------+                                   |
+-------------------------------------------------------------------+
```

### 4.2. Rendu Mobile (< 680px)

Toute la mise en page s'empile verticalement sur une seule colonne. Les grilles et conteneurs s'adaptent à la largeur de l'écran.

```text
+-----------------------------------+
|  ARTN0ART                         |
|  DJ · Musicien · Créatif...       |
|  -------------------------------  |
|                                   |
|  POUR TA CONSIDÉRATION            |
|  En scène                         |
|                                   |
|  +-----------------------------+  |
|  |            IMAGE            |  |
|  |            (DJ)             |  |
|  +-----------------------------+  |
|  | DJ / Mixage      [Booking]  |  |
|  | (Live Set)                  |  |
|  | Lecture de salle...         |  |
|  +-----------------------------+  |
|                                   |
|  +-----------------------------+  |
|  |            IMAGE            |  |
|  |          (Jukbike)          |  |
|  +-----------------------------+  |
|  | Jukbike          [Sur dev]  |  |
|  | (Plein air)                 |  |
|  | Le vélo-sono...             |  |
|  +-----------------------------+  |
+-----------------------------------+
```

---

## 5. Liste des Écarts avec le Rendu Actuel

Le tableau ci-dessous liste les différences entre l'intégration temporaire actuelle (format liste) et l'intégration cible en grille fors.fm :

| Propriété / Élément | Rendu Actuel | Rendu Cible (fors.fm/devices) |
| :--- | :--- | :--- |
| **Structure de grille** | 1 colonne (liste de lignes). | **2 colonnes (grille de cartes)**. |
| **Taille de l'image** | Vignette carrée de 88px alignée à gauche. | **Grande image 4:3 en haut pleine largeur**. |
| **Mise en page carte** | Contenu textuel à droite de l'image. | **Méta et textes en dessous de l'image**. |
| **Largeur du site** | Limitée à `52rem`. | Élargie à **`64rem`** pour aérer la grille. |
| **Interaction Hover** | Éclaircissement du fond. | **Éclaircissement + Translation (-2px) + Zoom image (1.02) + Bordure d'univers active**. |
