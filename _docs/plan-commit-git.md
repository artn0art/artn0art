# Plan de commits atomiques — artn0art

> But : nettoyer le working tree actuellement « sale » avant déploiement, avec des commits
> **atomiques** et logiquement regroupés, en messages conventionnels (français).
>
> ⚠️ **Aucune commande n'est exécutée ici.** Ce document propose le plan ; tu lances toi-même
> les commandes de la section finale après relecture.

---

## État de départ (`git status --short`)

```
 M CLAUDE.md
 M MEMORY.md
 M README.md
 M _docs/etat.md
 M assets/css/custom.css
 M content/_index.md
 M content/dj/_index.md
 M content/projets/_index.md
 M content/projets/jukbike/index.md
 M hugo.toml
?? .hugo_build.lock
?? _archives/handoffs/
?? _docs/reco-design-fors.md
?? content/projets/bricodeur/
?? content/projets/massage-sonotherapie/
?? content/projets/producteur/
?? data/
?? layouts/
?? static/
```

### À NE PAS commiter

- **`.hugo_build.lock`** : fichier temporaire de lock généré par Hugo. À ignorer (idéalement l'ajouter au `.gitignore` — voir note finale).
- Les éventuels `.git/.../index.lock` : artefacts git, non concernés.

> Le dossier `public/` (sortie de build) n'apparaît pas dans le status : il est soit absent, soit déjà ignoré. Ne pas le commiter dans tous les cas.

---

## Plan de commits (regroupement logique)

L'ordre suit une logique « fondations → design → contenu → assets → docs » pour que chaque
commit soit cohérent et que l'historique se lise bien.

### Commit 1 — `feat(design): layouts custom et grille de cartes fors.fm`

Le cœur de la refonte : layouts Hugo personnalisés + CSS, qui sous-tendent tout le reste.

**Fichiers :**
- `layouts/` (tout le dossier : `projets/list.html`, `partials/home/custom.html`, `partials/projet-catalog.html`, `partials/projet-device.html`, `partials/extend-head.html`)
- `assets/css/custom.css`
- `data/profils.yaml` (données alimentant la grille de profils de la home)

**Message :**
```
feat(design): layouts custom et grille de cartes inspirée fors.fm

- Ajout des partials home/custom, projet-catalog, projet-device et extend-head
- Layout de liste projets
- Données profils (data/profils.yaml) pour la grille d'accueil
- Style custom (fond gris clair, cartes colorées par univers)
```

---

### Commit 2 — `feat(content): refonte accueil, DJ et Jukbike`

Le contenu des pages existantes mis à jour pour coller au nouveau design.

**Fichiers :**
- `content/_index.md`
- `content/dj/_index.md`
- `content/projets/_index.md`
- `content/projets/jukbike/index.md`

**Message :**
```
feat(content): refonte accueil, page DJ et fiche Jukbike

- Réorganisation home (profils principaux DJ/Jukbike, secondaires en retrait)
- Bio DJ complète (cultures caribéennes, house, techno, dub) + SoundCloud
- Fiche Jukbike (specs, tarifs pro, 4 briques d'animation)
- Retrait des TODO visibles
```

---

### Commit 3 — `feat(content): trois profils secondaires`

Les nouvelles fiches de profils (untracked), regroupées car de même nature.

**Fichiers :**
- `content/projets/producteur/`
- `content/projets/bricodeur/`
- `content/projets/massage-sonotherapie/`

**Message :**
```
feat(content): fiches des trois profils secondaires

- Producteur (compositions studio, Ableton, Push)
- Bricodeur (Reactable, assistant de tri a2dd, Arduino/NFC)
- Massage & Sonothérapie (acupression BPA, bains sonores)
```

---

### Commit 4 — `chore(static): favicons, OG image, images et config Decap`

Tous les assets statiques + le back-office Decap, regroupés (assets non éditoriaux).

**Fichiers :**
- `static/favicon-32.png`, `static/favicon-512.png`, `static/apple-touch-icon.png`
- `static/images/` (og-image.png + 5 illustrations d'univers)
- `static/admin/index.html`, `static/admin/config.yml`

**Message :**
```
chore(static): favicons, OG image, illustrations et config Decap CMS

- Favicons (32/512) et apple-touch-icon
- Image de partage og-image.png
- 5 illustrations d'univers (DJ, Jukbike, producteur, bricodeur, sonothérapie)
- Panneau Decap CMS (static/admin) : index.html + config.yml (git-gateway)
```

---

### Commit 5 — `docs: runbook de déploiement, état et reco design`

Toute la documentation et les fichiers méta projet.

**Fichiers :**
- `_docs/runbook-deploiement.md` (nouveau, ce déploiement)
- `_docs/plan-commit-git.md` (ce fichier)
- `_docs/etat.md` (mis à jour)
- `_docs/reco-design-fors.md` (nouveau)
- `_archives/handoffs/handoff-2026-06-17-S143.md` (nouveau)
- `CLAUDE.md`, `MEMORY.md`, `README.md` (mises à jour méta)

**Message :**
```
docs: runbook de déploiement, état v0.2 et reco design fors.fm

- Runbook de mise en ligne (Netlify, DNS OVH, Decap)
- Plan de commits atomiques
- Mise à jour _docs/etat.md (build vert, prêt déploiement)
- Reco design fors.fm + handoff S143
- Mises à jour CLAUDE.md / MEMORY.md / README.md
```

> Si tu préfères séparer la doc « projet » (`_docs/`, handoff) des fichiers racine méta
> (`CLAUDE.md`, `MEMORY.md`, `README.md`), scinde ce commit 5 en deux :
> `docs: runbook + état + reco` puis `chore(meta): mise à jour fichiers racine`.

---

## Ordre recommandé

1. **Commit 1** — `feat(design)` (fondations layouts/CSS/data)
2. **Commit 2** — `feat(content)` pages existantes
3. **Commit 3** — `feat(content)` profils secondaires
4. **Commit 4** — `chore(static)` assets + Decap
5. **Commit 5** — `docs` runbook/état/méta

Puis un seul `git push`.

---

## Commandes (à lancer toi-même, NON exécutées ici)

```bash
cd /Users/artnoart/Code/_projets/artn0art

# (Recommandé) ignorer le lock temporaire Hugo pour ne jamais le commiter
echo ".hugo_build.lock" >> .gitignore   # puis l'inclure dans le commit 5 si tu crées/édites .gitignore

# --- Commit 1 : design (layouts + CSS + data) ---
git add layouts assets/css/custom.css data/profils.yaml
git commit -m "feat(design): layouts custom et grille de cartes inspirée fors.fm"

# --- Commit 2 : contenu pages existantes ---
git add content/_index.md content/dj/_index.md content/projets/_index.md content/projets/jukbike/index.md
git commit -m "feat(content): refonte accueil, page DJ et fiche Jukbike"

# --- Commit 3 : profils secondaires ---
git add content/projets/producteur content/projets/bricodeur content/projets/massage-sonotherapie
git commit -m "feat(content): fiches des trois profils secondaires"

# --- Commit 4 : static (favicons, OG, images, Decap) ---
git add static
git commit -m "chore(static): favicons, OG image, illustrations et config Decap CMS"

# --- Commit 5 : docs + méta ---
git add _docs/runbook-deploiement.md _docs/plan-commit-git.md _docs/etat.md _docs/reco-design-fors.md _archives/handoffs CLAUDE.md MEMORY.md README.md
git commit -m "docs: runbook de déploiement, état v0.2 et reco design fors.fm"

# --- Push final ---
git push origin main
```

> **Ne pas** faire `git add .` : cela embarquerait `.hugo_build.lock`. Préférer les `git add`
> ciblés ci-dessus. Vérifier avec `git status` entre chaque commit que rien d'indésirable
> n'est mis en scène.
