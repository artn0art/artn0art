# Architecture — artn0art

## Stack principal
- **Hugo** (générateur statique)
- **Thème Blowfish** (sous-module Git)
- **Git** (versionnement local ; déploiement à configurer)

## Hébergement et domaine
- **Domaine** : artn0art.com (OVH)
- **Cible** : Netlify ou Cloudflare Pages (workflow racine à ajouter si besoin)
- **Decap CMS** : non branché (pas de `admin/config.yml` à la racine)

## Structure contenu (réel)
- `hugo.toml` — configuration Hugo (pas `config.toml`)
- `content/` — pages en dossiers avec `_index.md` :
  - `_index.md` — accueil / hub
  - `dj/_index.md` — bio DJ
  - `projets/_index.md` et sous-pages (`dd-a2dd`, `jukbike`, `reactable`, …)
  - `contact/_index.md`
- `static/` — assets statiques (favicon, OG : à compléter)
- `themes/blowfish/` — thème + `exampleSite` (ne pas confondre avec le contenu du site)

## Données
- Pas de base de données ; contenu Markdown + front matter YAML.

## Workflow Git
- Dépôt Git local ; pousser vers remote et CI selon choix d’hébergement.
