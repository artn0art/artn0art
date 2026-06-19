# Spécification d'Audit et d'Optimisation — Responsive, Accessibilité (a11y) & Perf (Phase 5)

Ce document dresse la liste priorisée (P1/P2/P3) des points d'optimisation identifiés suite à l'audit du site **artn0art** (v0.2.2). Il sert de spécification technique pour l'implémentation des corrections par **Cursor**.

---

## 1. Priorité P1 : Critique & Urgent (Bloquants A11y & Perf)

### 1.1. Contraste des Liens au Survol dans la Prose (Accessibilité)
* **Problème** : 
  Dans la classe `.projet-body.prose a:hover` (ligne 608 de `custom.css`), la couleur de texte passe directement à la couleur d'univers `var(--u-color)`. 
  Or, les couleurs d'univers sur fond gris clair (`--bg` #e4e4e4 ou `--surface` #ebebeb) présentent des ratios de contraste extrêmement bas et non conformes au standard WCAG AA (qui exige un ratio minimum de 4.5:1 pour le texte courant) :
  * Jaune (`--u-jukbike` #fcd34d) : **1.01:1** (quasi invisible)
  * Vert menthe (`--u-reactable` #6ee7b7) : **1.2:1** (illisible)
  * Rose (`--u-musique` #fca5a5) : **1.3:1** (très faible)
  * Bleu clair (`--u-a2dd` / `--u-sonotherapie` #93c5fd) : **1.4:1** (illisible)
  * Violet (`--u-dj` #c4b5fd) : **1.6:1** (faible)
* **Solution** : 
  Ne jamais appliquer `var(--u-color)` directement sur le texte du lien au survol. Conserver `color: var(--text)` (ou une nuance très sombre) et indiquer le survol en colorant uniquement le soulignement ou en ajoutant un arrière-plan très léger.
* **Code Recommandé (CSS)** :
  ```css
  .projet-body.prose a:hover {
    color: var(--text);
    text-decoration-color: var(--u-color); /* Colore le soulignement */
    background-color: color-mix(in srgb, var(--u-color) 15%, transparent); /* Surlignage discret */
    border-radius: 2px;
  }
  ```

### 1.2. Poids des Images d'Univers et Projets (Performance)
* **Problème** : 
  Les 5 illustrations clés situées dans `static/images/` sont au format PNG non compressé et pèsent au total **plus de 4 Mo** (de 639 Ko à 1.01 Mo par image) :
  * `projet_jukbike.png` : 1.01 Mo
  * `projet_bricodeur.png` : 861 Ko
  * `univers_dj.png` : 760 Ko
  * `projet_producteur.png` : 775 Ko
  * `projet_sonotherapie.png` : 639 Ko
  Cela pénalise fortement le Largest Contentful Paint (LCP) sur les connexions mobiles.
* **Solution** : 
  1. Convertir toutes ces images au format moderne **WebP** avec un taux de compression de 82%. Cela réduira leur poids individuel entre **70 Ko et 120 Ko** (soit environ **90% de réduction** sans perte de qualité visuelle perceptible).
  2. Mettre à jour toutes les références d'extension `.png` en `.webp` dans :
     * `data/profils.yaml`
     * Le front-matter des fiches projets : `content/dj/_index.md`, `content/projets/*/index.md`.
     * `layouts/partials/extend-head.html` (pour l'image Open Graph `og-image.png`).

---

## 2. Priorité P2 : Important (Accessibilité & Robustesse Responsive)

### 2.1. Attributs d'Accessibilité (ARIA) pour les Liens Externes (Accessibilité)
* **Problème** : 
  Les liens vers les réseaux sociaux (SoundCloud, Instagram, GitHub) s'ouvrent dans un nouvel onglet via `target="_blank"`, mais cette action n'est pas signalée aux lecteurs d'écran.
* **Solution** : 
  Ajouter un attribut `aria-label` descriptif pour chaque lien externe ou ajouter une icône accessible.
* **Code Recommandé (HTML)** :
  * **Footer** (`layouts/partials/footer.html`) :
    ```html
    <a href="https://soundcloud.com/artn0art" target="_blank" rel="noopener noreferrer" aria-label="SoundCloud (s'ouvre dans un nouvel onglet)">SoundCloud</a>
    <a href="https://instagram.com/artn0art" target="_blank" rel="noopener noreferrer" aria-label="Instagram (s'ouvre dans un nouvel onglet)">Instagram</a>
    ```
  * **Contact** (`layouts/contact/list.html`) :
    ```html
    <li><a href="https://instagram.com/artn0art" rel="noopener noreferrer" target="_blank" aria-label="Instagram de @artn0art (s'ouvre dans un nouvel onglet)">Instagram · @artn0art</a></li>
    ```

### 2.2. Textes Alternatifs (`alt`) des Images de Fiches et Cartes (Accessibilité)
* **Problème** : 
  Les attributs `alt` des balises `<img>` dans `projet-device.html` et `single.html` reprennent exactement le titre de la fiche (ex. `alt="{{ $p.title }}"`). Pour un lecteur d'écran, cela provoque une répétition inutile de l'information déjà présente dans la balise `h3` ou `h1`.
* **Solution** : 
  Rendre le texte alternatif plus descriptif et contextuel.
* **Code Recommandé (HTML)** :
  * **Carte Projet** (`layouts/partials/projet-device.html`) :
    ```html
    <img src="{{ $p.image }}" alt="Aperçu visuel : {{ $p.title }} - {{ $p.description }}" loading="lazy" width="800" height="600" />
    ```
  * **Fiche unique** (`layouts/projets/single.html` et `layouts/dj/list.html`) :
    ```html
    <img src="{{ . }}" alt="Illustration représentative de l'univers {{ $meta.heroTitle }}" loading="eager" width="1280" height="720" />
    ```

### 2.3. Robustesse Typographique sur Mobile (Responsive)
* **Problème** : 
  Sur les petits écrans (<375px), les longs titres en `Space Grotesk` bold (`--fs-xl` et `--fs-lg`) avec un espacement de lettres resserré (`letter-spacing: -0.03em`) risquent de déborder ou de s'enrouler de manière inesthétique.
* **Solution** : 
  S'assurer que les longs mots ne cassent pas le layout et ajuster dynamiquement la césure si nécessaire.
* **Code Recommandé (CSS)** :
  ```css
  .univers-hero h1,
  .contact-hero h1,
  .device-title {
    word-wrap: break-word;
    word-break: break-word;
    hyphens: auto;
  }
  ```

---

## 3. Priorité P3 : Souplesse & Alignement Esthétique (Micro-ajustements)

### 3.1. Hébergement des Polices de Caractères Localement (Performance & RGPD)
* **Problème** : 
  Les polices `Space Grotesk` et `Inter` sont actuellement chargées via l'API Google Fonts (dans `extend-head.html`), ce qui entraîne une requête DNS externe supplémentaire et pose un problème de conformité RGPD.
* **Solution** : 
  Télécharger les fichiers WOFF2 de ces polices, les placer dans `static/fonts/` et les déclarer dans `custom.css` via `@font-face`.
* **Note** : Optionnel pour cette phase, mais fortement recommandé pour la version de production finale.

### 3.2. Espacements Verticaux des Listes Denses sur Mobile (Responsive)
* **Problème** : 
  Sur mobile, les listes denses et ordonnées (ex. le pipeline 11 étapes d'a2dd ou les 6 intentions) manquent d'aération verticale lorsque la largeur de l'écran force le texte à s'enrouler sur plusieurs lignes.
* **Solution** : 
  Ajuster le `line-height` et le `margin-bottom` des éléments de listes sur mobile.
* **Code Recommandé (CSS)** :
  ```css
  @media (max-width: 680px) {
    .projet-body.prose li {
      margin-bottom: var(--space-2);
    }
  }
  ```
