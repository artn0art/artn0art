# TABLEAU — artn0art.com

> Backlog multi-agents · Dernière mise à jour : **2026-07-09** (session autonome Cursor)  
> Audit détaillé : `_archives/audits/AUDIT-artn0art-2026-07-09.md`

---

## État au 09/07/2026

| Indicateur | Valeur |
|------------|--------|
| Score audit | **3,6 / 5** |
| Build Hugo | ✅ 20 pages FR |
| Branche | push en cours (3 commits perf + fixes audit) |
| Live | GitHub Pages |
| Pages live | DJ + Jukbike |

---

## Backlog actif

| ID | Prio | Statut | Action | Agent |
|----|------|--------|--------|-------|
| art-09-01 | P0 | ✅ DONE | Push `main` — deploy GitHub Pages (b29bd9b) | 🟩 Cursor |
| art-09-02 | P0 | BLOCKED | Compléter mentions légales (nom, adresse) | @Didier + 🟦 Claude |
| art-09-03 | P0 | BLOCKED | Compléter politique confidentialité | @Didier + 🟦 Claude |
| art-09-04 | P0 | BLOCKED | OAuth GitHub Sveltia CMS | @Didier |
| art-09-05 | P1 | BLOCKED | Photos galerie DJ | @Didier |
| art-09-06 | P1 | BLOCKED | 3 modules Jukbike restants | @Didier |
| art-09-07 | P1 | ✅ DONE | Champ `photos` dans `static/admin/config.yml` | 🟩 Cursor |
| art-09-08 | P1 | ✅ DONE | Resync `_docs/etat.md` (GitHub Pages) | 🟩 Cursor |
| art-09-09 | P1 | BLOCKED | Retirer `draft:` pages — valider liste | @Didier |
| art-09-10 | P1 | ✅ DONE | Favicons via `layouts/partials/favicons.html` | 🟩 Cursor |
| art-09-11 | P2 | READY | Compresser `static/cv.pdf` | 🟧 Antigravity |
| art-09-12 | P2 | READY | Self-host fonts restantes | 🟩 Cursor |
| art-09-13 | P2 | ✅ DONE | JPEG brut → `jukbike-v1-grue-jaune-1.jpg` (193 Ko) | 🟩 Cursor |
| art-09-14 | P2 | READY | Audit liens / 404 post-push | 🟩 Cursor |
| art-09-15 | P2 | READY | Lighthouse mobile post-deploy | 🟩 Cursor |

---

## Livré session 09/07 (autonome)

- Audit + TABLEAU + JOURNAL
- CMS photos, favicons, etat.md
- Photo Jukbike compressée + gitignore JPEG bruts

---

## Décisions Didier en attente

- Identité légale (nom, adresse, statut)
- OAuth CMS GitHub
- Quelles pages draft publier
