# Plan photo — aider les visiteurs à se projeter

> Objectif : passer d'un site « logos + texte » à un site où pros et collectivités
> **visualisent l'ambiance** avant de contacter. Priorité aux pages live (DJ, Jukbike).
>
> Convention : déposer les images dans `static/images/galerie/<page>/`, format **.webp**,
> largeur ~1600 px, paysage sauf mention.
>
> **Deux mécanismes** selon la page :
> - **DJ, Ateliers, Producteur** : shortcode `{{< gallery >}}` (bloc en commentaire dans la page — décommenter après dépôt des fichiers).
> - **Jukbike** : champ `photos:` par module dans le front matter — **pas** de bloc `{{< gallery >}}` (voir § 2).

## Comment activer une galerie (DJ, Ateliers, Producteur)

1. Déposer les photos nommées comme ci-dessous dans le bon dossier `static/images/galerie/…`.
2. Ouvrir la page concernée, retirer les balises `<!--` et `-->` autour du bloc `{{< gallery >}}`.
3. Rebuild / commit → la galerie s'affiche.

> **Jukbike** : mécanique différente — voir § 2 et le bloc ⚙️ Instruction Cursor.

---

## 1. DJ — `static/images/galerie/dj/` — PRIORITÉ HAUTE

Ce que le client veut sentir : l'énergie d'un set, une piste qui danse, le matériel pro.

| Fichier | Sujet idéal | Format |
|---|---|---|
| `live-01.webp` | Arnaud aux platines en pleine action (mains sur le mixer) | paysage |
| `live-02.webp` | Vue de la piste / public qui danse pendant le set | paysage |
| `live-03.webp` | Ambiance lumière + cabine DJ dans un lieu (bar, salle) | paysage |
| `live-04.webp` | Portrait / plan rapproché casque, regard vers le public *(optionnel)* | portrait ou carré |

Minimum utile : **3 photos** (live-01 à 03).

## 2. Jukbike — `static/images/galerie/jukbike/` — ✅ galerie active (2026-07-05)

Ce que le client (mairie, festival, marché) veut sentir : le triporteur-sono au milieu
des gens, la déambulation, chaque module en situation.

**Convention de nommage : `theme-qualite.webp`** (qualité **A** = excellent retenu · **B** = bon · **C** = moyen). Images ~1600 px côté long, webp, < 300 Ko.

Livré (photos affichées sous « concept / ambiance » de chaque onglet) :

| Fichier | Contenu | Format | → Onglet |
|---|---|---|---|
| `velo-festival-A.webp` | Le Jukbike entier de profil sur un stand de festival | paysage | Jukbike (`jukbox`) |
| `public-guinguette-A.webp` | Public attablé autour du Jukbike, ambiance guinguette | paysage | Jukbike (`jukbox`) |
| `bord-erdre-B.webp` | Setup complet + public au bord de l'Erdre (enceintes visibles) | portrait | Jukbike (`jukbox`) |

**Correspondance `id` → onglet** (colonne « → Onglet ») :

| `id` (front matter) | Titre affiché dans l'accordéon |
|---|---|
| `jukbox` | Jukbike |
| `crieur` | Crieur de Rue |
| `openmic` | Open Mic |
| `karaoke` | Karaoké de Rue |

> **⚙️ Instruction Cursor — ajouter des photos à un onglet Jukbike**
>
> Les photos ne passent **plus** par un bloc `{{< gallery >}}`. Elles sont déclarées dans le
> **front matter** de `content/projets/jukbike/index.md`, champ `photos:` **sur le module**
> concerné (même niveau que `concept:` et `ambiance:`). Le shortcode `{{< modules >}}` appelle
> `layouts/shortcodes/modules.html`, qui rend la galerie sous le texte concept/ambiance
> (classe `.module-gallery` dans `assets/css/custom.css`).
>
> **Procédure**
> 1. Déposer le fichier dans `static/images/galerie/jukbike/` (nom `theme-qualite.webp`).
> 2. Ouvrir `content/projets/jukbike/index.md`.
> 3. Repérer le module par son `id` (`jukbox`, `crieur`, `openmic`, `karaoke`).
> 4. Ajouter ou compléter le bloc `photos:` **sous** `ambiance:` (pas dans le corps markdown).
>
> **Exemple YAML** (extrait du module `jukbox`) :
>
> ```yaml
> modules:
>   - id: jukbox
>     icon: /images/modules/jukbox.webp
>     title: Jukbike
>     tag: Vélo disco mobile
>     concept: "…"
>     ambiance: "…"
>     photos:
>       - src: /images/galerie/jukbike/velo-festival-A.webp
>         alt: "Le Jukbike de profil sur un stand de festival"
>       - src: /images/galerie/jukbike/public-guinguette-A.webp
>         alt: "Public attablé autour du Jukbike, ambiance guinguette"
> ```
>
> **Règles d'indentation** (espaces, pas de tabulations — YAML strict) :
>
> | Niveau | Indentation | Exemple |
> |---|---|---|
> | entrée module | 2 espaces + `-` | `  - id: jukbox` |
> | champs module (`concept`, `ambiance`, `photos`) | 4 espaces | `    photos:` |
> | item photo | 6 espaces + `-` | `      - src: …` |
> | `alt` sous un item | 8 espaces | `        alt: "…"` |
>
> - `photos:` **aligné sur** `concept:` et `ambiance:` (4 espaces après le `-` du module).
> - `src` : chemin `/images/…` (sans préfixe `static/`).
> - `alt` : obligatoire, phrase courte descriptive (accessibilité + SEO).
> - Ne pas toucher au corps markdown sous `---` (le `{{< modules >}}` lit uniquement le front matter).

À shooter en presta (onglets Crieur / Open Mic / Karaoké encore sans photo — rien dans le lot 2023) :
- `crieur-*` → onglet `crieur` — module Crieur de rue en action (micro, boîte à criées).
- `karaoke-*` → onglet `karaoke` / `openmic-*` → onglet `openmic` — quelqu'un au micro, foule.
- `sono-detail-*` → onglet `jukbox` — gros plan châssis / enceintes bricolés (crédibilité technique), en lumière propre.

> Occasion : les prestas de juillet et l'**école des agenets** (23/07) sont l'occasion de capturer crieur / karaoké / détail sono.

## 3. Ateliers *(draft)* — `static/images/galerie/ateliers/`

Ce que la structure (école, centre socio) veut sentir : des participants engagés, l'ambiance de transmission.

| Fichier | Sujet idéal | Format |
|---|---|---|
| `atelier-01.webp` | Groupe en atelier (mix, beatbox ou circle song) — participants actifs | paysage |
| `atelier-02.webp` | Gros plan mains sur platines / casque partagé | paysage |
| `atelier-03.webp` | Cercle de chant / didgeridoo — ambiance collective | paysage |

## 4. Producteur *(draft)* — `static/images/galerie/producteur/`

| Fichier | Sujet idéal | Format |
|---|---|---|
| `studio-01.webp` | Le setup studio (Ableton Push, écran, contrôleurs) | paysage |
| `studio-02.webp` | Arnaud en train de composer / jouer sur le Push | paysage |

---

## Notes

- **Droits** : n'utiliser que des photos dont tu détiens les droits (ou avec accord des personnes
  reconnaissables — important pour les collectivités).
- **Poids** : viser < 300 Ko par image (webp qualité ~80). Je peux fournir une commande de
  compression si besoin.
- **Alt text** : renseigner `alt` dans chaque item `photos:` (Jukbike) ou dans le shortcode `gallery` (autres pages).
- **Hub / cartes d'accueil** : conservent volontairement les logos (choix de design). Une vraie
  photo pourra remplacer le visuel de carte plus tard si souhaité.
