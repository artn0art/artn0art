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
- **Hébergement** : Netlify ou Cloudflare Pages (gratuit)
- **Domaine** : artn0art.com (acheté OVH, 2026-03-25)

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

| Projet | Couleur CSS | Code |
|--------|-------------|------|
| DJ | violet clair | #c4b5fd |
| Reactable | vert menthe | #6ee7b7 |
| Jukbike | jaune doré | #fcd34d |
| a2dd | bleu clair | #93c5fd |
| Musique | rose doux | #fca5a5 |

## Décisions prises

- **Hugo + Blowfish** : gratuit, flexible, CSS custom par section, grosse communauté
- **Concept hub + univers** : page d'accueil sobre avec cartes colorées, chaque projet = sa propre identité
- **Decap CMS** : édition visuelle depuis le navigateur, contenu stocké en Markdown sur Git
- **Static** : pas de serveur, pas d'abonnement, sécurité maximale
- **Domaine artn0art.com** (avec un zéro) : identité forte, court, mémorable
- **artn0art@proton.me** : email dédié pour tout ce qui touche au site

## État courant

- **v0.1** — Scaffold Hugo + Blowfish créé (S87, 2026-03-25)
  - hugo.toml configuré (FR, Blowfish, navigation, author)
  - CSS custom avec fond gris #ebebeb et cartes colorées par projet
  - Pages : accueil hub, DJ, projets (reactable, jukbike, a2dd), contact
  - Build Hugo OK (17 pages FR)
  - Domaine acheté OVH ✅
  - Comptes en cours de création (Proton, GitHub, Instagram, SoundCloud)

## Prochaines étapes

1. Créer les comptes (Proton, GitHub, Instagram, SoundCloud) avec artn0art@proton.me
2. Push le repo sur GitHub (github.com/artn0art/artn0art)
3. Configurer Decap CMS (admin panel)
4. Déployer sur Netlify (premier déploiement)
5. Rédiger le vrai contenu (bio DJ, descriptions projets, photos)
6. Connecter le domaine artn0art.com (OVH → Netlify)
7. Peaufiner le style et l'identité visuelle de chaque univers


## ⚠️ Accès aux fichiers — protocole impératif

**Avant toute action hors sandbox, Claude demande l'accès dans cet ordre :**

1. `request_cowork_directory` — Didier valide avec Entrée (méthode par défaut)
2. Sinon, `cd <chemin> && ls -la` et attendre le résultat collé
3. **Jamais** de supposition, jamais d'invention de structure

Règle complète : `_claude/CLAUDE.md` → "Règle d'accès aux fichiers".
