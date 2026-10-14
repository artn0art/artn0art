# 🧵4 Bricodage sur artn0art — inventaire avant mise en ligne

> 10/10 ~01h40 · 🟦 Claude · pour 🟧 Antigravity (pages) et 👤 Didier (validation).
> But : savoir ce qui existe déjà, ce qui est faux, ce qui manque, avant de monter les pages.

## Ce qui existe déjà sur le site

| Page | Fichier | État |
|---|---|---|
| **Bricodeur** (Reactable · a2dd · audio-livre) | `content/projets/bricodeur/index.md` | **Brouillon** (`draft: true`), donc pas en ligne. Texte complet, 1 image (`projet_bricodeur.webp`). |
| **Jukbike** | `content/projets/jukbike/index.md` | **En ligne.** Modules en accordéon. TABLEAU : 3 modules sans photos (art-09-06, attend Didier). |
| Reactable | `content/projets/reactable/` | Page à part (en plus de la section dans Bricodeur). |

## Par projet

### 1. Audio-livre — ⚠️ le texte du site est faux
Le site décrit un objet à **cartes NFC** que l'on pose (PN532 + DFPlayer Mini), « choisir un livre ou une sélection musicale ».
Le vrai projet (`_projets/proto-audio-livre/`) : **un livre dont on tourne les pages**, une puce par page, et la musique change avec la page ouverte. Les guides du 09/10 décrivent le comportement réel : interrupteur MARCHE/ARRÊT, une musique d'environ 10 min par page, reprise sur la dernière puce vue, recharge 4–5 h.
- À réécrire : le paragraphe « 3. Proto-Audio-Livre » de la page Bricodeur.
- Matière dispo : `proto-audio-livre/README.md`, `guides/guide-utilisation-et-depannage.pdf`, `guides/manuel-audio-livre-commun-2026-10-09.md`.
- Manque : **photos** du livre (aucune dans `static/images`). 👤

### 2. Jukbike — ✅ en ligne
- Manque : photos de 3 modules (déjà dans le TABLEAU, art-09-06). 👤
- Matière dispo : `_projets/dd-jukbike/` (communication, plaquette `jukbike-plaquette-2026-editable.pptx`).
- Question : faut-il le répéter dans la page bricodage, ou juste un lien vers sa page ?

### 3. Bionic orchestra — ❓ rien trouvé
Aucune trace dans `~/Code` (aucun fichier ne contient « bionic »). Pas de texte, pas de photo. 👤 Il faut tout : 3 lignes de concept, 2-3 photos, la technique utilisée.

## 👤 Ce que Didier tranche
☐ A. une page « Bricodage » unique (Reactable, audio-livre, bionic orchestra, + lien Jukbike) : on réutilise la page Bricodeur en brouillon et on la corrige
☐ B. une page par projet (comme Jukbike et Reactable aujourd'hui)

Et quand tu peux : 3 lignes sur **bionic orchestra**, et les photos de l'audio-livre.
