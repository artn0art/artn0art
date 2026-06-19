# MEMORY — artn0art

## S140-audit (2026-05-11)

- `_docs/architecture.md` et `_docs/etat.md` alignés sur `hugo.toml` et `content/**/_index.md`.
- Build local : `hugo build` (Hugo ≥ 0.155) avant tout déploiement ; `static/` encore vide (favicon / OG à ajouter).

## S143-reorganisation (2026-06-17)

- Hugo v0.163.2 installé localement via Homebrew, build OK.
- Page d'accueil et liste de projets réorganisées pour isoler les profils principaux (DJ, Jukbike) des profils secondaires d'arrière-plan (Producteur, Bricodeur, Massage & Sonothérapie).
- Intégration de 5 images premium personnalisées dans `static/images/`.
- Ajout du layout `layouts/partials/home/custom.html` pour contourner le layout par défaut du thème Blowfish et afficher notre index personnalisé.
- Création de la configuration Decap CMS dans `static/admin/`.
