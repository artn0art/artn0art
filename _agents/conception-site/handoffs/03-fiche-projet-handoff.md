# Handoff Conception — Phase 3 : Gabarit Fiche Projet

## Contexte
Spécification du gabarit générique (layout unique de type `single`) pour les fiches projets (Jukbike, Reactable, a2dd, Producteur, Bricodeur, Sonothérapie). Cette étape définit la mise en page uniforme intégrant l'accentuation de couleur d'univers (Phase 3 du plan de conception).

## Fichiers de spécification produits
La spec complète a été écrite dans [_agents/conception-site/design/03-fiche-projet.md](file:///Users/artnoart/Code/_projets/artn0art/_agents/conception-site/design/03-fiche-projet.md).

Elle définit :
1. **La structure de page** : Fil d'Ariane, Hero d'univers avec dégradé subtil de 10% d'opacité, image large 16:9 aux coins arrondis, corps prose (largeur limitée à 75 caractères pour la lisibilité) et bloc d'action final (CTA).
2. **L'application de la couleur d'univers** : Sobriété assurée en appliquant la couleur uniquement sur le dégradé du hero, le badge de statut pointillé, la bordure gauche épaisse du bloc CTA (4px) et les liens/puces au survol.
3. **Le comportement responsive** : Marges et tailles s'adaptant dynamiquement via `clamp()`, empilement propre et adaptation des paddings sur mobile.
4. **Les wireframes ASCII** (desktop et mobile).

---

## Prochaine étape pour Cursor
Dès que cette phase de spécification est validée :
1. Cursor doit exécuter le **Prompt 3** de `_agents/conception-site/cursor-prompts.md`.
2. Il créera ou adaptera le layout de template unique de page projet (ex: `layouts/projets/single.html`) et implémentera les règles de style de la fiche et des couleurs d'univers dans `custom.css`.
