# Spécification de Mise en Page — Pages Spécifiques (Phase 4)

Ce document décrit les spécifications de mise en page pour les pages individuelles du site **artn0art** qui ne découlent pas directement du catalogue générique de projets ou qui nécessitent un agencement spécifique (DJ, Contact, et particularités des pages secondaires). Il sert de guide pour l'implémentation par **Cursor**.

---

## 1. Page DJ (`content/dj/_index.md`)

La page DJ est une page vitrine majeure. Elle utilise le gabarit de fiche projet mais avec une intégration sonore spécifique (SoundCloud).

### 1.1. Agencement & Ordre des Blocs

1. **Fil d'Ariane** : `Accueil / DJ`
2. **Hero d'Univers** :
   - Fond : Dégradé violet d'univers (`--u-dj` #c4b5fd à 10% d'opacité).
   - Titre : `DJ / Mixage`
   - Accroche : *Sets éclectiques, technique & voyage sonore.*
   - Badges de tags : `Live Set`, `Sélection`.
   - Badge de statut : `Booking ouvert` (fond violet à 15% d'opacité, bordure pointillée violette).
3. **Image principale** : `/images/univers_dj.png` (Technics et table Xone:96 sous lumières violettes).
4. **Corps de texte (Prose)** :
   - Section **À propos** : Biographie d'Arnaud, insistant sur sa double culture (musicien et DJ) et son mixage narratif.
   - Section **Styles & Influences** : Liste à puces aérée détaillant ses trois piliers (Grooves Tropicaux, Musique Électronique, System Culture).
5. **Bloc Intégration Sonore ("Écouter")** :
   - Un lecteur SoundCloud épuré (widget compact, couleur de bouton accordée au violet de l'univers).
6. **Bloc CTA Final** :
   - Fond `--surface`, bordure gauche de 4px solide violette (`--u-dj`).
   - Informations de booking, mail de contact `artn0art@proton.me` et détails techniques (setup autonome Rane One ou intégration régie).

### 1.2. Ce qui change vs le Gabarit Générique
- **Lecteur SoundCloud intégré** : Placé au cœur de la lecture avant le bloc de contact.
- **Couleur d'univers** : Violet clair (`--u-dj` / `#c4b5fd`).

### 1.3. Wireframe DJ

```text
+-------------------------------------------------------------------+
|  Accueil / DJ                                                     |
|                                                                   |
|  +-------------------------------------------------------------+  |
|  |  DJ / MIXAGE                                                |  | <- Violet 10%
|  |  Sets éclectiques, technique & voyage sonore.               |  |
|  |  [Live Set] [Sélection]             [ - - Booking ouvert - ]  |  |
|  +-------------------------------------------------------------+  |
|                                                                   |
|  [ ================ IMAGE PLATINES (VIOLET) ================ ]  |
|                                                                   |
|  ## À propos                                                      |
|  Aussi à l'aise pour faire vibrer un dancefloor sous...           |
|                                                                   |
|  ## Styles & Influences                                           |
|  - Grooves Tropicaux & Afro-Latins (Tim Maia, Guts...)            |
|  - Musique Électronique (House texturée, techno...)               |
|                                                                   |
|  ## Écouter                                                       |
|  +-------------------------------------------------------------+  |
|  |                   WIDGET SOUNDCLOUD (VIOLET)                |  | <- Lecteur audio
|  +-------------------------------------------------------------+  |
|                                                                   |
|  +-------------------------------------------------------------+  |
|  |  Booking & Contact                                          |  | <- CTA Violet
|  |  Email : artn0art@proton.me | Tarif : ~80€/h                |  |
|  +-------------------------------------------------------------+  |
+-------------------------------------------------------------------+
```

---

## 2. Page Contact (`content/contact/_index.md`)

La page de contact doit être la plus sobre et directe du site. Elle ne possède pas de couleur d'univers propre (elle utilise un thème gris neutre pur).

### 2.1. Agencement & Ordre des Blocs

1. **Fil d'Ariane** : `Accueil / Contact`
2. **Header de page** :
   - Titre : `Contact`
   - Accroche : *Discutons de vos projets, programmations ou collaborations.*
3. **Blocs d'informations (2 colonnes sur Desktop, 1 colonne sur Mobile)** :
   - **Colonne Gauche — Direct** : 
     - Email principal : `artn0art@proton.me` (lien mailto cliquable et mis en valeur).
     - Rôle : Point d'entrée unique pour le professionnel ou les collaborations.
   - **Colonne Droite — Réseaux** :
     - Liens vers Instagram (`@artn0art`), SoundCloud (`artn0art`), et GitHub (`artn0art`).
4. **Mention administrative de bas de page** :
   - Numéro de SIRET (`849 803 325 00018`) et rappel de la TVA non applicable.

### 2.2. Ce qui change vs le Gabarit Générique
- **Pas de dégradé d'univers** dans le hero (fond neutre purement transparent).
- **Pas d'image principale** (pour rester ultra-minimaliste).
- **Mise en page en colonnes** pour l'agencement des canaux de contact.

### 2.3. Wireframe Contact

```text
+-------------------------------------------------------------------+
|  Accueil / Contact                                                |
|                                                                   |
|  CONTACT                                                          |
|  Discutons de vos projets, programmations ou collaborations.      |
|  ---------------------------------------------------------------  |
|                                                                   |
|  Booking & Collaboration            Réseaux                       | <- Colonnes
|  Email : artn0art@proton.me         - Instagram : @artn0art       |
|                                     - SoundCloud : artn0art       |
|                                     - GitHub : artn0art           |
|                                                                   |
|  ---------------------------------------------------------------  |
|  Statut administratif :                                           |
|  Auto-entreprise · SIRET 849 803 325 00018 · TVA non applicable   |
+-------------------------------------------------------------------+
```

---

## 3. Pages Secondaires (Producteur, Bricodeur, Massage & Sonothérapie, Reactable, a2dd)

Ces pages s'alignent sur le gabarit de fiche projet générique défini en Phase 3, mais elles adaptent leurs métadonnées, leurs contenus thématiques et intègrent des sous-liaisons ou des rendus spécifiques.

---

### 3.1. Producteur de Musique (`content/projets/producteur/index.md`)

- **Couleur d'Univers** : Rose doux (`--u-musique` / `#fca5a5`).
- **Ordre des Blocs** :
  1. **Fil d'Ariane** : `Accueil / Projets / Producteur`
  2. **Hero d'Univers** :
     - Fond : Dégradé rose d'univers (`--u-musique` à 10% d'opacité en haut, fondu vers 0%).
     - Titre : `Production Musicale`
     - Accroche : *Compositions originales, sound design & lives électroniques.*
     - Badges : Tag `[Studio]`, Statut `[- - Boom Bap & Global - -]`.
  3. **Image principale** : `/images/projet_producteur.png` (Coins arrondis, format large).
  4. **Corps de texte (Prose)** :
     - Introduction sur la recherche du groove et le métissage culturel.
     - Section **Axes de Production** (`h2`) avec ses sous-sections (`h3`) :
       1. *Boom Bap & Lo-Fi Hip-Hop*
       2. *Électropical & Global Bass*
       3. *Sound Design & Sonothérapie*
     - Section **Le Studio & le Setup Live** (`h2`) avec liste d'équipement (Ableton Live, Push 3, Max for Live).
     - Section **Partage & Communauté** (`h2`) (Nantes Ableton User Group, projets collaboratifs).
  5. **Zone d'Action (CTA Contact)** :
     - Fond `--surface`, bordure gauche de 4px solide rose (`--u-musique`).
     - Texte invitant aux collaborations artistiques et email `artn0art@proton.me`.

- **Ce qui change vs le Gabarit Générique** :
  - **Couleur d'univers** : Rose doux (`--u-musique` / `#fca5a5`).
  - **CTA simplifié** : Pas de mention de tarifs fixes, orienté purement vers les collaborations et projets artistiques personnalisés.

- **Wireframe Producteur** :
```text
+-------------------------------------------------------------------+
|  Accueil / Projets / Producteur                                   |
|                                                                   |
|  +-------------------------------------------------------------+  |
|  |  PRODUCTION MUSICALE                                        |  | <- Rose 10%
|  |  Compositions originales, sound design & lives électroniques. |  |
|  |  [Studio]                            [- - Boom Bap & Global -] |  |
|  +-------------------------------------------------------------+  |
|                                                                   |
|  [ ================ IMAGE STUDIO (ROSE ACCENT) ============= ]  |
|                                                                   |
|  Quand les platines se taisent, le studio prend le relais...      |
|                                                                   |
|  ## Axes de Production                                            |
|  ### 1. Boom Bap & Lo-Fi Hip-Hop                                  |
|  Des beats lourds hérités de l'âge d'or...                        |
|                                                                   |
|  ## Le Studio & le Setup Live                                     |
|  - Séquenceur : Ableton Live 12...                                |
|                                                                   |
|  +-------------------------------------------------------------+  |
|  |  Collaborer / Commander une production :                    |  | <- CTA Rose
|  |  Email : artn0art@proton.me                                 |  |
|  +-------------------------------------------------------------+  |
+-------------------------------------------------------------------+
```

---

### 3.2. Bricodeur (`content/projets/bricodeur/index.md`)

- **Couleur d'Univers** : Vert menthe (`--u-reactable` / `#6ee7b7`).
- **Ordre des Blocs** :
  1. **Fil d'Ariane** : `Accueil / Projets / Bricodeur`
  2. **Hero d'Univers** :
     - Fond : Dégradé vert menthe (`--u-reactable` à 10% d'opacité en haut).
     - Titre : `Bricodeur / Créatif Tech`
     - Accroche : *Code, électronique DIY & détournement d'outils audio.*
     - Badges : Tag `[Atelier]`, Statut `[- - Audio DIY - -]`.
  3. **Image principale** : `/images/projet_bricodeur.png` (Format large).
  4. **Corps de texte (Prose)** :
     - Introduction sur la technique comme terrain de jeu.
     - Section **1. La Reactable (Instrument Tangible)** (`h2`) :
       - Fonctionnement, stack (Python, OpenCV, OSC, Ableton) et **lien fort vers la fiche détaillée**.
     - Section **2. a2dd (Assistant DJ & Data Pipeline)** (`h2`) :
       - Le pipeline Python en 11 étapes et **lien fort vers la fiche détaillée**.
     - Section **3. Proto-Audio-Livre (Arduino & NFC)** (`h2`).
     - Section **Stack Technique Globale** (`h2`) (Langages, librairies, matériel).
  5. **Zone d'Action (CTA Contact)** :
     - Fond `--surface`, bordure gauche de 4px solide vert menthe (`--u-reactable`).
     - Texte d'ouverture aux collaborations de prototypage/développement et email.

- **Ce qui change vs le Gabarit Générique** :
  - **Rôle de "page hub"** : Intègre des liens de navigation internes vers deux sous-fiches de projets détaillés (`/projets/reactable/` et `/projets/a2dd/`). Ces liens (`👉 Découvrir la fiche...`) doivent être mis en valeur (police medium, coloration de l'icône/lien au survol avec la couleur d'univers verte).

- **Wireframe Bricodeur** :
```text
+-------------------------------------------------------------------+
|  Accueil / Projets / Bricodeur                                    |
|                                                                   |
|  +-------------------------------------------------------------+  |
|  |  BRICODEUR / CRÉATIF TECH                                   |  | <- Vert 10%
|  |  Code, électronique DIY & détournement d'outils audio.      |  |
|  |  [Atelier]                                   [- - Audio DIY -] |  |
|  +-------------------------------------------------------------+  |
|                                                                   |
|  [ ================ IMAGE CODE / SOUDURE =================== ]  |
|                                                                   |
|  Pour Arnaud (artnoart), la technique n'est jamais un outil...    |
|                                                                   |
|  ## 1. La Reactable (Instrument Tangible)                         |
|  La Reactable est une table musicale interactive...               |
|  👉 Découvrir la fiche détaillée du projet Reactable (Vert hover) |
|                                                                   |
|  ## 2. a2dd (Assistant DJ & Data Pipeline)                        |
|  Pipeline Python d'enrichissement et d'indexation...              |
|  👉 Découvrir la fiche détaillée du projet a2dd (Vert hover)      |
|                                                                   |
|  +-------------------------------------------------------------+  |
|  |  Intéressé par un projet créatif tech ?                     |  | <- CTA Vert
|  |  Email : artn0art@proton.me                                 |  |
|  +-------------------------------------------------------------+  |
+-------------------------------------------------------------------+
```

---

### 3.3. Massage & Sonothérapie (`content/projets/massage-sonotherapie/index.md`)

- **Couleur d'Univers** : Bleu clair (`--u-a2dd` / `#93c5fd` via `#projet-sonotherapie` dans custom.css).
- **Ordre des Blocs** :
  1. **Fil d'Ariane** : `Accueil / Projets / Massage & Sonothérapie`
  2. **Hero d'Univers** :
     - Fond : Dégradé bleu d'univers (`--u-a2dd` à 10% d'opacité).
     - Titre : `Massage & Sonothérapie`
     - Accroche : *Soins corporels, vibrations sonores & équilibre émotionnel.*
     - Badges : Tag `[Cabinet]`, Statut `[- - Relaxation - -]`.
  3. **Image principale** : `/images/projet_sonotherapie.png`.
  4. **Corps de texte (Prose)** :
     - Introduction sur la détente corporelle et vibratoire.
     - Section **1. La Sonothérapie & Bains Sonores** (`h2`) :
       - Descriptif et liste structurée et aérée des **6 Intentions Sonores** (Ancrage, Cœur, Mouvement, Texture, Clarté, Silence Actif).
     - Section **2. Bio-Psycho-Acupressure (BPA)** (`h2`) :
       - Présentation du principe de réinitialisation émotionnelle par acupression.
     - Section **3. Massages Corporels & Détente physique** (`h2`).
  5. **Zone d'Action (CTA Contact)** :
     - Fond `--surface`, bordure gauche de 4px solide bleu clair (`--u-a2dd`).
     - Détails sur le déroulement des séances (cabinet ou domicile sur Nantes) et email de rendez-vous.

- **Ce qui change vs le Gabarit Générique** :
  - **Couleur d'univers** : Bleu clair (`--u-a2dd` / `#93c5fd`).
  - **Rythme vertical** : Espacement accru (`--space-3` à `--space-4`) sur la liste des 6 intentions pour faciliter la lecture zen de cette section.

- **Wireframe Sonothérapie** :
```text
+-------------------------------------------------------------------+
|  Accueil / Projets / Massage & Sonothérapie                       |
|                                                                   |
|  +-------------------------------------------------------------+  |
|  |  MASSAGE & SONOTHÉRAPIE                                     |  | <- Bleu 10%
|  |  Soins corporels, vibrations sonores & équilibre émotionnel. |  |
|  |  [Cabinet]                                  [- - Relaxation -] |  |
|  +-------------------------------------------------------------+  |
|                                                                   |
|  [ ================ IMAGE BOL TIBÉTAIN (BLEU) ============== ]  |
|                                                                   |
|  ## 1. La Sonothérapie & Bains Sonores                            |
|  La sonothérapie utilise les ondes sonores...                     |
|                                                                   |
|  1. Ancrage (Grounding) — Reconnexion à la terre...               |
|  2. Cœur (Heart) — Ouverture, compassion...                       |
|  ...                                                              |
|                                                                   |
|  +-------------------------------------------------------------+  |
|  |  Séances en cabinet ou à domicile (Nantes).                 |  | <- CTA Bleu
|  |  Prendre rendez-vous : artn0art@proton.me                   |  |
|  +-------------------------------------------------------------+  |
+-------------------------------------------------------------------+
```

---

### 3.4. Projet Réactable (`content/projets/reactable/index.md`)

- **Couleur d'Univers** : Vert menthe (`--u-reactable` / `#6ee7b7`).
- **Ordre des Blocs** :
  1. **Fil d'Ariane** : `Accueil / Projets / Bricodeur / Reactable` (Double niveau de parenté pour clarifier la navigation).
  2. **Hero d'Univers** :
     - Fond : Dégradé vert menthe (`--u-reactable` à 10% d'opacité).
     - Titre : `Reactable — instrument tangible`
     - Accroche : *Performance live interactive : des disques sur une table deviennent des couches sonores.*
     - Badges : Tag `[Recherche]`, Statut `[R&D en cours]`.
  3. **Image principale** : `/images/projet_reactable.png` (s'il n'y a pas d'image spécifique, hérite de `/images/projet_bricodeur.png` avec filtre).
  4. **Corps de texte (Prose)** :
     - Section **Le principe** (`h2`) (Disques physiques, intentions sonores, gestuelle interactive).
     - Section **Chaîne technique** (`h2`) :
       - Diagramme textuel de la chaîne de transmission (Webcam → OpenCV → Python → OSC → Ableton).
     - Section **Roadmap en 3 sprints** (`h2`) :
       - Sprint 1 (5 €) / Sprint 2 (~50 €) / Sprint 3 (300-800 €) détaillés en listes à puces.
     - Section **Pourquoi ce projet ?** (`h2`) et **État actuel** (`h2`).
  5. **Zone d'Action (CTA Contact)** :
     - Fond `--surface`, bordure gauche de 4px solide vert menthe.
     - Email pour échanges techniques sur la musique tangible.

- **Ce qui change vs le Gabarit Générique** :
  - **Fil d'Ariane** : Cheminement à double niveau (`Bricodeur / Reactable`) pour refléter que le projet est un sous-ensemble technique de l'activité Bricodeur.
  - **Diagramme technique** : Rendu dans un bloc préformaté type code avec police monospace pour marquer l'aspect programmation.

- **Wireframe Reactable** :
```text
+-------------------------------------------------------------------+
|  Accueil / Projets / Bricodeur / Reactable                        |
|                                                                   |
|  +-------------------------------------------------------------+  |
|  |  REACTABLE — INSTRUMENT TANGIBLE                            |  | <- Vert 10%
|  |  Performance live interactive : des disques sur une table... |  |
|  |  [Recherche]                               [ R&D en cours ] |  |
|  +-------------------------------------------------------------+  |
|                                                                   |
|  [ ================ IMAGE TABLE INTERACTIVE ================ ]  |
|                                                                   |
|  ## Le principe                                                   |
|  Chaque disque porte un marqueur visuel (ArUco)...                |
|                                                                   |
|  ## Chaîne technique                                              |
|  +-------------------------------------------------------------+  |
|  | Webcam -> OpenCV -> Python -> OSC -> Ableton -> Envelop...   |  | <- Bloc Code
|  +-------------------------------------------------------------+  |
|                                                                   |
|  +-------------------------------------------------------------+  |
|  |  Discuter de l'instrumentation tangible :                   |  | <- CTA Vert
|  |  Email : artn0art@proton.me                                 |  |
|  +-------------------------------------------------------------+  |
+-------------------------------------------------------------------+
```

---

### 3.5. Projet a2dd (`content/projets/a2dd/index.md`)

- **Couleur d'Univers** : Bleu clair (`--u-a2dd` / `#93c5fd`).
- **Ordre des Blocs** :
  1. **Fil d'Ariane** : `Accueil / Projets / Bricodeur / a2dd`
  2. **Hero d'Univers** :
     - Fond : Dégradé bleu d'univers (`--u-a2dd` à 10% d'opacité).
     - Titre : `a2dd — Assistant 2 Didier`
     - Accroche : *Pipeline de gestion et d'enrichissement de collection musicale DJ.*
     - Badges : Tag `[Python]`, Statut `[5310 tracks]`.
  3. **Image principale** : `/images/projet_a2dd.png`.
  4. **Corps de texte (Prose)** :
     - Introduction sur le tri et le nettoyage d'une bibliothèque musicale.
     - Section **Ce que fait a2dd** (`h2`) :
       - Le pipeline détaillé en 11 étapes numérotées très denses.
     - Section **Stack technique** (`h2`) et **Pourquoi ce projet ?** (`h2`).
  5. **Zone d'Action (CTA Contact)** :
     - Fond `--surface`, bordure gauche de 4px solide bleu clair (`--u-a2dd`).
     - Email de contact pour échanges sur le développement de scripts DJ ou l'API Discogs/Spotify.

- **Ce qui change vs le Gabarit Générique** :
  - **Fil d'Ariane** : Cheminement sous-projet (`Bricodeur / a2dd`).
  - **Formatage du Pipeline** : Le pipeline à 11 étapes est représenté sous forme de liste compacte et ordonnée pour conserver l'esprit "algorithmique" du projet.

- **Wireframe a2dd** :
```text
+-------------------------------------------------------------------+
|  Accueil / Projets / Bricodeur / a2dd                             |
|                                                                   |
|  +-------------------------------------------------------------+  |
|  |  A2DD — ASSISTANT 2 DIDIER                                  |  | <- Bleu 10%
|  |  Pipeline de gestion et d'enrichissement de collection DJ.  |  |
|  |  [Python]                                  [  5310 tracks ] |  |
|  +-------------------------------------------------------------+  |
|                                                                   |
|  [ ================ IMAGE DU DASHBOARD PYTHON ============== ]  |
|                                                                   |
|  ## Ce que fait a2dd                                              |
|  Un pipeline en 11 étapes qui part d'un fichier audio brut :      |
|  1. Download | 2. Formatage | 3. Détection genre | 4. Mood...     |
|                                                                   |
|  +-------------------------------------------------------------+  |
|  |  Échanger sur le catalogage automatisé de musique :         |  | <- CTA Bleu
|  |  Email : artn0art@proton.me                                 |  |
|  +-------------------------------------------------------------+  |
+-------------------------------------------------------------------+
```

---

## 4. Contraintes Responsive Globales

- **SoundCloud Player** : Doit être configuré à `width: 100%` pour ne pas casser la mise en page sur mobile. Sur petit écran, le widget SoundCloud bascule automatiquement en mode compact.
- **Grille de contact** : Sur mobile, la disposition en deux colonnes (Direct / Réseaux) s'effondre pour former un empilement vertical à une seule colonne, avec une marge `--space-5` de séparation.
