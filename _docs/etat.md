# État — artn0art

> MAJ **2026-07-09** (audit Cursor + push GitHub Pages)

## v0.3.3 — Perf + audit (2026-07-09)

- **Déploiement** : GitHub Pages via workflow `.github/workflows/deploy.yml` (branche `main`).
- **Domaine** : `artn0art.com` → GitHub Pages (OVH DNS).
- **Build** : Hugo extended, thème Blowfish — **20 pages FR** (`hugo --minify`).
- **Perf** : head override, fonts allégées, zoom désactivé, Shrikhand scope Jukbike, max 2 photos/module.
- **CMS** : Sveltia (`/admin/`) — champ `photos` modules ajouté ; OAuth GitHub **à finaliser** (@Didier).
- **Live** : DJ + Jukbike en vitrine ; autres profils en `pending` ou `draft`.

### Build (référence)

```bash
cd "/Users/artnoart/Code/_projets/artn0art"
hugo --gc --minify
```

### Pages live

| Page | Statut |
|------|--------|
| Home, DJ, Jukbike | ✅ publiées |
| ateliers, producteur, bricodeur | contenu OK, masqués home |
| mentions-legales, confidentialite | publiées — champs `[À COMPLÉTER]` restants |
| reactable, a2dd | `draft: true` |

### À faire

1. Compléter mentions légales / RGPD (nom, adresse — @Didier)
2. OAuth Sveltia CMS
3. Photos galerie DJ + modules Jukbike restants
4. Vérifier Lighthouse mobile post-deploy

### Backlog agents

→ `_agents/TABLEAU.md` · Audit : `_archives/audits/AUDIT-artn0art-2026-07-09.md`

---

## Historique

### v0.3.2 — Déploiement (2026-06-30)

Site en ligne, domaine HTTPS OK.

### v0.3.1 — Cohérence visuelle (2026-06-23)

Layout pleine largeur, couleurs par module, home DJ/Jukbike.
