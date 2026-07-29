# TABLEAU — artn0art.com

> Backlog multi-agents · Dernière mise à jour : **2026-07-16** (session autonome Cursor)  
> Audit : `_archives/audits/AUDIT-artn0art-2026-07-16.md` · Hub : `TABLEAU.md` racine

---

## État au 16/07/2026

| Indicateur | Valeur |
|------------|--------|
| Score audit | **3,5 / 5** |
| Build Hugo | ✅ 20 pages FR (Blowfish v2.104.0) |
| Branche | `main` synchro origin |
| Live | GitHub Pages — artn0art.com |
| Pages live | DJ + Jukbike |
| Lighthouse mobile | Perf 97 · A11y 100 · SEO 100 |

---

## Backlog actif

| ID | Prio | Statut | Action | Agent |
|----|------|--------|--------|-------|
| art-09-01 | P0 | ✅ DONE | Push `main` — deploy GitHub Pages | 🟩 Cursor |
| art-09-02 | P0 | BLOCKED | Compléter mentions légales (nom, adresse) | @Didier + 🟦 Claude |
| art-09-03 | P0 | BLOCKED | Compléter politique confidentialité | @Didier + 🟦 Claude |
| art-09-04 | P0 | BLOCKED | OAuth GitHub Sveltia CMS | @Didier |
| art-16-01 | P0 | ✅ DONE | Hugo/Blowfish — submodule v2.104.0 (max 0.163.3) | 🟩 Cursor |
| art-09-05 | P1 | BLOCKED | Photos galerie DJ | @Didier |
| art-09-06 | P1 | BLOCKED | 3 modules Jukbike restants | @Didier |
| art-09-07 | P1 | ✅ DONE | Champ `photos` dans `static/admin/config.yml` | 🟩 Cursor |
| art-09-08 | P1 | ✅ DONE | Resync `_docs/etat.md` (GitHub Pages) | 🟩 Cursor |
| art-09-09 | P1 | BLOCKED | Retirer `draft:` pages — valider liste | @Didier |
| art-09-10 | P1 | ✅ DONE | Favicons via `layouts/partials/favicons.html` | 🟩 Cursor |
| art-09-11 | P2 | CANCEL | `static/cv.pdf` absent — remplacé par art-16-02 | — |
| art-16-02 | P2 | BLOCKED | Compresser PDF plaquette (1,2 Mo) — besoin gs/qpdf | 🟧 Antigravity |
| art-09-12 | P2 | ✅ DONE | Inter + Space Grotesk self-host | 🟩 Cursor |
| art-09-13 | P2 | ✅ DONE | JPEG brut → jpg 193 Ko | 🟩 Cursor |
| art-09-14 | P2 | ✅ DONE | Audit liens live — 6/6 URLs 200 | 🟩 Cursor |
| art-09-15 | P2 | ✅ DONE | Lighthouse mobile — 97/100/100/100 | 🟩 Cursor |

---

## Livré session 16/07 (autonome)

- Blowfish update + build OK
- Lighthouse mobile + archive JSON
- Audit 2026-07-16 archivé
- a11y, OG image, alt logo
- Configs Netlify/CloudCannon → `_archives/legacy-configs/`

---

## Décisions Didier en attente

- Identité légale (nom, adresse, statut)
- OAuth CMS GitHub
- Quelles pages draft publier

## 🎯 Priorités — audit village 2026-07-30

> Injecté par l'audit Claude (Cowork) du 2026-07-30 — rapport : `~/Code/_hub/audits/AUDIT-VILLAGE-2026-07-30.md`.
> Ordre = priorité décroissante. Cocher/reporter au fil de l'eau.

| P | Tâche | Pourquoi |
|---|-------|----------|
| **P1** | Committer les 17 modifs en attente | hygiène git (rien de committé récemment) |
| **P2** | Migrer `data/` → `_data/` | forme interdite (convention village) |
| **P3** | Page/extraits mashup pour le portfolio | alimente la Phase 5 signature Jukbike |
