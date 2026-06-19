# Prompts Antigravity — DESIGN (artn0art)

> Rôle pour cette mission : **direction artistique & design**. Tu produis des **specs
> Markdown + maquettes/références visuelles**, jamais du code de prod. Dépose tes livrables
> dans `_agents/conception-site/design/` et tes handoffs dans `_agents/conception-site/handoffs/`.
> Langue : **français**. Respecte le canon `~/Code/_projets/_agents/coordination-agents.md`.
> Ne touche pas à `assets/css/`, `layouts/`, `hugo.toml`, `static/` (zone Cursor).

Colle chaque bloc tel quel dans Antigravity, une phase à la fois.

---

## Prompt 0 — Cadrage & design tokens

```
Contexte : site Hugo "artn0art" (vitrine DJ + portfolio créatif), inspiration fors.fm/devices.
Lis d'abord : CLAUDE.md, _docs/reco-design-fors.md, data/profils.yaml, assets/css/custom.css (:root).

Mission (DESIGN seulement, pas de code) :
Définis le système de design tokens du site et écris-le dans
_agents/conception-site/design/00-tokens.md. Couvre :
- Palette : fond/surface/texte/muted/bordures (déjà gris neutre #e4e4e4) + les 5 COULEURS
  D'UNIVERS par projet (DJ violet #c4b5fd, Reactable vert #6ee7b7, Jukbike jaune #fcd34d,
  a2dd bleu #93c5fd, Musique rose #fca5a5). Pour chaque univers : usage exact (accent de carte,
  liseré, hover ?) en gardant la sobriété fors.fm.
- Typo : Space Grotesk (titres) / Inter (corps). Échelle de tailles (clamp), graisses, interlignage.
- Espacements : échelle (4/8/12/16/24/32/48), rythme vertical.
- États : hover carte (éclaircissement + scale 1.02), focus visible (a11y), liens.
Livrable = tableau de tokens prêt à être traduit en variables CSS par Cursor.
Ne modifie aucun fichier de prod. Termine par un handoff dans
_agents/conception-site/handoffs/ résumant les tokens et les décisions à valider.
```

---

## Prompt 1 — Design system (composants)

```
Pré-requis : 00-tokens.md validé.
Mission (DESIGN) : maquette le design system des composants réutilisables et écris la spec
dans _agents/conception-site/design/01-composants.md. Composants à spécifier :
- Carte projet (device-card) : image dominante (ratio 4:3 ou 1:1), titre, tag(s) contexte,
  badge statut, description ≤ 90 car. Variantes featured / secondary.
- Tag et badge statut (pastilles bordées).
- Intro de page (site-intro) : titre + accroche.
- Footer discret (liens SoundCloud / contact / mentions).
Pour chaque composant : anatomie, espacements (en tokens), états (repos/hover/focus),
contraintes responsive, et un exemple visuel (maquette image ou ASCII/wireframe).
Référence l'existant : layouts/partials/projet-device.html, projet-catalog.html, footer.html.
Ne modifie aucun fichier de prod. Handoff en fin.
```

---

## Prompt 2 — Home / grille de cartes (reco P1)

```
Pré-requis : 01-composants.md validé.
Mission (DESIGN) : maquette la page d'accueil en GRILLE DE CARTES (le vrai look fors.fm/devices),
écris la spec dans _agents/conception-site/design/02-home.md. Exigences :
- Grille 2 colonnes (1 colonne < 680px), gap ~1.5rem, conteneur élargi ~64rem.
- 2 sections : "En scène" (featured : DJ, Jukbike) et "Autres facettes" (secondary).
- Image en grand par carte, hover : léger zoom image + carte qui s'éclaircit.
- Accroche unique en haut ("Pour ta considération").
Fournis : wireframe desktop + mobile, hiérarchie visuelle, comportement responsive précis,
et la liste des écarts avec le rendu actuel (liste de lignes). Données = data/profils.yaml.
Ne modifie aucun fichier de prod. Handoff = brief d'implémentation pour Cursor.
```

---

## Prompt 3 — Gabarit page projet (référence : Jukbike)

```
Pré-requis : 01-composants.md validé.
Mission (DESIGN) : conçois le gabarit d'une fiche projet, en prenant Jukbike comme référence
(http://localhost:1313/projets/jukbike/, contenu : content/projets/jukbike/index.md).
Écris la spec dans _agents/conception-site/design/03-fiche-projet.md :
- Structure : hero (image univers + titre + accroche + statut/tags), corps (specs, blocs
  thématiques — pour Jukbike : Jukbox, Open Mic, Crieur de rue, Karaoké —, tarifs), CTA contact,
  fil d'Ariane.
- Application de la couleur d'univers (Jukbike jaune) en accent, sobrement.
- Responsive + lisibilité (longueur de ligne, hiérarchie de titres).
Le gabarit doit être générique (réutilisable pour reactable, a2dd, producteur, bricodeur,
sonothérapie). Fournis wireframe desktop + mobile. Ne modifie aucun fichier de prod. Handoff en fin.
```

---

## Prompt 4 — Pages DJ / Contact / secondaires

```
Pré-requis : 03-fiche-projet.md validé.
Mission (DESIGN) : specs de mise en page pour les pages restantes, dans
_agents/conception-site/design/04-pages.md :
- DJ (content/dj/_index.md) : bio, styles, intégration SoundCloud, booking — agencement.
- Contact (content/contact/_index.md) : réseaux + email proton, sobriété, hiérarchie.
- Secondaires (producteur, bricodeur, a2dd, reactable, sonothérapie) : application du gabarit
  fiche projet, particularités éventuelles par page.
Pour chacune : wireframe, ordre des blocs, ce qui change vs le gabarit générique.
Ne modifie aucun fichier de prod. Handoff en fin.
```

---

## Prompt 5 — Audit responsive / accessibilité / perf

```
Pré-requis : phases 2–4 implémentées par Cursor (build vert).
Mission (DESIGN/QA) : audite le site rendu sur localhost:1313 et écris
_agents/conception-site/design/05-audit-aria.md :
- Accessibilité (WCAG AA) : contrastes (notamment couleurs d'univers sur fond gris),
  focus visible, cibles tactiles ≥ 44px, alternatives d'images, ordre de lecture, navigation clavier.
- Responsive : breakpoints, débordements, images, grille → 1 colonne.
- Perf : poids des images IA (homogénéiser + compresser), polices, rendu sobre.
Livrable = liste priorisée (P1/P2/P3) de corrections concrètes, chacune assignable à Cursor.
Ne modifie aucun fichier de prod. Handoff en fin.
```

---

## Prompt 6 — Image de partage (OG) & favicon (design seulement)

```
Mission (DESIGN) : conçois l'identité de partage du site.
- Favicon : décline le logotype "artn0art" (avec le zéro) en favicon lisible à 32px ;
  fournis les specs + un visuel source (PNG haute déf) dans _agents/conception-site/design/assets/.
- OG image (1200×630) : visuel de partage cohérent avec l'ADN (fond gris, typo serrée).
Fournis les fichiers sources + une note d'intégration. L'intégration technique dans static/
sera faite par Cursor. Handoff en fin.
```
