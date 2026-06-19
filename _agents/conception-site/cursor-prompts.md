# Prompts Cursor — CODE (artn0art)

> Rôle pour cette mission : **implémentation Hugo / CSS**. Tu pars des specs déposées par
> Antigravity dans `_agents/conception-site/design/`. Tu es **seul à éditer** `assets/css/`,
> `layouts/`, `hugo.toml`, `static/`, `content/`. Langue : **français**.
> Avant chaque commit : **build Hugo vert** (`hugo` sans erreur) + rendu vérifié sur
> `localhost:1313`. Un **commit par phase** (message français), **safe-trash** (jamais `rm` direct).
> Respecte le canon `~/Code/_projets/_agents/coordination-agents.md` et `.cursor/rules/00-agents.mdc`.

Colle chaque bloc tel quel dans Cursor, une phase à la fois, après validation de la spec correspondante.

---

## Prompt 0 — Brancher les design tokens

```
Lis la spec _agents/conception-site/design/00-tokens.md (par Antigravity) et CLAUDE.md.
Mission (CODE) : traduis les tokens en variables CSS dans assets/css/custom.css (:root) :
- Ajoute/ajuste les variables couleurs (fond, surface, texte, muted, bordures) déjà présentes.
- Ajoute une variable par couleur d'univers : --u-dj, --u-jukbike, --u-reactable, --u-a2dd, --u-musique.
- Variables typo (familles, échelle clamp), espacements (--space-1..6), états (hover, focus).
N'introduis aucune régression visuelle : conserve l'existant, n'ajoute que des tokens.
Vérifie : `hugo` build vert, rendu identique sur localhost:1313. Commit : "design: tokens CSS (couleurs univers, typo, espacements)".
```

---

## Prompt 1 — Factoriser les composants CSS

```
Lis _agents/conception-site/design/01-composants.md.
Mission (CODE) : implémente les composants en CSS dans assets/css/custom.css, en utilisant les
tokens du prompt 0 :
- .device-card (carte projet), .tag / .tag-status, .site-intro, footer.
- États repos/hover/focus conformes à la spec (hover : éclaircissement + scale 1.02 ; focus visible a11y).
Garde les partials existants (projet-device.html, projet-catalog.html) ; n'édite le HTML que si la
spec l'exige. Vérifie le build vert + rendu localhost:1313. Commit : "design: composants (carte, tag, intro, footer)".
```

---

## Prompt 2 — Home en grille de cartes (reco P1)

```
Lis _agents/conception-site/design/02-home.md.
Mission (CODE) : passe la home de la liste de lignes à une GRILLE DE CARTES.
- assets/css/custom.css : .device-list → display:grid; grid-template-columns: repeat(2,1fr);
  gap:1.5rem ; 1 colonne sous 680px ; conteneur ~64rem.
- layouts/partials/projet-device.html : refais la carte (image en haut pleine largeur, puis
  titre + tags + statut + description), lien sur toute la carte conservé.
- Vérifie les 2 sections (featured/secondary) depuis data/profils.yaml, rendu desktop + mobile.
Build vert + contrôle localhost:1313. Commit : "design: home en grille de cartes (look fors.fm)".
```

---

## Prompt 3 — Gabarit page projet (single)

```
Lis _agents/conception-site/design/03-fiche-projet.md.
Mission (CODE) : implémente le gabarit de fiche projet réutilisable.
- Crée/édite le layout single des projets (ex. layouts/projets/single.html) selon la spec :
  hero (image univers + titre + accroche + statut/tags), corps (specs, blocs, tarifs), CTA contact,
  fil d'Ariane (showBreadcrumbs déjà actif).
- CSS de la fiche dans custom.css, avec accent = couleur d'univers (token) appliqué sobrement.
- Valide d'abord sur Jukbike (content/projets/jukbike/index.md) → localhost:1313/projets/jukbike/.
Le gabarit doit fonctionner pour tous les projets sans duplication. Build vert. Commit :
"design: gabarit fiche projet (référence jukbike)".
```

---

## Prompt 4 — Appliquer le gabarit aux pages restantes

```
Lis _agents/conception-site/design/04-pages.md.
Mission (CODE) :
- Applique le gabarit/fiche aux pages secondaires (reactable, a2dd, producteur, bricodeur,
  massage-sonotherapie) : vérifie le front matter (image univers, tags, statut) dans chaque
  content/projets/*/index.md.
- Aligne content/dj/_index.md et content/contact/_index.md sur les specs (mise en page, SoundCloud,
  réseaux/email).
- Harmonise les descriptions ≤ 90 caractères dans data/profils.yaml si demandé par la spec.
Build vert, contrôle de chaque URL sur localhost:1313. Commit : "design: pages DJ/contact/secondaires alignées".
```

---

## Prompt 5 — Corrections responsive / a11y / perf

```
Lis _agents/conception-site/design/05-audit-aria.md (liste priorisée P1/P2/P3).
Mission (CODE) : applique les corrections, en commençant par les P1 :
- a11y : contrastes, focus visible, cibles ≥ 44px, alt d'images, navigation clavier.
- responsive : breakpoints, débordements, grille → 1 colonne.
- perf : compression/homogénéisation des images dans static/images/ (garde les originaux via safe-trash),
  chargement des polices.
Build vert + re-vérif des points audités sur localhost:1313. Commit : "fix: corrections a11y/responsive/perf (audit phase 5)".
```

---

## Prompt 6 — Favicon, OG, Decap CMS & mise en ligne

```
Mission (CODE) — finalisation et déploiement :
1. Favicon/OG : intègre les sources fournies par Antigravity (_agents/conception-site/design/assets/)
   dans static/ ; déclare favicon + image OG (head). Vérifie l'aperçu de partage.
   (extend-head.html / layouts/partials/extend-head.html pour les meta OG.)
2. Decap CMS : finalise static/admin/config.yml (collections, backend Git), teste l'édition.
3. Déploiement : connecte le dépôt GitHub (github.com/artn0art/artn0art) à Netlify OU Cloudflare
   Pages ; configure le build Hugo (version 0.163.2). Active l'auth (Netlify Identity ou équivalent)
   pour Decap.
4. DNS : relie le domaine artn0art.com (OVH) à l'hébergement + SSL.
Build vert avant push. Mets à jour _docs/etat.md et CLAUDE.md (état courant). Commit :
"build: favicon/OG, Decap finalisé, hébergement + DNS".
NB : les étapes hébergement/DNS nécessitent les accès de Didier — documente ce qui requiert sa main.
```
