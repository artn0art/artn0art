# Chantier site artn0art — finir MAO et Bricodage, ajouter les cours DJ

> Demandé par Didier le 14/10 · Préparé par 🟦 CLA · Pour : 🟧 AN (intégration) · Didier 👤 tranche
> Projet : `~/Code/_projets/artn0art` (Hugo + Blowfish)

## Où on en est (mesuré le 14/10)

| Page | Fichier | État |
|---|---|---|
| MAO | `content/mao/_index.md` | Presque finie : 3 univers (Downtempo, House organique, Techno mélodique), offres, tarifs, compétences, bio. **Une erreur à corriger.** |
| Bricodage | `content/bricodage/_index.md` | 2 modules sur 4 écrits (Audio-livre, Jukbike). Bionic orchestra, Animateur numérique et la bio sont « 🚧 En construction ». |
| DJ | `content/dj/_index.md` | 4 playlists SoundCloud, bio, fiche technique, références. **Aucun cours.** |

## Ordre proposé

1. **Tout de suite** : la correction MAO (5 minutes, c'est une info fausse en ligne).
2. **Cette semaine** : les cours DJ (nouvelle offre, dès que Didier a tranché les 👤).
3. **Quand Didier a écrit ses textes** : les modules Bricodage manquants.

## Lot 1 — MAO : finitions

- 🔴 **Bio** : la page dit « **Formateur certifié SawUp (2025)** — parcours certifiant ». Didier a suivi la formation Saw Up mais **n'est pas certifié**. À réécrire, par exemple : « Formation de formateur — Saw Up (2025) : ingénierie pédagogique appliquée à la création musicale ». 👤 Didier valide la formulation.
- **Max for Live** : le 09/10, Didier voulait une partie MAO avec Max for Live en priorité. La page dit aujourd'hui « pas proposé en cours particulier, masterclass sur demande ». 👤 Didier : on garde tel quel, ou on ajoute un 4e univers Max for Live ?
- **Stage intensif** : Didier fait une semaine de 40 h chez une élève (fin octobre, 30 €/h). Ce format n'existe pas sur la page (seulement « stage 25 h sur demande »). 👤 Didier : on l'ajoute aux offres ?

## Lot 2 — Bricodage : modules manquants

Rien à inventer : ces textes viennent de Didier.

| Module | Ce qui manque | Qui |
|---|---|---|
| Bionic orchestra | concept + ambiance (rien trouvé dans ~/Code) | 👤 Didier écrit, AN intègre |
| Animateur numérique (Petits Débrouillards) | publics, thèmes d'ateliers, années (on sait : 5 ans) | 👤 Didier écrit, AN intègre |
| Bio bricodeur | texte, ou reprise de la bio MAO | 👤 Didier choisit |

Tant qu'un texte manque, le module garde son « 🚧 En construction ».

## Lot 3 — DJ : cours initiation et perfectionnement (nouveau)

**Où** : sur la page DJ, un accordéon « Cours DJ » sous les playlists, même présentation que « Offres de cours » de la page MAO (tableau Formule · Public · Format · Objectif), plus un bouton « Réserver un cours » (`mailto:artn0art@proton.me?subject=Demande de cours DJ`).

**Contenu proposé** (à valider par 👤 Didier, rien n'est en ligne) :

| Formule | Public | Ce qu'on travaille |
|---|---|---|
| **Initiation DJ** | Débutants, aucun matériel requis | Le matériel et le logiciel · caler deux morceaux à l'oreille · compter les phrases (8 / 16 / 32 temps) · transitions simples avec l'EQ et le volume · premier mix de 20 min enregistré |
| **Perfectionnement DJ** | DJs qui mixent déjà | Mix harmonique (tonalités, Camelot) · transitions avancées · bases du scratch · construire un set qui raconte quelque chose · préparer et trier sa bibliothèque · enregistrer et réécouter son mix |

👤 **Didier tranche** :
1. Le contenu des deux formules (garder, retirer, ajouter).
2. Le format : durée des séances, pack ou à l'unité.
3. Les tarifs (rien n'est écrit sur la page DJ aujourd'hui).
4. Le matériel : sur ton matériel, celui de l'élève, ou les deux ? Quel logiciel (djay Pro ?).
5. Le lieu : même règle que la MAO (studio à Nantes, à domicile dans 20 km, en ligne) ?

## Règles pour AN

- Claim dans `_agents/antigravity.md` avant d'écrire.
- Ne pas toucher aux pages en `draft: true` (ateliers, bricodeur, a2dd, producteur, reactable).
- Vérifier le rendu en local (`hugo server`) avant de dire « fait » : accordéons qui s'ouvrent, ancres, mobile.
- ⛔ **Aucun push, aucune mise en ligne** sans l'ordre de Didier.
- Rien d'inventé : tout texte marqué 👤 attend Didier.
- Échanges dans le canal du Village.
