# JOURNAL — handoff multi-agents · artn0art

> Canal local de passation entre @Claude, @Cursor, @Antigravity et @Didier.  
> Couplé à `_agents/TABLEAU.md` et `_archives/audits/`.

## 2026-07-09 — Audit complet + tableau agents

**Agent** : @Cursor  
**Durée** : ~45 min (exploration + build Hugo + rédaction)

### Livré

- Audit détaillé : `_archives/audits/AUDIT-artn0art-2026-07-09.md` (score 3,6/5)
- `_agents/TABLEAU.md` réécrit — 17 tâches actives P0→P3
- État confirmé : `main` ahead 3, build OK 20 pages FR, live stale

### Constats clés

- Perf juillet (3 commits locaux) pas encore sur GitHub Pages
- Contenu live = DJ + Jukbike ; reste en draft
- `_docs/etat.md` obsolète (Netlify vs GitHub Pages)
- 1 JPEG 3,4 Mo untracked Jukbike

### Prochaine action recommandée

1. @Didier : push `main` (art-09-01)
2. 🟦 Claude : légal + resync docs (art-09-02, 03, 08)
3. @Didier : OAuth Sveltia (art-09-04)

---

## 2026-07-09 (suite) — Exécution autonome Cursor

**Livré** : favicons.html, CMS photos, etat.md, JPEG→jpg 193Ko, gitignore JPEG bruts, TABLEAU MAJ.

**Push** : en cours vers origin/main.

---

## 2026-07-16 — Audit complet + resync docs (Cursor)

**Statut** : DONE (docs)

### Livré

- Audit complet site (score **3,5/5**)
- `CLAUDE.md` resync (stack GitHub Pages, Sveltia, piège Hugo/Blowfish)
- `_data/project.json`, `_docs/architecture.md`, `_docs/etat.md`, `TABLEAU.md` racine
- `MEMORY.md` — pièges juillet
- `_agents/TABLEAU.md` — art-16-01/02, art-09-11 annulé (cv.pdf fantôme)
- Safe-trash `_data/data/` (doublon `profils.yaml`)

### P0 restants (@Didier)

- Mentions légales + confidentialité
- OAuth Sveltia CMS

### P0 technique (agent)

- art-16-01 : compat Hugo 0.163.2 / Blowfish max 0.157

---

## 2026-07-16 (suite) — Exécution autonome Cursor

**Statut** : DONE (technique + audit archive)

### Livré

- **art-16-01** ✅ — Blowfish submodule `1f144483` (v2.104.0, max Hugo 0.163.3), build sans warning version
- **art-09-15** ✅ — Lighthouse mobile : Perf 97 · A11y 100 · BP 100 · SEO 100 → `_archives/audits/lighthouse-mobile-2026-07-16.json`
- Audit archivé : `_archives/audits/AUDIT-artn0art-2026-07-16.md`
- Quick wins : `enableA11y`, `defaultSocialImage`, alt logo header
- Configs legacy → `_archives/legacy-configs/` (netlify, cloudcannon)

### Partiel / bloqué

- **art-16-02** — PDF plaquette : `pypdf` seul insuffisant (~0,07 %). Besoin Ghostscript/qpdf pour vraie compression.

### P0 restants (@Didier)

- Mentions légales + confidentialité
- OAuth Sveltia CMS
- Photos DJ + modules Jukbike + validation pages draft

---
- 14/10 08:49 · 🟦 CLA — `content/mao/_index.md` : bio « Formateur certifié SawUp » → « Formation de formateur — Saw Up (2025) » (go Didier 14/10). Local, non poussé.
- 14/10 10:20 · 🟦 CLA — `content/dj/_index.md` : accordéon « Cours DJ — Initiation & Perfectionnement » (#cours-dj), sans tarifs (en attente Didier). Local, non poussé.
- 14/10 10:35 · 🟦 CLA — icône `static/images/modules/max_for_live.webp` (dessinée, style des autres modules) + branchée dans l’univers Max for Live. Local, non poussé.
- 14/10 10:49 · 🟦 CLA — DJ : encart module « Cours DJ » en haut (initiation/perfectionnement + tarifs = MAO, go Didier 12h40) · MAO : encart « Note · Move · Push » · CSS accents max-for-live / note-move-push / cours-dj · icônes cours_dj.webp, note_move_push.webp. Local, non poussé.
- 14/10 10:54 · 🟦 CLA — MAO : « Note · Move · Push » éclaté en 3 encarts (#note #move #push), icônes note/move/push.webp, lieu chez l’élève ou chez Didier. Local.
- 14/10 16:32 · 🟨 ANT — Bricodage : retrait de « Bionic Orchestra » des modules, intégré dans la section Bio (`content/bricodage/_index.md` + `data/profils.yaml`). MAO : remplacement du logo par un Minitel vintage affichant « MAO » à l'écran, style monoline vert sombre sur fond crème (`static/images/logo_mao.webp`, backup MPC dans `logo_mao_mpc_backup.webp`). Local.
- 14/10 16:46 · 🟨 ANT — MAO : mise à jour de l'accroche carte accueil dans `data/profils.yaml` (« Formation Ableton Live : Push, Move, Note, différents styles musicaux, spatialisation sonore. »). Local.
