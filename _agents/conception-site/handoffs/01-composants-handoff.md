# Handoff Conception — Phase 1 : Spécification des Composants

## Contexte
Spécification détaillée des composants clés (grille, cartes projets featured/secondary, tags de contexte, badges de statut, intro et footer) pour le site **artn0art** (Phase 1 du plan de conception).

## Fichiers de spécification produits
La spec complète a été écrite dans [_agents/conception-site/design/01-composants.md](file:///Users/artnoart/Code/_projets/artn0art/_agents/conception-site/design/01-composants.md).

Elle décrit l'anatomie HTML, les règles d'espacement basées sur nos design tokens, les états d'interaction (repos, hover, focus), les contraintes responsives de chaque composant, et fournit des wireframes ASCII :
1. **Grille et Cartes Projet (`.device-card`)** : Image dominante 4:3 en haut, marges intérieures du corps de carte basées sur `--space-4`/`--space-5`, description limitée à 90 caractères maximum (1 phrase), hover avec translation -2px, ombre portée, et zoom image 1.02.
2. **Tags & Badges de Statut** : Styles distincts (badge d'univers pointillé avec fond teinté à 15% d'opacité, tags de contexte gris fins et solides).
3. **Intro de Page (`.site-intro`)** : Branding en Space Grotesk Extra Bold majuscule serré (`letter-spacing: -0.04em`, `--fs-xl`), séparateur horizontal bas.
4. **Footer Discret (`.site-footer`)** : Alignement horizontal flex-wrap, liens gris discrets s'empilant sur mobile.

---

## Prochaine étape pour Cursor
Dès que ce document et les design tokens de la Phase 0 sont validés :
1. Cursor doit exécuter le **Prompt 1** de `_agents/conception-site/cursor-prompts.md`.
2. Il implémentera le CSS de ces composants réutilisables dans `assets/css/custom.css` en respectant l'a11y et le responsive.
