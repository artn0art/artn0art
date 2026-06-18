# Handoff Conception — Phase 0 : Design Tokens

## Contexte
Définition initiale du design system (design tokens) pour le site vitrine/portfolio **artn0art**. 
Cette spécification sert de base à l'implémentation CSS par l'agent **Cursor** (Phase 0 du plan de conception).

## Tokens validés
Le fichier complet a été écrit dans [_agents/conception-site/design/00-tokens.md](file:///Users/artnoart/Code/_projets/artn0art/_agents/conception-site/design/00-tokens.md). Il définit :
1. **Couleurs Neutres** : Une fondation gris neutre `#e4e4e4` (conforme à l'existant) avec éclaircissement au survol vers `#f3f3f3`.
2. **Couleurs d'Univers** : DJ (violet `#c4b5fd`), Reactable (vert `#6ee7b7`), Jukbike (jaune `#fcd34d`), a2dd (bleu `#93c5fd`), Musique (rose `#fca5a5`).
3. **Typographies** : Space Grotesk pour les titres et Inter pour le corps, avec une échelle fluide de type `clamp()`.
4. **Espacements** : Grille modulaire basée sur des multiples de 8px (échelle de `--space-1` à `--space-8`).
5. **États & Accessibilité** : États repos/hover interactif et a11y (focus visible).

---

## Décisions à valider (par Didier ou Cursor lors de l'implémentation)

### 1. Règle d'intégration des couleurs d'univers sur les cartes
Plutôt que d'avoir des cartes entièrement colorées (ce qui détruirait la sobriété fors.fm), nous proposons que :
- Le fond des cartes reste neutre (`--surface`).
- Seul le badge de **statut** (ex: *Booking ouvert*) soit teinté avec la couleur d'univers correspondante à **15% d'opacité** (avec texte sombre et bordure colorée pleine).
- **Au Hover (survol)**, la bordure générale de la carte (normalement grise et très discrète) prend la couleur d'univers correspondante à 100%. Cela crée une interaction très épurée et efficace.

*À valider : Est-ce que ce niveau de sobriété convient, ou Didier souhaite-t-il plus de présence colorée sur les cartes ?*

### 2. Dégradés de fond d'ambiance sur les pages intérieures
Pour différencier les univers sur les pages détaillées (ex: page DJ, page Jukbike) tout en restant minimaliste :
- Nous proposons d'ajouter un dégradé vertical très léger en haut de page dans le hero (la couleur de l'univers à **10% d'opacité** s'estompant vers la couleur de fond générale). Cela colore subtilement l'ambiance sans alourdir le texte.

---

## Prochaine étape pour Cursor
Une fois ce handoff lu et validé par Didier/Cursor :
1. Cursor doit exécuter le **Prompt 0** de `_agents/conception-site/cursor-prompts.md`.
2. Il doit traduire ces tokens en variables CSS dans le bloc `:root` de `assets/css/custom.css`.
