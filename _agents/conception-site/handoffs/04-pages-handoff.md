# Handoff Conception — Phase 4 : Mise en Page (DJ, Contact & Secondaires)

## Contexte
Cette phase définit les spécifications de mise en page pour toutes les pages intérieures restantes du site **artn0art** (vitrine DJ, page Contact minimaliste, et les 5 pages/sous-pages de projets secondaires).

## Fichiers de spécification produits
La spécification complète est disponible dans [_agents/conception-site/design/04-pages.md](file:///Users/artnoart/Code/_projets/artn0art/_agents/conception-site/design/04-pages.md).

Elle détaille pour chaque page :
1. **L'ordre précis des blocs** (fil d'Ariane, hero, images, prose, blocs techniques/lecteurs, CTA).
2. **Ce qui change par rapport au gabarit générique** (styles, intégrations, couleurs d'univers).
3. **Le wireframe ASCII dédié** modélisant l'agencement responsive (desktop/mobile).

### Résumé des particularités par page :
- **DJ (`content/dj/_index.md`)** : Utilise l'accent violet (`--u-dj`). Intègre le lecteur SoundCloud compact au cœur de la page avec un CTA de booking structuré.
- **Contact (`content/contact/_index.md`)** : Sobriété absolue. Pas de couleur d'univers ni d'image principale. Grille en deux colonnes (Direct / Réseaux) s'empilant sur mobile.
- **Producteur (`content/projets/producteur/index.md`)** : Accent rose (`--u-musique`), CTA orienté collaborations (sans tarif).
- **Bricodeur (`content/projets/bricodeur/index.md`)** : Accent vert (`--u-reactable`). Sert de page hub en incluant des liens de redirection internes mis en valeur vers ses sous-pages.
- **Massage & Sonothérapie (`content/projets/massage-sonotherapie/index.md`)** : Accent bleu clair (`--u-a2dd`). Aère verticalement la liste des 6 intentions sonores.
- **Reactable (`content/projets/reactable/index.md`)** : Sous-page de Bricodeur. Fil d'Ariane à double niveau, diagramme technique en bloc de code mono, roadmap des 3 sprints mise en valeur.
- **a2dd (`content/projets/a2dd/index.md`)** : Sous-page de Bricodeur. Fil d'Ariane à double niveau, pipeline technique à 11 étapes présenté de manière compacte.

---

## Prochaine étape pour Cursor
Dès que Didier valide cette phase de design :
1. Cursor doit exécuter le **Prompt 4** de `_agents/conception-site/cursor-prompts.md`.
2. Il implémentera les variations de template et les ajustements de front-matter pour aligner toutes les pages du site.
