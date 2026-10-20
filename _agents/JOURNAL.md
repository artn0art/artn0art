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
- 15/10 00:24 · 🟩 CUR — D580 (lot CU) : commit local de sécurité (`648fdae`), optimisation photo Jukbike 3,4 Mo ➔ WebP 47 Ko (`0b29b1f`), audit Lighthouse et contrôle visuel. Local.
- 15/10 00:35 · 🟨 ANT — D580 (lot AN + arbitrages Didier) : MAO renommé en « Production » ; 4 univers passés en brouillon réservé (`content/mao/_brouillons_univers.md`) ; 3 modules actifs réordonnés (Push ➔ Move ➔ Max for Live) ; barre de navigation visuelle par icônes en tête de page (Production & Bricodage) ; migration des styles inline vers classes CSS propres (`custom.css`) ; centralisation du script d'ancres accordéons dans `extend-footer.html` ; tutoiement appliqué ; mentions légales complétées (Arnaud Bannais, Nantes, SIRET 849 803 325 00018). Build Hugo 200 OK. Local.
- 15/10 00:57 · 🟨 ANT — Retrait des 3 boutons icônes supérieurs sur MAO/Production et Bricodage (retour visuel Didier).
- 15/10 01:20 · 🟨 ANT — Logo Minitel : écran mis à jour avec « PRODUCTION » au lieu de « MAO » (typographie géométrique rétro Futura Bold en vert `#275528` sur fond crème `#f8f7f3`), installé dans `logo_production.webp` et `logo_mao.webp`.
- 20/10 07:55 · 🟧 ANT — Finalisation et intégration Production + Plaquettes 2026 :
  • Production (/mao/) : lecteurs SoundCloud intégrés (Downtempo & Boom Bap, couleur #d97706), 3 modules ordonnés (Push 3, Move, Max for Live), tarifs & offres clarifiés, mention de pause jusqu'au 1er novembre (formation Victoria).
  • DJ (/dj/) : 4 lecteurs SoundCloud (Hip-Hop, Tropicaux, Musique Électronique, System Culture), 2 modules (Cours DJ & Prestations).
  • Bricodage (/bricodage/) : 2 modules (Audio-livre avec visuel épuré & Jukbike), fiche transmission et ressources.
  • Plaquettes 2026 : 4 PDF A4 compilés et disponibles dans static/documents/, reliés aux cartes d'accueil et sections ressources.
  • CSS : harmonisation visuelle des tags statut/plaquette et des boutons sur la home. Build Hugo 0 erreur.
- 20/10 08:34 · 🟧 ANT — Bricodage : mise à jour du concept & ambiance de l'Audio-livre (Compagnie d'iCidence, médiathèques d'Ille-et-Vilaine, chant/danse/percussions tout-petits) et de la fiche transmission (Petits Débrouillards Nantes & Toulouse). Plaquette PDF Bricodage 2026 recompilée.
- 20/10 08:45 · 🟧 ANT — Production : écriture agrandie (logo Minitel : « PRODUCTION » passe de 37px à 92px de hauteur pour remplir l'écran du Minitel, titre de section sur /mao/ passé à 2.25rem gras). Déployé.
- 20/10 08:58 · 🟧 ANT — Jukbike : enrichissement de la Genèse (V1 chez Beebike, V2 conçue à l'Atelier du Pignon début octobre 2026), chiffres clés actualisés (60+ prestations, 11 clients, 5 collectivités, 6-8h autonomie) et nouvel accordéon dédié « Styles & Formats de Prestations » (festivals, guinguettes, animations de quartier, mobilité douce, mariages/privé). Déployé.
- 20/10 09:00 · 🟧 ANT — Jukbike : épuration de la section Fiche Technique & Logistique. Retrait des cartes factices/doublons, intégration du texte explicatif d'autonomie totale et de la condition météo (besoin d'un lieu de repli en cas de pluie). Plaquette PDF conservée. Déployé.


