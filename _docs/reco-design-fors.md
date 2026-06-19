# Diagnostic + reco design — artn0art ⟵ inspiration fors.fm/devices

> Rédigé le 2026-06-17 (Claude/Cowork). Avant de coder : état réel + écarts avec fors.fm + plan priorisé.

## Ce qui existe déjà (et qui est bon)
Le site **applique déjà** la logique fors.fm/devices, proprement :
- `data/profils.yaml` = source unique (featured / secondary), chaque entrée = titre + image + tags + statut + description courte évocatrice. **Très bien pensé.**
- Partials dédiés : `home/custom.html`, `projet-catalog.html`, `projet-device.html`.
- `assets/css/custom.css` (293 l.) : fond gris neutre (#e4e4e4), look clair forcé, tags en pastilles bordées, hover discret, menu épuré. **L'ADN fors.fm est là** (sobriété, typo serrée, pas de grosses cartes colorées).
- Build Hugo vert (v0.2), 20 pages.

## L'écart principal avec fors.fm/devices
fors.fm/devices = **grille de cartes** (2 colonnes), image dominante par produit, nom + tags de format + prix + une ligne. 
artn0art = **liste de lignes** (vignette 88px à gauche + texte à droite), 1 colonne, `max-width: 52rem`.

→ Ton rendu est plus « annuaire/liste » que « vitrine produits ». Les deux sont légitimes, mais si tu veux *vraiment* le punch visuel de fors.fm, il faut passer en **grille de cartes avec l'image en grand**.

## Reco priorisées

### P1 — Passer la home en grille de cartes (le vrai look fors.fm)
- Dans `projet-catalog.html` / `custom.css` : transformer `.device-list` (flex column) en **grid** : `display:grid; grid-template-columns: repeat(2, 1fr); gap: 1.5rem;` (1 colonne sous 680px).
- Refaire `projet-device.html` en **carte** : image en haut pleine largeur (ratio 4:3 ou 1:1), puis titre + tags + statut + description dessous. Garde le lien sur toute la carte.
- Élargir le conteneur à ~`64rem` (la grille 2 col respire mal à 52rem).
- Hover fors.fm : léger zoom image (`transform: scale(1.02)`) + fond carte qui s'éclaircit.

### P2 — Affiner la typographie & le ton
- fors.fm = descriptions **très courtes et poétiques** (« Ceremonial reverb… zooming in and out of focus »). Tes descriptions sont déjà bonnes mais parfois longues → viser **1 phrase, ≤ 90 caractères**.
- Tags de « format » facon fors (`CLAP+VST3`) → chez toi : transformer en tags de **contexte** homogènes (ex. `Live Set`, `Plein air`, `Studio`) — déjà le cas, juste harmoniser (1–2 tags max par carte).
- Tester une **vraie typo de titre** (fors utilise une grotesque serrée) : importer une police variable (ex. *Inter Tight* / *Space Grotesk*) pour les titres, garder Inter pour le corps.

### P3 — Cohérence visuelle des images
- fors.fm a des visuels **homogènes** (même traitement, même palette). Tes 5 images IA sont chouettes mais d'univers différents → passer un **filtre/traitement commun** (même grain, même teinte, ou cadre uniforme) pour l'effet « collection ».
- Format carré ou 4:3 identique pour toutes (recadrage).

### P4 — Détails fors.fm qui font la différence
- Une **ligne d'accroche** unique en haut (fors = « For your consideration » → tu as déjà « Pour ta considération » ✅).
- Footer ultra-discret avec liens (SoundCloud, contact, mentions).
- **Favicon + image OG** (déjà noté « à faire » dans etat.md).

## Ce que je NE recommande pas
- Repartir de zéro / changer de thème : Blowfish + tes partials custom suffisent largement.
- Ajouter des animations lourdes : fors.fm est rapide et sobre, c'est sa force.

## Prochaine étape proposée
Si tu valides la **P1 (grille de cartes)**, je l'implémente directement : modif de `projet-device.html` + `projet-catalog.html` + bloc CSS grille dans `custom.css`, et on vérifie le rendu sur `localhost:1313`. Dis-moi « go grille » et je code. (P2–P4 ensuite, par petites touches.)
