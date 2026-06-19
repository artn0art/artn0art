# État — artn0art

## v0.2 — Contenu complété et build validé (S143, 2026-06-17)

**Statut** : Contenu et images en place, build local 100% vert, prêt pour le déploiement public et la configuration de l'hébergement.

### Fait
- **Validation du build** : Hugo (v0.163.2) installé et configuré. La commande `hugo` génère le site proprement en local (20 pages, 14 fichiers statiques).
- **Refonte Page d'Accueil & Profils** : 
  - Réorganisation selon la vision d'Arnaud : profils principaux (DJ, Jukbike) et profils secondaires en arrière-plan (Producteur, Bricodeur, Massage & Sonothérapie).
  - Création du layout de secours `layouts/partials/home/custom.html` pour forcer le rendu de notre page d'accueil personnalisée.
- **Rédaction & Contenu** : 
  - Retrait de tous les `TODO` visibles.
  - Rédaction complète de la bio DJ (Double culture musicien-DJ, styles caribéens, house, techno, dub) et intégration SoundCloud.
  - Rédaction complète de la page Jukbike (Specs, tarifs pro SIRET, et description des 4 briques d'animation : Jukbox, Open Mic, Crieur de rue, Karaoké) basée sur la base de connaissances `dd-jukbike`.
  - Création et rédaction des fiches pour les profils secondaires : Producteur (compositions studio, Ableton, Push), Bricodeur (Reactable, assistant de tri a2dd, Arduino/NFC) et Massage & Sonothérapie (soins, acupression BPA, bains sonores).
- **Visuels originaux** : Génération de 5 images artistiques premium par IA (enregistrées dans `static/images/`) pour illustrer chaque univers de façon cohérente.
- **Panneau Admin (Decap CMS)** : Création de `static/admin/index.html` et `static/admin/config.yml` avec collections paramétrées pour l'édition en ligne.

### À faire
- **Favicon & OG Share** : Ajouter un favicon personnalisé et une image de partage réseaux sociaux dans `static/`.
- **Déploiement en ligne** : Brancher le dépôt GitHub (actuellement sur `https://github.com/artn0art/artn0art.git`) sur Netlify ou Cloudflare Pages pour automatiser les déploiements à chaque commit.
- **Domaine DNS** : Connecter le domaine `artn0art.com` (acheté chez OVH) sur l'instance Netlify/Pages.
