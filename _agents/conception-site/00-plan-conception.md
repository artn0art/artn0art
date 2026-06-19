# Plan de conception du site — artn0art

> Rédigé le 2026-06-18 (Claude/Cowork, rôle cadreur). Point de départ : **v0.2.1**
> (Hugo v0.163.2 + Blowfish, design fors.fm partiellement implémenté, build local vert).
> Objectif : **finaliser la conception de tout le site** vers la vision fors.fm, puis
> mettre en ligne. Travail réparti entre **Antigravity (design)** et **Cursor (code)**.

## Rappel du canon multi-agents

Ce projet suit le protocole `~/Code/_projets/_agents/coordination-agents.md`
(rôles : Claude cadreur / Cursor artisan / Antigravity usine). Pour cette mission, la
répartition demandée par Didier est :

- **Antigravity = design** : direction artistique, design system, maquettes, specs visuelles, revue UX/a11y. Produit des **specs et des maquettes**, pas du code de prod.
- **Cursor = code** : implémentation Hugo/CSS, partials, déploiement. Produit du **code testé (build vert)**.

Règles communes (non négociables) : **français**, **build Hugo vert avant tout commit**,
**checkpoint Git** par tâche, **safe-trash** (jamais de `rm` direct), **claim de zone**
(un seul agent touche un fichier à la fois — voir tableau ci-dessous), pas de réécriture
du thème Blowfish, pas d'animations lourdes.

## Principe directeur (ADN design)

Inspiration **fors.fm/devices** : fond gris neutre, minimalisme, **grille de cartes** à
image dominante, typo serrée (Space Grotesk titres / Inter corps), descriptions courtes et
évocatrices (≤ 90 caractères, 1 phrase), 1–2 tags de contexte max, hover discret.
Source unique de contenu : `data/profils.yaml`. Ne pas repartir de zéro.

## Périmètre (tout le site)

| Zone | Fichiers concernés | État v0.2.1 |
|---|---|---|
| Design system / tokens | `assets/css/custom.css` (`:root`) | partiel — couleurs univers à brancher |
| Home / hub | `layouts/partials/home/custom.html`, `projet-catalog.html`, `projet-device.html` | liste → à passer en grille de cartes (reco P1) |
| Gabarit page projet | `layouts/projets/list.html`, `content/projets/*/index.md` | à concevoir (référence : jukbike) |
| Page DJ | `content/dj/_index.md` | contenu OK, mise en page à aligner |
| Page Contact | `content/contact/_index.md` | à aligner sur l'ADN |
| Pages secondaires | producteur, bricodeur, a2dd, reactable, sonothérapie | contenu OK, gabarit à appliquer |
| Header / footer / nav | `layouts/partials/footer.html`, `hugo.toml [menu]` | footer custom OK, à affiner |
| Responsive / a11y / perf | global | à auditer |
| Favicon / OG | `static/` | à faire |
| Decap CMS | `static/admin/` | configuré, à finaliser |
| Déploiement | Netlify/Cloudflare + DNS OVH | à faire |

## Phases & routage

Chaque phase : Antigravity **conçoit** (maquette + spec) → handoff → Cursor **implémente**
(code + build vert) → Claude/Didier **valident** sur `localhost:1313`.

| # | Phase | Antigravity (design) | Cursor (code) | Dépend de |
|---|---|---|---|---|
| 0 | Cadrage & tokens | Définir tokens (couleurs univers, échelle typo/spacing, états) en spec | Brancher les tokens dans `:root` de `custom.css` | — |
| 1 | Design system | Maquette des composants (carte, tag, statut, intro, footer) + règles d'usage | Factoriser le CSS des composants | 0 |
| 2 | Home / grille de cartes | Maquette home en **grille 2 col** (reco P1) responsive | Passer `.device-list` en `grid`, refaire `projet-device.html` en carte | 1 |
| 3 | Gabarit page projet | Maquette fiche projet (réf. jukbike) : hero, specs, blocs, CTA | `layouts/projets/list.html` (single) + CSS fiche | 1 |
| 4 | Pages DJ / Contact / secondaires | Specs de mise en page par page | Appliquer le gabarit, ajuster contenus | 3 |
| 5 | Responsive / a11y / perf | Audit (contraste, focus, cibles tactiles, breakpoints) | Corrections CSS + attributs a11y | 2,3,4 |
| 6 | Mise en ligne | OG image + favicon (design) | Favicon/OG intégrés, Decap finalisé, hébergement + DNS | 5 |

## Claim de zone (éviter les conflits d'édition)

- **Antigravity** ne modifie **jamais** un fichier `.html`/`.css`/`.toml` de prod : il écrit ses livrables dans `_agents/conception-site/design/` (specs Markdown, références visuelles, captures).
- **Cursor** est seul à éditer `assets/css/custom.css`, `layouts/**`, `hugo.toml`, `static/**`.
- Le contenu `content/**` est édité par Cursor (ou Didier via Decap), jamais en parallèle.
- Handoffs déposés dans `_agents/conception-site/handoffs/`.

## Définition de « terminé » par phase

1. Maquette/spec Antigravity validée par Didier.
2. Implémentation Cursor : `hugo` build **vert**, rendu vérifié sur `localhost:1313`.
3. Checkpoint Git (un commit par phase, message en français).
4. `_docs/etat.md` mis à jour.

## Fichiers de prompts

- `cursor-prompts.md` — prompts prêts à coller dans Cursor (code), une section par phase.
- `antigravity-prompts.md` — prompts prêts à coller dans Antigravity (design), une section par phase.
