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
- **CMS** : Decap CMS (à configurer — back-office visuel)
- **Hébergement** : OVH mutualisé (FTPS via GitHub Actions — `.github/workflows/deploy-ovh.yml`)
- **Domaine** : artn0art.com (acheté OVH, 2026-03-25) — DNS à brancher

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

- **v0.3** — Home DJ + Jukbike, page Jukbike modules (2026-06-23)
  - Hugo v0.163.2, build local vert (**28 pages FR**, 33 fichiers statiques).
  - Home : **2 profils** visibles (Jukbike, DJ) ; autres profils en `pending` dans `data/profils.yaml`.
  - Jukbike : accordéons 4 modules, plaquette PDF, logos, CSS hiérarchie.
  - Favicon + OG image dans `static/` (câblés via `layouts/partials/extend-head.html`).
  - Workflow deploy : **GitHub Actions → OVH FTPS** (`deploy-ovh.yml`).
  - Site **pas encore en ligne** : secrets FTP + DNS OVH à configurer.
  - Decap CMS présent (`static/admin/`) mais **non utilisable** sur hébergement OVH statique sans auth dédiée.

## Prochaines étapes

1. Configurer les secrets GitHub (`OVH_FTP_*`) et pousser sur `main` pour le premier deploy.
2. Pointer le DNS `artn0art.com` (OVH) vers l'hébergement mutualisé.
3. Vérifier HTTPS et le site en production après deploy.
4. (Optionnel) Decap : rester en édition Markdown, ou migrer l'hébergement CMS vers Netlify.
5. Tokens couleurs / polish design (ex. module Crieur de rue).


## ⚠️ Accès aux fichiers — protocole impératif

**Avant toute action hors sandbox, Claude demande l'accès dans cet ordre :**

1. `request_cowork_directory` — Didier valide avec Entrée (méthode par défaut)
2. Sinon, `cd <chemin> && ls -la` et attendre le résultat collé
3. **Jamais** de supposition, jamais d'invention de structure

Règle complète : `_claude/CLAUDE.md` → "Règle d'accès aux fichiers".
