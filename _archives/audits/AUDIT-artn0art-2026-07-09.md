# AUDIT artn0art.com — 2026-07-09

**Agent** : Cursor (exploration + build Hugo)  
**Périmètre** : repo `/Users/artnoart/Code/_projets/artn0art`  
**Score global** : **3,6 / 5** — site fonctionnel, perf améliorée, déploiement et contenu en retard

---

## 1. Synthèse exécutive

| Domaine | État | Note |
|---------|------|------|
| Build Hugo | ✅ 20 pages FR, 0 erreur | 5/5 |
| Déploiement | ⚠️ 3 commits locaux non poussés (live = 6 juillet) | 2/5 |
| Contenu live | DJ + Jukbike uniquement | 3/5 |
| Perf (juillet) | head.html, fonts, zoom, plafond 2 photos/module | 4/5 |
| CMS Sveltia | Config OK, OAuth GitHub non finalisé | 2/5 |
| Légal | Mentions / confidentialité incomplètes | 2/5 |
| Docs projet | `_docs/etat.md` obsolète (dit Netlify, réalité GitHub Pages) | 2/5 |
| Hygiène repo | `_trash/` gitignoré, 1 JPEG 3,4 Mo untracked | 3/5 |

---

## 2. Stack et déploiement

- **Framework** : Hugo Extended, thème Ananke
- **Hébergement réel** : GitHub Pages (`artn0art.github.io`), workflow `.github/workflows/deploy.yml`
- **CMS** : Sveltia (`static/admin/`), backend GitHub OAuth
- **Branche** : `main`, **ahead 3** vs `origin/main`

### Commits locaux non déployés

| Commit | Contenu |
|--------|---------|
| `727fe90` | Perf : head override, disable zoom/appearance, fonts allégées, Shrikhand scope Jukbike |
| `3aca2e5` | Plafond 2 photos/module (`layouts/shortcodes/modules.html`) |
| `182f155` | Ménage icônes SVG→webp, placeholders galeries, `.gitignore` `_trash/` + `_data/` |

**Action P0** : `git push origin main` pour mettre le live à jour.

---

## 3. Pages et contenu

### Live (non draft)

- Home DJ (`content/_index.md`)
- Profil DJ (`content/dj/_index.md`)
- Jukbike (`content/jukbike/_index.md` + modules)

### WIP / draft

- Artiste, graphiste, producteur, vidéo, contact, mentions légales, confidentialité
- Galeries partielles (photos manquantes ou placeholders)

### Contenu manquant identifié

| Zone | Manque |
|------|--------|
| DJ | Photos galerie (fichiers référencés absents ou placeholders) |
| Jukbike | 3 modules sans contenu final |
| CMS | Champ `photos` absent de `static/admin/config.yml` |
| Légal | Textes mentions + RGPD à compléter |
| PDF | `static/cv.pdf` ~1,2 Mo — compressible |

---

## 4. Technique

### Build

```bash
hugo --minify  # OK, 20 pages FR
```

### Perf (juillet 2026)

- `layouts/partials/head.html` : override Ananke, preload critique
- Fonts : subset + scope Shrikhand Jukbike only
- `modules.html` : max 2 photos/catégorie (mobile)
- Favicons : certains chemins morts dans `hugo.toml`

### Data

- `data/profils.yaml` restauré (bug home vide corrigé juillet)
- Ne pas déplacer vers `_data/data/` sans mettre à jour les templates

### Untracked

- `static/images/galerie/jukbike/jukbike v1 grue jaune 1.JPEG` (~3,4 Mo) — optimiser + commit ou ignorer

---

## 5. Organisation repo

| Dossier | Rôle |
|---------|------|
| `_agents/` | TABLEAU, coordination (obsolète juin → remplacé 09/07) |
| `_docs/` | etat.md, pieges — **à resync** |
| `_archives/audits/` | Audits datés |
| `_trash/` | Gitignoré, déchets locaux |
| `static/admin/` | Sveltia CMS |

---

## 6. Risques

| Risque | Impact | Mitigation |
|--------|--------|------------|
| Live stale | Utilisateurs voient ancienne version | Push main |
| OAuth CMS non configuré | Édition bloquée pour Didier | Finaliser GitHub OAuth app |
| JPEG brut untracked | Poids repo / oubli déploiement | WebP + commit |
| Docs mentent (Netlify) | Confusion agents | Corriger `_docs/etat.md` |

---

## 7. Backlog priorisé (→ `_agents/TABLEAU.md`)

Voir tableau opérationnel mis à jour le 2026-07-09.

**P0** : push, légal, OAuth CMS  
**P1** : contenu DJ/Jukbike, config CMS photos, resync docs  
**P2** : PDF, fonts self-host, favicons, hygiène assets

---

*Fin audit — prochaine revue recommandée après push + complétion contenu DJ.*
