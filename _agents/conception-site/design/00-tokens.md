# Design Tokens — artn0art

Ce document définit le système de design tokens de référence pour le site vitrine et portfolio **artn0art**. Il sert de spécification technique unique pour l'implémentation CSS par l'agent **Cursor**.

Conformément à la direction artistique inspirée de **fors.fm/devices**, le design privilégie la sobriété, un contraste de formes fort, une typographie compacte et des accents de couleur ultra-ciblés pour préserver le minimalisme de l'interface.

---

## 1. Palette Chromatique

Le site utilise un mode clair forcé (les switchs et détections automatiques du thème Blowfish sont désactivés pour respecter la charte fors.fm).

### 1.1. Couleurs Neutres (Fondations)

| Token CSS | Valeur hex/rgba | Rôle / Usage principal |
| :--- | :--- | :--- |
| `--bg` | `#e4e4e4` | Fond principal du site (gris neutre typique de fors.fm) |
| `--surface` | `#ebebeb` | Fond des cartes projet (device-card) au repos |
| `--row-hover` | `#f3f3f3` | Fond des cartes projet au survol (éclaircissement subtil) |
| `--text` | `#141414` | Texte principal (titres, paragraphes, icônes) |
| `--muted` | `#5a5a5a` | Texte secondaire (descriptions, kicker, sous-titres, métadonnées) |
| `--border` | `rgba(0, 0, 0, 0.1)` | Bordures fines de structure (séparateurs, contours de cartes) |
| `--tag-border` | `rgba(0, 0, 0, 0.35)`| Bordures des tags de contexte (pastilles) |

### 1.2. Couleurs d'Univers par Projet (Accents)

Chaque projet ou facette dispose de sa propre couleur d'identité.

| Univers / Projet | Token CSS | Valeur hex | Usage et sensation |
| :--- | :--- | :--- | :--- |
| **DJ** | `--u-dj` | `#c4b5fd` | Violet clair · Énergie nocturne, selecta |
| **Reactable** | `--u-reactable`| `#6ee7b7` | Vert menthe · Tangibilité, live technologique |
| **Jukbike** | `--u-jukbike` | `#fcd34d` | Jaune doré · Plein air, déambulation festive |
| **a2dd** | `--u-a2dd` | `#93c5fd` | Bleu clair · Data, rigueur, indexation |
| **Musique** | `--u-musique` | `#fca5a5` | Rose doux · Composition, studio, soundscapes |

### 1.3. Règles d'Usage des Couleurs d'Univers

Pour conserver la sobriété de l'inspiration **fors.fm**, les couleurs d'univers doivent être appliquées à dose homéopathique.

1. **Sur la Carte Projet (Home & Catalogue)** :
   - Le fond de la carte reste neutre (`--surface`).
   - Le badge de **Statut** (ex: *Booking ouvert*, *Sur devis*) est le seul élément coloré : il utilise un fond avec la couleur d'univers correspondante à **15% d'opacité** (`rgba` ou `color-mix`), avec une bordure en couleur d'univers pleine (opacité 100%) et du texte sombre (`--text`).
   - Lors du **Hover** (survol), la bordure extérieure de la carte passe de `--border` (gris) à la couleur d'univers correspondante (100% d'opacité). C'est un indicateur d'action interactif très élégant.

2. **Sur les Pages de Détails (Pages projets & DJ)** :
   - Le header de la page (`.univers-hero`) utilise un fond dégradé très discret : de la couleur d'univers à **10% d'opacité** en haut vers un fondu transparent (`rgba(..., 0)`) en bas.
   - Les liens actifs ou accents typographiques (kicker, bordure basse du fil d'Ariane) utilisent la couleur d'univers à 100% d'opacité.

---

## 2. Typographie

Le contraste typographique s'appuie sur deux polices : **Space Grotesk** (grotesque géométrique serrée pour le branding et les titres) et **Inter** (pour le texte de lecture).

### 2.1. Font Families

```css
--font-title: "Space Grotesk", "Inter", system-ui, -apple-system, sans-serif;
--font-body: "Inter", system-ui, -apple-system, sans-serif;
```

### 2.2. Échelle de Tailles Fluides (Responsive Clamps)

L'échelle typographique s'adapte dynamiquement à la taille de l'écran via la fonction `clamp()`.

| Token CSS | Équivalent Rem | Formule Fluide (Clamp) | Usage principal |
| :--- | :--- | :--- | :--- |
| `--fs-xl` | ~2.25rem | `clamp(1.75rem, 4vw, 2.25rem)` | Titre de marque (Branding), Titres h1 |
| `--fs-lg` | ~1.65rem | `clamp(1.35rem, 3.5vw, 1.65rem)`| Titres de sections (h2) |
| `--fs-md` | ~1.25rem | `clamp(1.15rem, 2.5vw, 1.25rem)`| Titres de cartes, sous-titres (h3) |
| `--fs-body-lead`| ~1.05rem | `clamp(1rem, 2vw, 1.05rem)` | Paragraphe d'accroche (Lead) |
| `--fs-body` | ~0.92rem | `clamp(0.88rem, 1.5vw, 0.92rem)`| Texte courant, paragraphes |
| `--fs-small` | ~0.72rem | `clamp(0.68rem, 1.2vw, 0.72rem)`| Tags de contexte, statut, footer |

### 2.3. Graisses Typographiques (Font Weights)

- **Extra Bold** (`800`) : Uniquement pour le branding titre (`.site-title`).
- **Bold** (`700`) : Titres de section et de cartes (`h2`, `h3`, `.device-title`).
- **Medium** (`500`) : Menu de navigation, tags de contexte, badges de statut.
- **Regular** (`400`) : Texte courant (`.device-desc`, paragraphes prose).

### 2.4. Hauteurs de Ligne (Line Heights) & Letter Spacing

- **Titres serrés (Space Grotesk)** :
  - `line-height: 1.15` (pour éviter les chevauchements en grandes tailles).
  - `letter-spacing: -0.04em` (pour le branding) et `-0.02em` (pour les titres `h2`/`h3`).
- **Texte de lecture (Inter)** :
  - `line-height: 1.5` (confort de lecture).
  - `letter-spacing: 0.01em` (légère aération).

---

## 3. Système d'Espacements & Grille

Le rythme vertical et horizontal s'appuie sur une grille de base de **8px** (avec une valeur intermédiaire à 4px).

### 3.1. Échelle d'Espacement

| Token CSS | Valeur en Rem | Valeur en Pixels | Usages types |
| :--- | :--- | :--- | :--- |
| `--space-1` | `0.25rem` | 4px | Padding interne serré, petit gap de tag |
| `--space-2` | `0.5rem` | 8px | Gap entre titre et tag, margin meta |
| `--space-3` | `0.75rem` | 12px | Padding des petits tags, gap entre métas |
| `--space-4` | `1rem` | 16px | Padding interne des corps de cartes, gap de grille |
| `--space-5` | `1.5rem` | 24px | Gap de la grille principale de cartes |
| `--space-6` | `2rem` | 32px | Padding vertical des intros, marges de cartes |
| `--space-7` | `3rem` | 48px | Espacement entre grandes sections du site |
| `--space-8` | `4rem` | 64px | Padding vertical global haut/bas de la page |

### 3.2. Contraintes de Grille & Conteneur

- **Largeur max du conteneur (`main`)** : `64rem` (1024px) pour laisser respirer la grille à deux colonnes.
- **Grille principale (`.device-list`)** :
  - Desktop : `display: grid; grid-template-columns: repeat(2, 1fr); gap: var(--space-5);`
  - Mobile (sous 680px) : `grid-template-columns: 1fr; gap: var(--space-4);`

---

## 4. États & Accessibilité (States)

### 4.1. Carte Projet (device-card)

- **Repos** :
  - Fond : `var(--surface)` (#ebebeb).
  - Bordure : `1px solid var(--border)` (gris neutre).
  - Transform : Aucun.
- **Hover (Survol)** :
  - Fond : Éclaircissement vers `var(--row-hover)` (#f3f3f3).
  - Bordure : Devient `1px solid var(--u-color)` (couleur d'univers correspondante).
  - Effet 3D : Translation verticale de -2px (`transform: translateY(-2px)`) + ombre portée floue `box-shadow: 0 10px 28px rgba(0, 0, 0, 0.09)`.
  - Zoom Image : Léger grossissement de la photo dans son cadre : `.device-thumb img` applique `transform: scale(1.02)`.
  - Transition : `all 0.18s cubic-bezier(0.16, 1, 0.3, 1)`.

### 4.2. Accessibilité & Focus (a11y)

- **Focus visible** :
  - Tout élément focalisable par tabulation clavier (cartes, boutons, liens de navigation) doit afficher un contour net.
  - Style : `outline: 2px solid var(--text)` avec un décalage de `outline-offset: 2px`.
  - Désactivation de l'outline par défaut uniquement si `:focus-visible` est pris en charge, afin de le réserver aux utilisateurs de la navigation clavier.

### 4.3. Liens de Navigation & Paragraphes

- **Menu de navigation** : Opacité `0.8` au repos, transition vers `0.55` au survol (effet atténué).
- **Liens dans la prose** : Soulignement simple par défaut (`text-decoration: underline`), transition de couleur d'univers sur le hover.
