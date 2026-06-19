# Handoff Conception — Phase 5 : Audit Responsive, Accessibilité (a11y) & Performance

## Contexte
Cette phase définit les corrections d'accessibilité (a11y), de performance (Web Vitals) et d'agencement sur mobile (responsive) identifiées lors de l'audit du site (v0.2.2).

## Fichiers de spécification produits
La spécification d'audit est disponible dans [_agents/conception-site/design/05-audit-aria.md](file:///Users/artnoart/Code/_projets/artn0art/_agents/conception-site/design/05-audit-aria.md).

Elle définit :
1. **La correction des contrastes au survol (P1)** : Changement du comportement de survol des liens dans la prose pour éviter l'utilisation directe de `var(--u-color)` sur le texte (insuffisant sur fond clair), remplacé par un surlignage d'arrière-plan semi-transparent et une coloration du soulignement.
2. **La compression et conversion WebP (P1)** : Remplacement des 5 images PNG trop lourdes (~4 Mo cumulés) dans `static/images/` par des versions compressées en WebP (~500 Ko cumulés), et mise à jour de leurs liaisons dans `data/profils.yaml` et les fichiers markdown de contenu.
3. **L'enrichissement ARIA (P2)** : Ajout d'attributs `aria-label` descriptifs pour tous les liens externes s'ouvrant dans un nouvel onglet, et amélioration des textes alternatifs `alt` d'images pour éviter les répétitions.
4. **L'ajustement Responsive (P2/P3)** : Césure forcée sur les longs titres pour éviter les débordements sur petit écran (<375px) et augmentation de l'espacement vertical des listes à puces denses sur mobile.

---

## Prochaine étape pour Cursor
Dès que Didier valide cette phase :
1. Cursor doit exécuter le **Prompt 5** de `_agents/conception-site/cursor-prompts.md`.
2. Il convertira les 5 illustrations PNG en WebP dans `static/images/` (par exemple via un script Python ou une commande CLI locale), supprimera proprement les anciennes images PNG via Git, et mettra à jour les liaisons d'images dans le contenu et les métadonnées.
3. Il implémentera les règles de style et d'attributs pour l'accessibilité et la mise en page responsive.
