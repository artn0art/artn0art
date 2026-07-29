# MEMORY — artn0art

## S140-audit (2026-05-11)

- `_docs/architecture.md` et `_docs/etat.md` alignés sur `hugo.toml` et `content/**/_index.md`.
- Build local : `hugo build` (Hugo ≥ 0.155) avant tout déploiement ; `static/` encore vide (favicon / OG à ajouter).

## S143-reorganisation (2026-06-17)

- Hugo v0.163.2 installé localement via Homebrew, build OK.
- Page d'accueil et liste de projets réorganisées pour isoler les profils principaux (DJ, Jukbike) des profils secondaires d'arrière-plan (Producteur, Bricodeur, Massage & Sonothérapie).
- Intégration de 5 images premium personnalisées dans `static/images/`.
- Ajout du layout `layouts/partials/home/custom.html` pour contourner le layout par défaut du thème Blowfish et afficher notre index personnalisé.
- Création de la configuration Decap CMS dans `static/admin/`.

## S144-grille-et-deploy (2026-06-23)

- Refonte CSS (`custom.css`) pour transformer le catalogue de la home en grille à 2 colonnes sur desktop et 1 colonne sur mobile.
- Uniformisation verticale des cartes projet (`.device-card`) sur tous les écrans, avec suppression des règles spéciales de centrage pour DJ et Jukbike.
- Intégration de l'affichage de la description courte (`device-desc`) pour chaque projet sur les cartes de la page d'accueil via `projet-device.html`.
- Fourniture des instructions détaillées de déploiement en production via OVH et GitHub Secrets.

## 2026-07-16 — Audit + resync docs (Cursor)

- **Prod** : GitHub Pages (pas Netlify). Workflow `deploy-pages.yml`, Hugo **0.163.2**.
- **CMS** : Sveltia (UI) + config Decap `static/admin/config.yml` — OAuth **non branché**.
- **Warning build** : Blowfish déclare `max = 0.157.0` — CI/local en 0.163.2 ; build OK mais risque casse.
- **Doublon** : `_data/data/profils.yaml` = copie de `data/profils.yaml` — source unique `data/` (Hugo).
- **Fantôme** : `static/cv.pdf` référencé backlog art-09-11 — **n'existe pas** (seul PDF : `static/documents/jukbike-plaquette-2026.pdf`).
- **P0 @Didier** : mentions légales + confidentialité (`[À COMPLÉTER]` dans content/).

## 2026-07-16 (suite) — Autonomie technique (Cursor)

- **Blowfish** : submodule → `1f144483` (v2.104.0, max Hugo **0.163.3**) — warning version résolu.
- **Lighthouse mobile** (artn0art.com) : Perf 97 · A11y 100 · BP 100 · SEO 100.
- **PDF plaquette** : `pypdf` seul ne compresse pas les images (~0,07 %) — **Ghostscript/qpdf absents** sur la machine.
- **Configs legacy** : `netlify.toml`, `cloudcannon.config.yml` archivés dans `_archives/legacy-configs/`.
