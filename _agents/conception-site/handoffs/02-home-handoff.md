# Handoff Conception — Phase 2 : Home en Grille de Cartes

## Contexte
Spécification de la restructuration de la page d'accueil (Hub) pour passer d'une liste de lignes à une **grille de cartes à deux colonnes** avec image dominante, calquée sur le site de référence **fors.fm/devices** (Phase 2 du plan de conception).

## Fichiers de spécification produits
La spec complète a été écrite dans [_agents/conception-site/design/02-home.md](file:///Users/artnoart/Code/_projets/artn0art/_agents/conception-site/design/02-home.md).

Elle définit :
1. **La structure de grille** : Largeur maximale portée à `64rem` pour aérer le design, disposition en `display: grid; grid-template-columns: repeat(2, 1fr); gap: 1.5rem;` basculant en 1 colonne sous `680px`.
2. **L'agencement des cartes** : L'image prend le dessus (pleine largeur, ratio 4:3), et le contenu textuel passe en dessous avec une marge interne uniforme (`--space-4`/`--space-5`).
3. **Le comportement au survol (Hover)** : Éclaircissement du fond (`#f3f3f3`), translation vers le haut (-2px), ombre portée légère, zoom de l'image (scale 1.02) et activation de la bordure dans la couleur d'univers du projet.
4. **La hiérarchie des sections** : Accroche introductive d'en-tête, section 1 ("En scène" pour DJ et Jukbike) et section 2 ("Autres facettes" pour Producteur, Bricodeur, et Massage & Sonothérapie).
5. **Les wireframes ASCII** (desktop et mobile).
6. **Le tableau des écarts** entre la version actuelle (liste) et la version cible (grille).

---

## Prochaine étape pour Cursor
Dès que cette phase de spécification est validée :
1. Cursor doit exécuter le **Prompt 2** de `_agents/conception-site/cursor-prompts.md`.
2. Il modifiera `custom.css` pour définir la grille et l'agencement des cartes, et adaptera `layouts/partials/projet-device.html` pour passer l'image en haut de la carte.
