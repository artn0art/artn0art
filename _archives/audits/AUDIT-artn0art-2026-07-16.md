# AUDIT artn0art.com — 2026-07-16

**Agent** : Cursor (exploration + build Hugo + Lighthouse + fixes techniques)  
**Périmètre** : repo `/Users/artnoart/Code/_projets/artn0art`  
**Score global** : **3,5 / 5** (2,8/5 S140 · 3,6/5 au 09/07)

---

## 1. Synthèse exécutive

| Domaine | État | Note |
|---------|------|------|
| Build Hugo | ✅ 20 pages FR, 0 erreur | 5/5 |
| Déploiement | ✅ GitHub Pages, `main` synchro origin | 4/5 |
| Contenu live | DJ + Jukbike uniquement | 3/5 |
| Perf (Lighthouse mobile) | 97 / 100 / 100 / 100 | 5/5 |
| CMS Sveltia | Config OK, OAuth GitHub non finalisé | 2/5 |
| Légal | Mentions / confidentialité incomplètes | 2/5 |
| Docs projet | Resync 16/07 (était obsolète Netlify) | 4/5 |
| Hugo ↔ Blowfish | ✅ Submodule v2.104.0 (max Hugo 0.163.3) | 5/5 |

---

## 2. Stack et déploiement

- **Framework** : Hugo Extended **0.163.2**, thème **Blowfish v2.104.0**
- **Hébergement** : GitHub Pages (`artn0art.com`), workflow `.github/workflows/deploy-pages.yml`
- **CMS** : Sveltia (`static/admin/`), backend GitHub OAuth — **non finalisé**
- **Branche** : `main`, synchro `origin/main`

### Configs legacy archivées (2026-07-16)

`netlify.toml`, `cloudcannon.config.yml` → `_archives/legacy-configs/` (prod = GitHub Pages).

---

## 3. Pages et contenu

### Live (sitemap — 7 URLs)

| Page | Statut |
|------|--------|
| `/` | ✅ Hub |
| `/dj/` | ✅ Bio + SoundCloud |
| `/projets/jukbike/` | ✅ 4 modules, 2 photos |
| `/contact/` | ✅ |
| `/mentions-legales/` | ⚠️ `[À COMPLÉTER]` |
| `/confidentialite/` | ⚠️ `[À COMPLÉTER]` |

### Draft (hors sitemap)

ateliers · producteur · bricodeur · reactable · a2dd

### Contenu manquant

| Zone | Manque |
|------|--------|
| DJ | Photos galerie |
| Jukbike | 3 modules sans visuels (crieur, openmic, karaoke) |
| Légal | Textes mentions + RGPD (@Didier) |
| CMS | OAuth GitHub (@Didier) |

---

## 4. Technique

### Build

```bash
cd "/Users/artnoart/Code/_projets/artn0art"
hugo --minify   # OK — 20 pages FR, ~100 ms
```

**Fix session 16/07** : submodule Blowfish `faea1bb` → `1f144483` (max Hugo 0.163.3) — plus de warning version.

### Quick wins livrés (16/07)

| Item | Fichier |
|------|---------|
| Accessibilité Blowfish | `hugo.toml` → `enableA11y = true` |
| OG image par défaut | `hugo.toml` → `defaultSocialImage` |
| Alt logo header | `layouts/partials/header/basic.html` |
| Doublon data | `_data/data/profils.yaml` → safe-trash |

### Lighthouse mobile (artn0art.com, 2026-07-16)

| Catégorie | Score |
|-----------|-------|
| Performance | **97** |
| Accessibilité | **100** |
| Best practices | **100** |
| SEO | **100** |

Rapport JSON : `_archives/audits/lighthouse-mobile-2026-07-16.json`

### PDF plaquette Jukbike (art-16-02)

`static/documents/jukbike-plaquette-2026.pdf` — **1,2 Mo**. Compression `pypdf` seule = négligeable (~0,07 %). **Réduction significative** nécessite Ghostscript ou qpdf (non installés sur la machine) — tâche reportée.

---

## 5. Convention village

| Dossier | État |
|---------|------|
| `_inbox/`, `_archives/`, `_docs/`, `_data/`, `_agents/` | ✅ |
| `CLAUDE.md`, `MEMORY.md`, `AGENTS.md`, `TABLEAU.md` | ✅ Resync 16/07 |
| `_data/project.json` | ✅ GitHub Pages + Sveltia |
| `_docs/architecture.md`, `_docs/etat.md` | ✅ Resync 16/07 |

---

## 6. Risques restants

| Risque | Impact | Mitigation |
|--------|--------|------------|
| Pages légales incomplètes | Conformité | @Didier — 15 min |
| OAuth CMS non configuré | Édition bloquée | `_docs/cms-setup.md` |
| 5 univers en draft | Site incomplet | @Didier valide liste publication |
| PDF 1,2 Mo | LCP mobile si lien direct | gs/qpdf quand dispo |

---

## 7. Backlog post-audit

**P0 @Didier** : mentions légales, confidentialité, OAuth Sveltia  
**P1 @Didier** : photos DJ/Jukbike, publication pages draft  
**P2 agent** : compression PDF (gs requis)

**Livré agents 16/07** : art-16-01 ✅, art-09-15 ✅, resync docs ✅, configs legacy archivées ✅

---

*Fin audit — prochaine revue après complétion légal + OAuth CMS.*
