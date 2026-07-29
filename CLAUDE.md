# artn0art — Site vitrine DJ & portfolio créatif

> ## 🏠 Lecture préalable (agents Cursor/Antigravity/Claude)
>
> ⚙️ **Protocole multi-agents** (canon) → `~/Code/_projets/_agents/coordination-agents.md`
>
> 1. **`~/Code/CLAUDE.md`** — conventions village obligatoires (safe-trash, _inbox, accès fichiers, capitalisation, convention 4 dossiers)
> 2. **`~/Code/_hub/audits/AUDIT-VILLAGE-2026-07-15.md`** — audit village récent
> 3. **`_archives/audits/AUDIT-artn0art-2026-07-16.md`** — dernier audit détaillé projet (session Cursor)
>
> ## 🏷 Méta projet
>
> - **Catégorie** : actif
> - **Score audit** : **3,5/5** (S140 : 2,8/5 · resync 2026-07-16)
> - **Backlog agents** : `_agents/TABLEAU.md` · **État spoke** : `_docs/etat.md`
>
> ---

## Chemins d'accès

| Élément | Chemin |
|---|---|
| Dossier source | `$CLAUDE_HOME/_projets/artn0art/` |
| Chemin absolu | `/Users/artnoart/Code/_projets/artn0art/` |
| Alias shell | `cdart` |

> Site Hugo. Sortie buildée dans `public/` (gitignored) — deploy via GitHub Actions.

## Description

Site internet personnel de Didier : vitrine DJ, portfolio créatif, showcase projets (musique, reactable, jukbike…).
Concept : **hub central + univers distincts** — chaque projet a sa propre identité visuelle (couleur, ambiance).
Inspiration design : [fors.fm](https://fors.fm/) — fond gris clair, minimaliste, cartes colorées par produit.
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

| Composant | Détail |
|-----------|--------|
| Générateur | Hugo extended **0.163.2** (CI + local Homebrew) |
| Config | `hugo.toml` (pas `config.toml`) |
| Thème | Blowfish v2.100.0 (submodule `themes/blowfish/`) |
| CMS | **Sveltia CMS** — UI `/admin/`, config Decap `static/admin/config.yml`, backend GitHub |
| Hébergement prod | **GitHub Pages** — `.github/workflows/deploy-pages.yml` |
| Domaine | `static/CNAME` → artn0art.com (DNS OVH → GitHub Pages) |
| Dormant | OVH FTP (`deploy-ovh.yml` manuel), `netlify.toml`, `cloudcannon.config.yml` |

### Build local

```bash
cd "/Users/artnoart/Code/_projets/artn0art" && hugo --gc --minify
```

→ **20 pages FR**, 7 URLs sitemap (drafts exclus).

### ⚠️ Piège Hugo / Blowfish

Le submodule Blowfish déclare `max = "0.157.0"` (`themes/blowfish/config.toml`) alors que CI et local tournent en **0.163.2** — build OK avec warning aujourd’hui ; **mettre à jour Blowfish ou pinner Hugo en CI** avant casse.

## Structure du site

```
artn0art/
├── hugo.toml
├── data/profils.yaml          # Cartes home (featured / pending)
├── assets/css/                # custom.css, fonts-local.css
├── content/
│   ├── _index.md              # Hub
│   ├── dj/_index.md           # Live
│   ├── projets/
│   │   ├── jukbike/index.md   # Live
│   │   └── */index.md         # ateliers, producteur, bricodeur, reactable, a2dd → draft
│   ├── contact/
│   ├── mentions-legales/        # Live — champs [À COMPLÉTER]
│   └── confidentialite/
├── layouts/                   # Overrides Blowfish (head, home, projets…)
├── static/                    # Images, fonts, admin CMS, CNAME
└── themes/blowfish/           # Submodule
```

## Couleurs univers par projet

| Projet | Code | Note |
|--------|------|------|
| DJ | #275528 | Cartes + logo |
| Jukbike | #c9a227 | Carte + modules |
| Crieur (module) | #c0392b | Module Jukbike |
| Reactable | #6ee7b7 | Draft |
| a2dd | #93c5fd | Draft |
| Musique | #fca5a5 | Producteur / ateliers (draft) |

## Décisions prises

- **Hugo + Blowfish** : statique, CSS custom par section, communauté large
- **Hub + univers** : accueil sobre, cartes colorées, identité par projet
- **Sveltia CMS** (ex-Decap) : édition visuelle Markdown sur Git — OAuth **non finalisé**
- **GitHub Pages** (pas Netlify) : deploy auto push `main`
- **Domaine artn0art.com** : identité forte, email dédié artn0art@proton.me

## État courant (2026-07-16)

- **v1.1+** — En ligne sur artn0art.com (GitHub Pages)
- **Live** : Home, **DJ**, **Jukbike**, contact, mentions/confidentialité (texte légal incomplet)
- **Draft** : ateliers, producteur, bricodeur, reactable, a2dd
- **Perf** : fonts Inter + Space Grotesk self-host (`static/fonts/`, `fonts-local.css`)
- **Header** : CTA contact contextuel (`layouts/partials/header/components/cta.html`)
- **CMS** : guide OAuth → `_docs/cms-setup.md`

## 🎯 Chantier priorisé — Définition de fin (2026-07-17)

> Cadre : plan de priorisation musique/DJ (système « 3 chantiers max »).
> ⚠️ Le site est **déjà en ligne** (v1.1+, artn0art.com) — le chantier n'est donc **pas** « mettre en ligne » mais **compléter le noyau public**.

**Terminé (v1 complète) =**

1. **3 P0 fermés** : pages légales complétées (nom, statut, adresse) · décision CMS tranchée (OAuth Sveltia **ou** édition Markdown sur GitHub) · compat Hugo/Blowfish réglée (MàJ submodule ou pin Hugo).
2. **Galerie photos DJ** en ligne + 3 modules Jukbike illustrés.
3. **Pages projet cœur publiées hors `draft`** (au minimum producteur/ateliers, en plus de DJ + Jukbike déjà live).

**Délai : fin août 2026** (projet phare du mois d'août).

### P0 ouverts (@Didier sauf technique)

1. Mentions légales + politique confidentialité — nom, statut, adresse
2. OAuth Sveltia pour `/admin/`
3. Compat Hugo/Blowfish (agent code)

## Prochaines étapes

1. Compléter pages légales (P0)
2. Brancher OAuth CMS ou continuer édition Markdown sur GitHub.com
3. Mettre à jour submodule Blowfish **ou** pinner Hugo 0.157 en CI
4. Photos galerie DJ + 3 modules Jukbike sans visuels
5. Publier progressivement les pages `draft` (validation Didier)
6. Lighthouse mobile post-deploy (art-09-15 · `_agents/TABLEAU.md`)
7. Resync `_data/project.json` (encore Netlify/Decap — dette doc)

## Documentation projet

| Fichier | Rôle |
|---------|------|
| `_docs/etat.md` | État courant (spoke) |
| `_docs/runbook-deploiement.md` | Deploy GitHub Pages |
| `_docs/cms-setup.md` | Sveltia + OAuth |
| `_agents/TABLEAU.md` | Backlog art-09-xx |
| `MEMORY.md` | Pièges session |

## ⚠️ Accès aux fichiers — protocole impératif

**Avant toute action hors sandbox, Claude demande l'accès dans cet ordre :**

1. `request_cowork_directory` — Didier valide avec Entrée (méthode par défaut)
2. Sinon, `cd <chemin> && ls -la` et attendre le résultat collé
3. **Jamais** de supposition, jamais d'invention de structure

Règle complète : `~/Code/CLAUDE.md` → « Règle d'accès aux fichiers ».
