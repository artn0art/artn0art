# Pièges — artn0art

> Bugs et comportements inattendus — lire avant debug.

## Pièges critiques

### Hugo / Blowfish — version

- Le submodule **Blowfish** fixe une plage Hugo (`themes/blowfish/config.toml` → `min`/`max`).
- Avant juillet 2026 : CI en **0.163.2** + Blowfish v2.100 (max **0.157**) → warning build.
- **Fix** : mettre à jour le submodule (`git submodule update --remote themes/blowfish`) avant de monter Hugo en CI.

### Source de données home

- Cartes accueil : **`data/profils.yaml`** uniquement (Hugo).
- Ne pas dupliquer dans `_data/data/` — copie ignorée / safe-trash (2026-07-16).

### Deploy

- **Prod** = GitHub Pages (`deploy-pages.yml`), pas Netlify.
- `netlify.toml` et `cloudcannon.config.yml` = legacy dormant.

## Pièges par session

### 2026-07-16

- `static/cv.pdf` référencé dans ancien backlog — **n'existe pas** (PDF réel : `static/documents/jukbike-plaquette-2026.pdf`).
- P0 légal + OAuth CMS = **@Didier** (champs `[À COMPLÉTER]` dans content/).

### 2026-06

- Layout home : override obligatoire via `layouts/partials/home/custom.html` (sinon Blowfish default).
- Head override : `layouts/partials/head.html` + `extend-head.html` pour perf fonts.

## Anti-patterns

- Éditer `public/` à la main — régénéré par Hugo, gitignored.
- Confondre `config.toml` (vieux docs) et **`hugo.toml`** (réel).
- Publier pages `draft: true` sans relecture Didier.
