# AGENTS.md — hook protocole multi-agents

Ce projet fait partie du village `~/Code` et suit un protocole multi-agents
partagé (Claude × Cursor × Antigravity). Avant toute intervention, lire le
**canon unique** :

`~/Code/_agents/coordination-agents.md`

Il définit les rôles (Claude cadreur / Cursor artisan / Antigravity usine), le
routage des tâches, le cycle en 4 phases, la complémentarité (claim de zone) et
les règles communes (checkpoint Git, safe-trash, tests verts, français).

- Missions en cours : `~/Code/_agents/missions-en-cours.md`
- Gabarit de mission : `~/Code/_agents/TEMPLATE-MISSION.md`
- Garde-fous : `~/Code/_agents/ANTI-REGRESSION.md`

**En finissant un audit / constat chiffré** (automatique) : canon
`coordination-agents.md` § *Rendu accessible* — rapport · registre si brique ·
CANAL en tête · JOURNAL en tête. Gabarit : `TEMPLATE-RAPPORT-AUDIT.md`.
Didier n'a pas à le redemander.

## Entrée de session — dans cet ordre, avant toute action

1. `~/Code/CLAUDE.md` puis le `CLAUDE.md` de ce projet.
2. `~/Code/_agents/coordination-agents.md` — le canon ci-dessus.
3. **`_agents/CANAL.md`** — § ▶ PROCHAINE ACTION, puis les fils ouverts.
   **C'est là que les agents se parlent.** `JOURNAL.md` raconte l'après ;
   `TABLEAU.md` porte le backlog (rédacteur unique : Claude).
   Gabarit : `~/Code/_agents/TEMPLATE-CANAL.md`.
4. `_agents/<ton-nom>.md` — ton claim et tes capacités prouvées.
5. **Le canal général — et tu prends TES demandes avant toute autre chose.**
   `GET http://localhost:8888/api/agents/etat` (ou `/api/demandes/village`, les
   13 carnets `<maison>/_data/demandes.json`) : ce qui t'est adressé (`#cla`,
   `#cur`, `#ag`, ou `pour`), et ce qui attend Didier. Tu marques **lu**, tu
   réponds **dans le fil** de la demande (`POST /api/agents/message`), tu passes
   `s: faite` seulement quand c'est livré (§ 7 ter). Didier n'a plus à te dire
   « lis le canal » : c'est l'entrée. Vue humaine : `http://localhost:8888/canal/`.
   *(Règle posée par Didier le 10/09 — F04 ; remplace l'ancien pointeur
   `module-status.json`.)*

**Avant d'écrire : claim.** `[CLAIM: <agent> AAAA-MM-JJ HHhMM — les/fichiers]`
dans ton `_agents/<ton-nom>.md`. Le claim nomme les **fichiers** (jamais un
numéro de mission), vit **là où vivent les fichiers** (un chantier à deux dépôts
pose deux claims), et une zone relâchée se **réattribue** — sinon elle devient
fantôme. `CANAL.md` est append-only : `Read` + `Edit`, jamais `Write`.

> Le dossier `_agents/` est créé à la première mission. **Committer `CANAL.md`
> dès sa création** : un canal encore `??` n'a aucune garde, le prochain `Write`
> l'écrase (incident du 26/08).

---

## Spécifique à ce projet

5. Les **envies de Didier** encore ouvertes. Pour les apps servies par le moteur
   `mx` (a2dd-v2, dwet, zorey) : `~/Music/75___mx/_data/module-status.json`,
   entrées `demandes[]` avec `s` != `faite` — déposées par le mode dev
   « demande », tout `#mot` du texte étant un tag de routage. Ailleurs : elles
   arrivent en `❓ question — ⚖️ Didier` dans `CANAL.md`.
