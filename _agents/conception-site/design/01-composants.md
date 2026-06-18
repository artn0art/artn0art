# Design System — Spécification des Composants (Phase 1)

Ce document décrit le design system des composants réutilisables du site **artn0art** à partir des design tokens définis dans la Phase 0. Il sert de guide d'implémentation CSS pour **Cursor**.

---

## 1. Carte Projet (`device-card`)

La carte projet est l'élément central du catalogue. Elle est cliquable dans son intégralité et se décline en deux variantes d'affichage (Featured et Secondary) mais conserve une structure HTML identique pour assurer la réutilisation du partiel `layouts/partials/projet-device.html`.

### 1.1. Anatomie HTML

```html
<a href="{{ .href }}" class="device-card" id="device-{{ .id }}">
  <div class="device-thumb">
    <img src="{{ .image }}" alt="{{ .title }}" ... />
  </div>
  <div class="device-body">
    <div class="device-meta">
      <h3 class="device-title">{{ .title }}</h3>
      <span class="tag tag-status">{{ .status }}</span>
    </div>
    <div class="device-tags">
      <span class="tag">{{ .tag }}</span>
    </div>
    <p class="device-desc">{{ .description }}</p>
  </div>
</a>
```

### 1.2. Espacements (en Tokens)

- **Conteneur global (`.device-card`)** :
  - Padding : Aucun (l'image doit toucher les bords supérieurs, gauche et droit).
  - Border-radius : `14px` (`0.875rem`).
- **Cadre Image (`.device-thumb`)** :
  - Ratio (aspect-ratio) : `4 / 3` (Featured) ou `1:1` (variante optionnelle pour Secondary, mais le standard `4 / 3` est conservé par défaut).
- **Conteneur Texte (`.device-body`)** :
  - Padding global : `--space-4` (haut) / `--space-5` (droite, bas, gauche).
- **Méta Header (`.device-meta`)** :
  - Margin bottom : `--space-2`.
  - Alignement vertical : Baseline (pour aligner le bas du titre et du tag de statut).
- **Zone de Tags (`.device-tags`)** :
  - Margin bottom : `--space-3`.
  - Gap entre tags : `--space-1` (horizontal/vertical).
- **Description (`.device-desc`)** :
  - Margin : Aucune.
  - Longueur max du texte : limitée à **90 caractères** (1 phrase) pour un effet poétique minimaliste type *fors.fm*.

### 1.3. États (Repos / Hover / Focus)

- **Repos** :
  - Background-color : `var(--surface)` (`#ebebeb`).
  - Border : `1px solid var(--border)` (`rgba(0, 0, 0, 0.1)`).
  - Box-shadow : Aucune.
  - Image : `transform: scale(1.0)`.
- **Hover (Survol)** :
  - Background-color : `var(--row-hover)` (`#f3f3f3`).
  - Border : `1px solid var(--u-color)` (la couleur d'univers du projet concerné, ex: violet pour le DJ).
  - Box-shadow : `0 10px 28px rgba(0, 0, 0, 0.09)`.
  - Transform : `translateY(-2px)`.
  - Image (dans `.device-thumb`) : `transform: scale(1.02)` avec une transition douce de `0.35s cubic-bezier(0.16, 1, 0.3, 1)`.
- **Focus visible** (Navigation clavier) :
  - Outline : `2px solid var(--text)` (`#141414`).
  - Outline-offset : `2px`.
  - Border-radius du focus : `14px` (épouse le contour de la carte).

### 1.4. Contraintes Responsive

- **Écrans Desktop (≥ 680px)** :
  - Affichage en grille 2 colonnes (`grid-template-columns: repeat(2, 1fr)`).
  - Gap de grille : `--space-5` (24px).
- **Écrans Mobiles (< 680px)** :
  - Affichage en 1 colonne (`grid-template-columns: 1fr`).
  - Gap de grille : `--space-4` (16px).
  - Padding interne de `.device-body` réduit à `--space-4` de tous les côtés.

### 1.5. Wireframe ASCII

```text
+------------------------------------------+
|                                          |
|                IMAGE                     |  <- .device-thumb (ratio 4:3)
|              (Vignette)                  |
|                                          |
+------------------------------------------+
|  Titre Projet          [Statut Univers]  |  <- .device-meta (gap: --space-2)
|  [Tag Contexte]                          |  <- .device-tags (margin: --space-3)
|                                          |
|  Description poétique courte (<= 90 car) |  <- .device-desc
+------------------------------------------+
```

---

## 2. Tags & Badges de Statut

Les tags de contexte et de statut permettent de catégoriser rapidement les univers. Ils utilisent un style de "pastilles bordées" très épuré.

### 2.1. Anatomie HTML

```html
<!-- Tag de Contexte classique -->
<span class="tag">Studio</span>

<!-- Badge de Statut spécifique -->
<span class="tag tag-status">Booking ouvert</span>
```

### 2.2. Espacements & Typographie (en Tokens)

- **Tag classique (`.tag`)** :
  - Padding : `--space-1` (haut/bas) / `--space-3` (gauche/droite).
  - Font-size : `var(--fs-small)` (0.7rem).
  - Font-weight : `500` (Medium).
  - Border-radius : `999px` (pastille).
  - Border : `1px solid var(--tag-border)` (`rgba(0, 0, 0, 0.35)`).
  - Background-color : Transparent.
  - Color : `var(--text)`.

- **Badge de Statut (`.tag-status`)** :
  - Border-style : `dashed` (pour se distinguer visuellement).
  - Border-color : `var(--u-color)` (la couleur d'univers pleine).
  - Background-color : `rgba(var(--u-color-rgb), 0.15)` (teinte d'univers à 15% d'opacité).
  - Color : `var(--text)`.
  - Font-weight : `600` (Semi-bold).

### 2.3. Wireframe ASCII

```text
  ( Tag Contexte )       [ - - Badge Statut d'Univers - - ]
  [ Solide, fin, gris ]   [ Pointillé, fond opacité 15%, coloré ]
```

---

## 3. Intro de Page (`site-intro`)

Présente l'identité générale en haut de la page d'accueil ou des listes de projets, avec une typographie percutante mais aérée.

### 3.1. Anatomie HTML

```html
<header class="site-intro">
  <h1 class="site-title">artn0art</h1>
  <p class="site-lead">DJ · Musicien · Créatif · Sonothérapeute</p>
</header>
```

### 3.2. Espacements & Typographie (en Tokens)

- **Conteneur (`.site-intro`)** :
  - Padding vertical : `--space-6` (haut) / `--space-5` (bas).
  - Border-bottom : `1px solid var(--border)`.
  - Margin-bottom : `--space-3`.
- **Titre principal (`.site-title`)** :
  - Font-family : `var(--font-title)` (Space Grotesk).
  - Font-size : `var(--fs-xl)` (`clamp(1.75rem, 4vw, 2.25rem)`).
  - Font-weight : `800` (Extra Bold).
  - Letter-spacing : `-0.04em` (très serré).
  - Text-transform : `uppercase`.
  - Margin-bottom : `--space-1`.
  - Line-height : `1.1`.
- **Accroche/Sous-titre (`.site-lead`)** :
  - Font-size : `var(--fs-body-lead)` (`clamp(1rem, 2vw, 1.05rem)`).
  - Color : `var(--muted)`.
  - Font-weight : `400` (Regular).

### 3.3. Wireframe ASCII

```text
============================================================
  ARTN0ART                                        <- 800 Upper Space Grotesk
  DJ · Musicien · Créatif · Sonothérapeute        <- 400 Inter Muted
------------------------------------------------------------ <- Border bottom
```

---

## 4. Footer Discret (`site-footer`)

Le pied de page est une zone sobre de fin de lecture, commune à l'ensemble du site.

### 4.1. Anatomie HTML

```html
<footer id="site-footer" class="site-footer">
  <nav class="site-footer__links" aria-label="Liens artn0art">
    <a href="...">SoundCloud</a>
    <a href="...">Contact</a>
    <a href="...">Instagram</a>
  </nav>
  <p class="site-footer__copy">&copy; 2026 artn0art</p>
</footer>
```

### 4.2. Espacements & Typographie (en Tokens)

- **Conteneur (`.site-footer`)** :
  - Padding vertical : `--space-5` (haut) / `--space-6` (bas).
  - Border-top : `1px solid var(--border)`.
  - Display : `flex` avec `justify-content: space-between` et `align-items: center`.
  - Flex-wrap : `wrap` (pour s'empiler proprement sur petit écran).
- **Navigation (`.site-footer__links`)** :
  - Display : `flex`.
  - Gap : `--space-4`.
- **Liens (`.site-footer__links a`)** :
  - Font-size : `var(--fs-small)` (0.8rem).
  - Color : `var(--muted)`.
  - Text-decoration : None.
  - Transition : `opacity 0.15s ease`.
  - Hover : `opacity: 0.6` (ou changement subtil de couleur).
- **Copyright (`.site-footer__copy`)** :
  - Font-size : `var(--fs-small)`.
  - Color : `var(--muted)`.
  - Margin : Aucune.

### 4.3. Contraintes Responsive

- En dessous de **480px**, le conteneur passe en `flex-direction: column` avec alignement au centre, et un gap vertical de `--space-3` entre les liens et le copyright.

### 4.4. Wireframe ASCII

```text
------------------------------------------------------------ <- Border top
  SoundCloud   Contact   Instagram             © 2026 artn0art
============================================================
```
