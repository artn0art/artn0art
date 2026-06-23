# État — artn0art

> MAJ 2026-06-23

## v0.3.1 — Cohérence visuelle (2026-06-23)

- **Layout** : `main { width: 100% }` — cartes pleine largeur (64rem) au lieu de ~350px.
- **Couleurs** : DJ vert `#275528`, Jukbike `#c9a227`, Crieur rouge `#c0392b`, accents par module.
- **Home** : accroche « DJ · Jukbike », réseaux dans l'intro, bouton Languages retiré (FR seul).
- **Jukbike** : icône Jukbox corrigée, classes module pour teintes distinctes.

## v0.3 — Home DJ/Jukbike + page Jukbike modules (en cours de déploiement)

**Statut** : build local **100 % vert** ; gros lot de changements **commité** ; site **pas encore en ligne** (`artn0art.com` — DNS / FTP OVH à finaliser).

### Build (référence)

```bash
cd "/Users/artnoart/Code/_projets/artn0art"
hugo --gc --minify
```

- Hugo **v0.163.2** (extended)
- **28 pages FR** + 9 EN, **33 fichiers statiques**
- Sortie : `public/` (gitignored)

### Fait (v0.3)

- **Home** : seuls **Jukbike** et **DJ** en `featured` (`data/profils.yaml`) ; ateliers / producteur / bricodeur en `pending`.
- **Jukbike** : 4 modules en accordéons, plaquette PDF (`/documents/jukbike-plaquette-2026.pdf`), badge « Plaquette », CTA Devis compact.
- **DJ** : contenu et layout affinés ; logos header (`logo_dj.webp`, `logo_jukbike.webp`).
- **CSS** : hiérarchie modules / accordéons secondaires, liens réseaux alignés à droite.
- **Layouts** : overrides header (basic, menu desktop/mobile), `author-links`, `statusHref` sur badges.
- **Assets** : favicon, apple-touch-icon, `images/og-image.png` (déjà câblés dans `extend-head.html`).
- **CI** : `.github/workflows/deploy-ovh.yml` (build + FTPS → `./www/`).

### Pages existantes mais hors vitrine active

| Page | Statut |
|------|--------|
| ateliers, producteur, bricodeur | contenu OK, masqués home (`pending`) |
| reactable, a2dd | `draft: true` — non publiées |
| mentions-legales, confidentialite | publiées |

### À faire (Didier / OVH)

1. **Secrets GitHub** : `OVH_FTP_SERVER`, `OVH_FTP_USERNAME`, `OVH_FTP_PASSWORD`.
2. **DNS** : `artn0art.com` → hébergement mutualisé OVH.
3. **Push** `main` après commit → déclenche le workflow deploy.
4. **Decap CMS** : inactif sur OVH statique sans backend auth (édition = Markdown local ou GitHub).

### Prochaine passe contenu

- Tokens couleurs (ex. rouge Crieur) — chantier design prévu.
- Réactiver profils `pending` quand gabarit validé.
- Mettre à jour page a2dd (TCON v5) si publication un jour.
