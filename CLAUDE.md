# artn0art — Site vitrine DJ & portfolio créatif

> ## 🏠 Lecture préalable (agents Cursor/Antigravity/Claude)
>
> ⚙️ **Protocole multi-agents** (canon) → `~/Code/_projets/_agents/coordination-agents.md`
>
> 1. **`~/Code/CLAUDE.md`** — conventions village obligatoires (safe-trash, _inbox, accès fichiers, capitalisation, convention 4 dossiers)
> 2. **`~/Code/_hub/audits/AUDIT-VILLAGE-2026-05-11.md`** — Top 10 P0 cross-projets + plan 4 semaines
> 3. **`_archives/audits/AUDIT-artn0art-2026-05-11.md`** — audit S140 spécifique à ce projet
>
> ## 🏷 Méta projet
>
> - **Catégorie** : actif
> - **Score audit S140** : 2.8/5
> - **Header standardisé** : ajouté S140 (11 mai 2026)
>
> ---



## Chemins d'accès

| Élément | Chemin |
|---|---|
| Dossier source | `$CLAUDE_HOME/_projets/artn0art/` |
| Chemin absolu | `/Users/artnoart/Code/_projets/artn0art/` |
| Alias shell | `cdart` |

> Note : iCloud impose guillemets doubles sur le chemin absolu (espaces dans "Mobile Documents", `~` dans `com~apple~CloudDocs`). Toujours passer par `$CLAUDE_HOME` ou l'alias.

> Site Hugo. Sortie buildée dans `public/` (à publier via le workflow de déploiement du projet).

## Description

Site internet personnel de Didier : vitrine DJ, portfolio créatif, showcase projets (musique, reactable, jukbike...).
Concept : **hub central + univers distincts** — chaque projet a sa propre identité visuelle (couleur, ambiance).
Inspiration design : [fors.fm](https://fors.fm/) — fond gris clair, minimaliste, cartes colorées par produit, beaucoup d'espace.
Public cible : professionnels créatifs et collaborations (prioritaire), grand public (secondaire).

## Identité en ligne

| Service | Identifiant | Email |
|---------|-------------|-------|
| Domaine | artn0art.com | — |
| Proton Mail | artn0art@proton.me | — |
| GitHub | github.com/artn0art | artn0art@proton.me |
| Instagram | @artn0art | artn0art@proton.me |
| SoundCloud | soundcloud.com/artn0art | artn0art@proton.me |

## Stack technique

- **Générateur** : Hugo (v0.155+)
- **Thème** : Blowfish (submodule git)
- **CMS** : Sveltia CMS (back-office visuel — `static/admin/`, backend GitHub)
- **Hébergement** : GitHub Pages (build + deploy via `.github/workflows/deploy-pages.yml`). OVH conservé mais désactivé (trigger manuel).
- **Domaine** : artn0art.com (acheté OVH, 2026-03-25) — CNAME câblé (`static/CNAME`), DNS à pointer vers GitHub Pages

## Structure du site

```
artn0art/
├── hugo.toml                 # Config Hugo + Blowfish
├── assets/css/custom.css     # Style custom (fond gris, cartes colorées)
├── content/
│   ├── _index.md             # Hub — cartes projet cliquables
│   ├── dj/
│   │   └── _index.md         # Univers DJ (bio, styles, booking)
│   ├── projets/
│   │   ├── _index.md         # Vue d'ensemble projets
│   │   ├── reactable/index.md
│   │   ├── jukbike/index.md
│   │   └── a2dd/index.md
│   └── contact/
│       └── _index.md         # Contact / réseaux
├── themes/blowfish/          # Thème (submodule git)
└── static/                   # Images, assets
```

## Couleurs univers par projet

| Projet | Couleur CSS | Code | Note |
|--------|-------------|------|------|
| DJ | vert logo | #275528 | Identité visuelle logos / cartes |
| Jukbike | jaune doré | #c9a227 | Accents carte + modules |
| Crieur (module) | rouge | #c0392b | Accent module Jukbike |
| Reactable | vert menthe | #6ee7b7 | Pages secondaires |
| a2dd | bleu clair | #93c5fd | Pages secondaires |
| Musique | rose doux | #fca5a5 | Producteur / ateliers |

## Décisions prises

- **Hugo + Blowfish** : gratuit, flexible, CSS custom par section, grosse communauté
- **Concept hub + univers** : page d'accueil sobre avec cartes colorées, chaque projet = sa propre identité
- **Decap CMS** : édition visuelle depuis le navigateur, contenu stocké en Markdown sur Git
- **Static** : pas de serveur, pas d'abonnement, sécurité maximale
- **Domaine artn0art.com** (avec un zéro) : identité forte, court, mémorable
- **artn0art@proton.me** : email dédié pour tout ce qui touche au site

## État courant

- **v1.0.0** — Migration GitHub Pages finalisée (2026-07-01)
  - Hugo v0.163.2, build local vert (**28 pages FR**, 30 fichiers statiques).
  - Déploiement : **GitHub Pages** via `.github/workflows/deploy-pages.yml`, déclenché à chaque push sur `main`.
  - Domaine custom **artn0art.com** câblé via `static/CNAME`. ⏳ Reste à faire côté DNS : pointer les enregistrements OVH vers GitHub Pages + activer le domaine custom dans Settings → Pages du repo.
  - Ancien déploiement OVH (`deploy-ovh.yml`) conservé mais désactivé (trigger manuel `workflow_dispatch` uniquement). `netlify.toml` conservé (inerte, plus connecté).
  - Home : **2 profils** affichés sous forme de **grille de cartes à 2 colonnes** (façon fors.fm) ; autres profils en `pending` dans `data/profils.yaml`.
  - Jukbike : accordéons 4 modules, plaquette PDF, logos, CSS hiérarchie.
  - Favicon + OG image dans `static/` (câblés via `layouts/partials/extend-head.html`).
  - Sveltia CMS présent (`static/admin/`, backend GitHub) — nécessite l'OAuth GitHub configuré pour l'accès à `/admin/`.

## Prochaines étapes

1. **DNS** : pointer artn0art.com (enregistrements OVH) vers GitHub Pages, puis renseigner le domaine custom dans Settings → Pages et cocher « Enforce HTTPS ».
2. Sveltia CMS : configurer l'OAuth GitHub et tester l'accès à `/admin/`.
3. Prochaine passe contenu / Réactivation des profils `pending` (`ateliers`, `producteur`, `bricodeur`) sur la page d'accueil.
4. Tokens couleurs / polish design (ex. module Crieur de rue).
5. Restaurer / finaliser la page `Massage & Sonothérapie` ou d'autres pages secondaires si besoin.


## ⚠️ Accès aux fichiers — protocole impératif

**Avant toute action hors sandbox, Claude demande l'accès dans cet ordre :**

1. `request_cowork_directory` — Didier valide avec Entrée (méthode par défaut)
2. Sinon, `cd <chemin> && ls -la` et attendre le résultat collé
3. **Jamais** de supposition, jamais d'invention de structure

Règle complète : `_claude/CLAUDE.md` → "Règle d'accès aux fichiers".
