# Architecture — artn0art

## Stack principal
- **Hugo** (static site generator)
- **Thème Blowfish** (moderne, léger, optimisé SEO)
- **Decap CMS** (headless CMS, content editing via GUI)
- **Git** (versioning)

## Hébergement & Domaine
- **Domain** : artn0art.com (OVH, DNS à configurer)
- **Cible déploiement** : Netlify ou Cloudflare Pages
- **CI/CD** : Git push → build automatique → publish

## Structure contenu
- `content/` : pages Markdown
  - `_index.md` : hub/accueil
  - `dj.md` : bio DJ + photo
  - `projets/` : portfolio projets (disco vélo, reactable, etc.)
  - `contact.md` : formulaire/contact
  - `cv.md` : CV détaillé

## Style & Assets
- `assets/css/custom.css` : override Blowfish
  - Couleur base : gris #ebebeb
  - Cartes projets : couleurs par projet
- `static/` : images, assets
- Favicon + OG images

## Données
- Configuration : `config.toml` (Hugo)
- CMS config : `admin/config.yml` (Decap)
- Pas de BDD (contenu statique)

## Workflow Git
- `.git/` initialisé localement
- À pousser sur GitHub (HTTPS ou SSH)
- Branch `main` = production
