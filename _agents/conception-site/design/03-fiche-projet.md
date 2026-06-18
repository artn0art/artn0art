# Spécification Gabarit Fiche Projet — Template Unique (Phase 3)

Ce document définit le gabarit générique (layout de type `single`) pour les fiches projets et univers du site **artn0art**. Il prend pour référence le projet **Jukbike** ([content/projets/jukbike/index.md](file:///Users/artnoart/Code/_projets/artn0art/content/projets/jukbike/index.md)) et sert de spécification technique pour l'implémentation par **Cursor** (dans `layouts/projets/single.html` ou `layouts/projets/list.html` selon l'arborescence Hugo).

---

## 1. Structure Générale de la Fiche Projet

Le gabarit s'organise verticalement en 5 blocs principaux afin de guider le visiteur de l'accroche jusqu'à la prise de contact.

### 1.1. Fil d'Ariane (Breadcrumbs)
- Position : Tout en haut, au-dessus du Hero.
- Style : Typographie petite (`--fs-small`), couleur estompée (`--muted`).
- Séparateur : Symbole discret (`/` ou `>`).
- Rôle : Permettre un retour rapide à la liste des projets ou à l'accueil.

### 1.2. Hero d'Univers (`.univers-hero`)
Le hero installe l'ambiance visuelle du projet grâce à la couleur d'univers.
- **Fond coloré d'univers** : Un dégradé linéaire discret qui commence avec la couleur d'univers à **10% d'opacité** en haut et s'estompe vers une opacité de 0% en bas.
  ```css
  background: linear-gradient(180deg, rgba(var(--u-color-rgb), 0.1) 0%, rgba(var(--u-color-rgb), 0) 100%);
  ```
- **Titre du projet** : En grand (`--fs-xl`), typographie *Space Grotesk* bold, avec espacement resserré (`letter-spacing: -0.03em`).
- **Accroche (Lead)** : Paragraphe court en `--fs-body-lead` décrivant l'essence du projet.
- **Méta-bloc** : Une ligne contenant les tags de contexte (pastilles) et le badge de statut coloré d'univers (fond 15% opacité, texte sombre, bordure pointillée).

### 1.3. Image Dominante
- Position : Entre le Hero et le Corps de texte.
- Style : Image au format large (`16 / 9` ou `21 / 9`), avec des coins arrondis (`border-radius: 12px`) et une bordure fine (`1px solid var(--border)`).
- Rôle : Fournir le choc visuel du projet immédiatement après le titre.

### 1.4. Corps de Page (Content / Prose)
- Style : Géré par le moteur Markdown de Hugo avec une classe `.prose` personnalisée.
- **Lisibilité** : La largeur de ligne des paragraphes est contrainte à un maximum de **75 caractères** (`max-width: 45rem`) pour une lecture confortable.
- **Hiérarchie des titres** :
  - `## Titres principaux` : `--fs-lg` (Space Grotesk, margin-top généreuse, bordure basse très fine de séparation).
  - `### Sous-titres / Modules` : `--fs-md` (Space Grotesk, margin-top moyenne).
- **Blocs thématiques** (ex: les 4 modules Jukbike) : structurés en listes aérées ou en petits blocs à fond gris neutre.

### 1.5. Zone d'Action (CTA Contact)
- Position : En bas de page, après le contenu.
- Style : Un bloc à fond `--surface` avec une bordure gauche épaisse (4px) de la couleur d'univers.
- Contenu : Liens directs vers l'email pro (`artn0art@proton.me` ou `jukbike@gmail.com`) et informations clés (tarifs, SIRET).
- Rôle : Convertir la lecture en demande de booking.

---

## 2. Application de la Couleur d'Univers (Sobriété)

Pour chaque projet, la couleur d'univers (`--u-color`) s'applique automatiquement sur les sélecteurs suivants :

1. **Lueur de fond du Hero** : Gradation de 10% d'opacité vers transparent.
2. **Bordure gauche du bloc CTA** : Ligne verticale de 4px solide.
3. **Puces et surlignages** : Si la prose contient des listes à puces ou des liens, ils héritent de la couleur d'univers au survol.
4. **Contour du badge de Statut** : Liseré pointillé de couleur d'univers.

---

## 3. Wireframes Rendu

### 3.1. Rendu Desktop (≥ 768px)

Le Hero et le corps de texte sont centrés dans la page de `64rem`.

```text
+-------------------------------------------------------------------+
|  Accueil / Projets / Jukbike                                      | <- Fil d'Ariane
|                                                                   |
|  +-------------------------------------------------------------+  |
|  |  JUKBIKE                                                    |  | <- Hero (dégradé
|  |  Disco mobile & sonorisation écologique sur deux roues      |  |    univers 10%)
|  |                                                             |  |
|  |  [Plein air] [AE]                    [ - - Sur devis - - ]  |  | <- Tags & Statut
|  +-------------------------------------------------------------+  |
|                                                                   |
|  +-------------------------------------------------------------+  |
|  |                                                             |  |
|  |                        IMAGE LARGE                          |  | <- Image 16:9
|  |                                                             |  |    coins arrondis
|  +-------------------------------------------------------------+  |
|                                                                   |
|  ## Le Concept                                                    | <- Titre Section h2
|  Le Jukbike est un sound system autonome monté sur...             | <- Texte (max 75 car)
|                                                                   |
|  ### 1. Jukbox (DJ participatif)                                  | <- Sous-titre h3
|  Une régie DJ ouverte où le public participe...                   |
|                                                                   |
|  ## Tarification & Contact                                        |
|  +-------------------------------------------------------------+  |
|  |  Pour réserver ou collaborer :                              |  | <- Bloc CTA
|  |  Email : jukbike@gmail.com | artn0art@proton.me             |  |    (Bordure gauche
|  |  Tarif standard : ~80 € / heure + déplacement.              |  |    couleur univers)
|  +-------------------------------------------------------------+  |
+-------------------------------------------------------------------+
```

### 3.2. Rendu Mobile (< 768px)

Les marges latérales sont réduites à `--space-4` (16px), l'image passe en pleine largeur d'écran, et les blocs s'empilent verticalement.

```text
+-----------------------------------+
| Accueil / Projets / Jukbike       |
|                                   |
| JUKBIKE                           |
| Disco mobile & sonorisation...    |
| [Plein air]                       |
| [- - Sur devis - -]               |
|                                   |
| +-------------------------------+ |
| |             IMAGE             | |
| +-------------------------------+ |
|                                   |
| ## Le Concept                     |
| Le Jukbike est un sound system... |
|                                   |
| +-------------------------------+ |
| | Pour réserver :               | | <- CTA
| | jukbike@gmail.com             | |
| +-------------------------------+ |
+-----------------------------------+
```

---

## 4. Comportement Responsive & Accessibilité

- **Lisibilité** : La taille de la police prose augmente légèrement sur grand écran (`clamp()`), mais la largeur du bloc de texte reste verrouillée pour éviter les lignes trop longues fatigantes pour l'œil.
- **Contrastes** : La couleur d'univers n'est **jamais** utilisée comme fond sous du texte blanc, pour éviter tout problème de contraste a11y. Le texte sur fond teinté d'univers est toujours `--text` (#141414).
