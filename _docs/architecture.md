# Architecture — artn0art

## Stack

| Couche | Techno |
|--------|--------|
| Générateur | Hugo extended **0.163.2** |
| Thème | Blowfish v2.100.0 (`themes/blowfish/` submodule) |
| Config | `hugo.toml` |
| CMS | Sveltia CMS — `static/admin/` (config Decap `config.yml`) |
| CI/CD | `.github/workflows/deploy-pages.yml` |
| Hébergement | **GitHub Pages** |
| Domaine | artn0art.com — `static/CNAME`, DNS OVH → GitHub |

## Flux de publication

```
content/*.md + data/profils.yaml
        ↓
  hugo --gc --minify --baseURL https://artn0art.com/
        ↓
      public/  (gitignored)
        ↓
  GitHub Actions (push main)
        ↓
   artn0art.com
```

## Structure contenu

```
content/
├── _index.md              # Hub
├── dj/_index.md           # Live
├── projets/
│   ├── jukbike/index.md   # Live
│   └── …/index.md         # draft (ateliers, producteur, …)
├── contact/_index.md
├── mentions-legales/_index.md
└── confidentialite/_index.md
```

## Layouts custom (`layouts/`)

Overrides Blowfish : `head.html`, `extend-head.html`, `home/custom.html`, `projets/single.html`, shortcodes `modules`, `sections`, etc.

## Données

- Pas de BDD — Markdown + YAML front matter
- `data/profils.yaml` — profils home (featured / pending)
- Source unique : **ne pas dupliquer** dans `_data/data/`

## CMS

- UI : `/admin/` (Sveltia)
- Édition alternative : fichiers `.md` sur GitHub.com
- OAuth GitHub : **à finaliser** — `_docs/cms-setup.md`

## Hébergement dormant

- `deploy-ovh.yml` — FTP OVH, trigger manuel only
- `netlify.toml`, `cloudcannon.config.yml` — configs legacy, non utilisées

## Risque technique

Blowfish `max Hugo = 0.157.0` vs CI **0.163.2** — warning build ; mettre à jour submodule ou pinner Hugo.
