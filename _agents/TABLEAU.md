# TABLEAU — artn0art (backlog _agents/)

> Rédacteur unique : Claude (cf. coordination-agents.md §6). Les autres agents lisent, n'écrivent que leur fichier de statut.

## 🔬 Audit profond 2026-06-03 (Claude/Cowork)

### État réel

Site Hugo + thème **Blowfish (submodule git réellement initialisé** : `themes/blowfish/` peuplé, 75M). Contenu : **7 pages Markdown** (`content/_index.md` hub avec 4 cartes, `dj/_index.md`, `projets/_index.md` + 3 fiches `reactable`/`jukbike`/`a2dd`, `contact/_index.md`). `hugo.toml` configuré (FR, Blowfish « ocean », menus, author artn0art). `static/` **vide** (aucun favicon/OG/admin Decap). Repo : branche `main`, **2 commits en avance sur `origin/main`** (remote `github.com/artn0art/artn0art.git`, propre), dernier commit `2be44c0` du 26 mai. **Working tree sale** : `_data/project.json` est un **untracked** (`?? _data/`), tandis que l'ancien `artn0art-resume.json` apparaît **supprimé non commité** (`D`) — c'est le renommage de la migration convention-village du 2026-06-02, **fait sur disque, pas commité**. Également untracked : `AGENTS.md`, `README.md`, `_agents/`. Modifiés non commités : `.gitignore`, `_docs/architecture.md`. Une branche orpheline `audit-s140-p0p1-artn0art` traîne en local. **Poids total 603M : 528M = `.git` seul, dont 527M = `.git/modules/themes/blowfish`** (historique complet du submodule Blowfish, exampleSite + images ocean.jpg/iceland.jpg 4-5M). Le dépôt artn0art propre ne pèse que ~300K d'objets sur 10 commits — pas de `public/` en historique (bien gitignoré). **0 parasite versionné** (aucun `.DS_Store`/`node_modules`). PII : **aucune** (seul `artn0art@proton.me`, email public volontaire dans `dj/` et `contact/`).

### Écarts / risques / dette
- **DRIFT majeur persistant et aggravé** : `_data/project.json` (migré le 2026-06-02, « lossless ») conserve `"etat": "v0.0 — Projet créé… aucun code encore"`, `stats.pages: 0`, et un `todo_prochaine_session` **périmé** (« Acheter domaine », « Choisir thème Hugo », « Initialiser repo ») — alors que le site est buildé v0.1, le thème choisi (Blowfish), le repo initialisé et le domaine acheté (CLAUDE.md). La migration a **propagé la donnée fausse** au lieu de la corriger (cf. artn0art-AUDIT-01, toujours ouvert). La mémoire machine = vérité fausse.
- **Renommage `artn0art-resume.json` → `_data/project.json` non commité** : working tree sale depuis ≥1 jour. Risque de confusion / perte si quelqu'un `git checkout`.
- **`.git` à 528M pour un site de 28K de contenu** : tout vient de l'historique du submodule Blowfish cloné en profondeur. Dette d'espace disque (pas de risque sécurité). Mitigeable par un clone `--depth 1` du submodule.
- **2 commits non poussés** vers `origin` : sauvegarde distante en retard (faible enjeu, peu de travail).
- **`static/` vide** : pas de favicon, pas d'image OG, pas de `static/admin/config.yml` (Decap non configuré) — bloquant pour une vitrine pro et le déploiement (artn0art-AUDIT-04/05).
- **Contenu éditorial squelettique** : `dj/` et `jukbike/` portent des `<!-- TODO -->` (bio DJ, SoundCloud, contenu Jukbike). `_docs/etat.md` le note lui-même (« retirer ou compléter les TODO avant vitrine pro »).
- **Build Hugo non re-vérifié dans cette passe** (lecture seule, pas d'exécution). `MEMORY.md` exige Hugo ≥0.155. Le submodule étant présent, le clone n'est pas le piège — mais le build vert reste **à prouver** (artn0art-AUDIT-02).
- **Canal `_agents/` minimal** : seul `TABLEAU.md` existe. Manquent `claude.md`, `JOURNAL.md`, `cursor.md`/`antigravity.md`, `rapports/` (cf. canon §6). Conforme au minimum (TABLEAU rédacteur unique) mais incomplet.
- Pas de `PROTOCOLE-MULTI-AGENT.md` projet — normal : couvert par `AGENTS.md` (présent, untracked) + canon village.

### Score : 2.9/5

Léger gain vs 2.8/5 (S140) : structure village amorcée (`_agents/`, `_data/project.json`, AGENTS/README), submodule confirmé présent. Plafonné par le drift non résorbé (project.json ment), le working tree sale non commité, le contenu encore squelettique et l'absence de déploiement.

### Backlog priorisé

| ID | Prio | Tâche | Agent | Notes |
|----|------|-------|-------|-------|
| artn0art-DEEP-01 | P0 | Corriger `_data/project.json` : `etat` v0.1 scaffold buildé, `stats.pages` ≈7, todo à jour (domaine acheté, thème = Blowfish, repo init faits) — il contredit CLAUDE.md | 🟦 Claude | Reprise de artn0art-AUDIT-01, toujours faux après migration. La migration a copié la donnée périmée telle quelle. Vérité machine fausse = décisions en cascade biaisées. |
| artn0art-DEEP-02 | P0 | Commiter le working tree (renommage resume→project.json + AGENTS.md + README.md + _agents/ + .gitignore + architecture.md) en commits atomiques, puis `git push` | 🟩 Cursor | Renommage migration non commité. Utiliser `git mv`/`git add` proprement. 2 commits déjà en attente de push. |
| artn0art-DEEP-03 | P1 | Vérifier en réel que `hugo build` passe (Hugo ≥0.155, submodule présent) et documenter la commande exacte dans README | 🟩 Cursor | Reprise artn0art-AUDIT-02. Submodule OK donc piège « clone sans --recursive » écarté ; reste à prouver le build vert. |
| artn0art-DEEP-04 | P2 | Alléger `.git` (528M) : reconvertir le submodule Blowfish en clone `--depth 1` (ou pin de commit) | 🟧 Antigravity / @Didier | 527M = historique submodule. Gros gain disque, aucun impact fonctionnel. Action délicate (resubmodule) → présenter à Didier avant. |
| artn0art-DEEP-05 | P2 | Rédiger le vrai contenu éditorial (bio DJ, descriptions Jukbike, intégration SoundCloud) — lever les `<!-- TODO -->` | 🟦 Claude + @Didier | Contenu créatif, nécessite Didier. `dj/` et `jukbike/` encore squelettes. |
| artn0art-DEEP-06 | P2 | Peupler `static/` (favicon, image OG) + configurer Decap (`static/admin/config.yml`) puis déployer (Netlify/Cloudflare) + brancher domaine | 🟩 Cursor | Reprise artn0art-AUDIT-04/05. Dépend de DEEP-03 (build vert). `static/` vide aujourd'hui. |
| artn0art-DEEP-07 | P3 | Compléter le canal `_agents/` (claude.md, JOURNAL.md, cursor.md, rapports/) selon canon §6 | 🟦 Claude | Seul TABLEAU.md existe. Aligner sur la structure de hub standard. |
| artn0art-DEEP-08 | P3 | Nettoyer la branche locale orpheline `audit-s140-p0p1-artn0art` si fusionnée | 🟩 Cursor | Vérifier qu'elle ne porte rien d'unique avant suppression. |

## 🔍 Audit village 2026-06-02 (Claude/Cowork)

**État réel.** Site Hugo + Blowfish (submodule) réellement scaffoldé : `content/` complet (hub, dj, projets reactable/jukbike/a2dd, contact), `hugo.toml`, `_docs/` (architecture, conventions, état, pièges), repo git. CLAUDE.md décrit un état v0.1 « build OK 17 pages ». MAIS `artn0art-resume.json` est désynchronisé : il affiche encore « v0.0 — aucun code encore », architecture/todo périmés (« acheter domaine » alors que domaine acheté). Prochaines étapes du CLAUDE.md (comptes, push GitHub, Decap, déploiement, vrai contenu) restent ouvertes. Score S140 : 2.8/5.

| ID | Prio | Tâche | Agent | Notes |
|---|---|---|---|---|
| artn0art-AUDIT-01 | P1 | Resynchroniser `artn0art-resume.json` avec l'état réel (v0.1 scaffold buildé, domaine acheté, todo à jour) — il contredit le CLAUDE.md | 🟦 | Fichier mémoire machine = vérité fausse aujourd'hui. Risque de mauvaises décisions en cascade. |
| artn0art-AUDIT-02 | P1 | Vérifier que le build Hugo passe encore (submodule Blowfish présent ?) et documenter la commande exacte dans README | 🟩 | Submodule git = piège classique (clone sans `--recursive`). Cursor : un projet, exécution réelle. |
| artn0art-AUDIT-03 | P2 | Rédiger le vrai contenu éditorial (bio DJ, descriptions projets) — les `_index.md` sont des squelettes | 🟦 | Contenu créatif, nécessite Didier. Cadrage + rédaction. |
| artn0art-AUDIT-04 | P2 | Configurer le déploiement (Netlify/Cloudflare Pages) + connecter domaine artn0art.com | 🟩 | Étape technique de bout en bout, mono-projet. Dépend de AUDIT-02 (build vert). |
| artn0art-AUDIT-05 | P3 | Configurer Decap CMS (`static/admin/config.yml`) pour édition visuelle | 🟩 | Confort d'édition, pas bloquant pour un premier déploiement. |
| artn0art-AUDIT-06 | P3 | Créer les comptes réseaux (Proton, GitHub, Instagram, SoundCloud) sous artn0art@proton.me | 🟦 | Action hors-repo, à faire par Didier ; Claude tient la checklist. |
