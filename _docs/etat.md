# État — artn0art

> MAJ 2026-06-30

## v0.3.2 — Déploiement de artn0art.com (2026-06-30)

- **Déploiement** : Le site est hébergé avec succès sur **Netlify** et le nom de domaine `artn0art.com` pointe correctement vers la production en HTTPS.
- **Ressources** : Le build est généré par Netlify à partir de la branche `main` (build vert).

## v0.3.1 — Cohérence visuelle (2026-06-23)

- **Layout** : `main { width: 100% }` — cartes pleine largeur (64rem) au lieu de ~350px.
- **Couleurs** : DJ vert `#275528`, Jukbike `#c9a227`, Crieur rouge `#c0392b`, accents par module.
- **Home** : accroche « DJ · Jukbike », réseaux dans l'intro, bouton Languages retiré (FR seul).
- **Jukbike** : icône Jukbox corrigée, classes module pour teintes distinctes.

## v0.3 — Home DJ/Jukbike + page Jukbike modules

**Statut** : En ligne sur Netlify (`https://artn0art.com`).

### Build (référence)

```bash
cd "/Users/artnoart/Code/_projets/artn0art"
hugo --gc --minify
```

- Hugo **v0.163.2** (extended)
- **28 pages FR**, **30 fichiers statiques**
- Sortie : `public/` (gitignored)

### Fait (v0.3)

- **Home** : seuls **Jukbike** et **DJ** en `featured` (`data/profils.yaml`) ; ateliers / producteur / bricodeur en `pending`.
- **Jukbike** : 4 modules en accordéons, plaquette PDF (`/documents/jukbike-plaquette-2026.pdf`), badge « Plaquette », CTA Devis compact.
- **DJ** : contenu et layout affinés ; logos header (`logo_dj.webp`, `logo_jukbike.webp`).
- **CSS** : hiérarchie modules / accordéons secondaires, liens réseaux alignés à droite.
- **Layouts** : overrides header (basic, menu desktop/mobile), `author-links`, `statusHref` sur badges.
- **Assets** : favicon, apple-touch-icon, `images/og-image.png` (déjà câblés dans `extend-head.html`).
- **CI/CD** : Déploiement automatique sur Netlify connecté au repo GitHub `artn0art/artn0art`.

### Pages existantes mais hors vitrine active

| Page | Statut |
|------|--------|
| ateliers, producteur, bricodeur | contenu OK, masqués home (`pending`) |
| reactable, a2dd | `draft: true` — non publiées |
| mentions-legales, confidentialite | publiées |

### À faire (Decap CMS)

1. **Decap CMS** : Activer Netlify Identity + Git Gateway sur Netlify pour rendre accessible le back-office `/admin/`.

### Prochaine passe contenu

- Tokens couleurs (ex. rouge Crieur) — chantier design prévu.
- Réactiver profils `pending` quand gabarit validé.
- Mettre à jour page a2dd (TCON v5) si publication un jour.
- Restaurer / finaliser la page `Massage & Sonothérapie` si souhaité.
