# Livraison Chantier MAO — artn0art
*Date : 10 octobre 2026 — Antigravity*

---

## 🎯 Ce qui a été demandé

1. **Accueil artn0art (`/`)** :
   - Intégration du **3ème carré « MAO »** aux côtés de Jukbike et DJ.
   - Nouveau logo studio épuré, centré, trait vert `#335f33` sur fond crème `#f8f7f3`.
   - Bouton d'action directe : `Bio formateur` menant vers `/mao/#bio`.
   - Accroche sobre ≤ 90 car : *« Formation Ableton Live : downtempo, house organique et immersion sonore. »* (77 car).
   - Épure totale : aucun tag de surface, accès aux sous-genres reporté à l'intérieur.

2. **Couche intérieure (`/mao/`)** :
   - **Photo/logo de Didier** en tête avec accès direct à sa bio et ses certifications.
   - **2 onglets interactifs** pour entrer dans chaque univers musical :
     - **Onglet 1 : Downtempo & Trip-Hop** (programme complet des 6 modules de formation, méthode *Déconstruire ➔ Reconstruire ➔ Transformer*, stems Live 12, Dub atmosphérique).
     - **Onglet 2 : House Organique & World Electro** (pulsation 108–122 BPM, polyrythmies & percussions acoustiques du monde, instruments traditionnels).
   - **Accordéons secondaires (style fors.fm)** :
     - Bio détaillée avec certifications (*SawUp 2025*, *Stereolux Nantes*, *IRPA Lyon*, *Le Jardin Moderne*).
     - Formules de cours et coaching (Initiation, Perfectionnement, Coaching de projet, Atelier Sound Design, Formation intensive).
     - Compétences techniques (Ableton Live 12 Suite, Push 3, Move, Max for Live).
   - **Aucun player audio / SoundCloud** (exclu explicitement comme non prioritaire pour préserver l'épure).

---

## 📦 Fichiers créés et modifiés

| Fichier | Nature | Description |
|---|---|---|
| [`data/profils.yaml`](file:///Users/artnoart/Code/_projets/artn0art/data/profils.yaml) | Modifié | Entrée `id: mao` dans `featured` (titre masqué, image `logo_mao.webp`, tag `Bio formateur` vers `/mao/#bio`, description 77 car). |
| [`static/images/logo_mao.webp`](file:///Users/artnoart/Code/_projets/artn0art/static/images/logo_mao.webp) | Créé | Contrôleur studio épuré, cadré 1:1, vert studio `#335f33` sur fond `#f8f7f3`, onde sonore dans le cadran. |
| [`static/images/formateur_didier.webp`](file:///Users/artnoart/Code/_projets/artn0art/static/images/formateur_didier.webp) | Créé | Portrait studio de Didier extrait et recadré en 512x512 pour la carte formateur et la bio. |
| [`layouts/mao/list.html`](file:///Users/artnoart/Code/_projets/artn0art/layouts/mao/list.html) | Créé | Gabarit Hugo dédié à l'univers MAO (`projet-fiche`, univers hero avec logo, article body, meta et CTA). |
| [`content/mao/_index.md`](file:///Users/artnoart/Code/_projets/artn0art/content/mao/_index.md) | Modifié | Contenu complet : carte formateur, citation directrice, 2 onglets interactifs avec les modules détaillés, accordéons bio/cours/compétences, script de navigation fluide. |
| [`assets/css/custom.css`](file:///Users/artnoart/Code/_projets/artn0art/assets/css/custom.css) | Modifié | Variables `--u-mao`, règles `#projet-mao`, styles `.formateur-card` et système d'onglets `.mao-tabs`. |
| [`_projets/artn0art/_docs/apercu-home-3-carres.html`](file:///Users/artnoart/Code/_projets/artn0art/_docs/apercu-home-3-carres.html) | Créé | Maquette autonome de la home avec les 3 carrés (images Base64). |
| [`_projets/artn0art/_docs/apercu-page-interieure-mao.html`](file:///Users/artnoart/Code/_projets/artn0art/_docs/apercu-page-interieure-mao.html) | Créé | Maquette autonome de la page intérieure `/mao/` (images Base64, testable hors Hugo). |

---

## 🌐 Liens de vérification en direct

Le serveur Hugo tourne actuellement sur le port 1313 :
- **Accueil (3 carrés)** : [http://localhost:1313/](http://localhost:1313/)
- **Page intérieure MAO** : [http://localhost:1313/mao/](http://localhost:1313/mao/)
- **Accès direct bio formateur** : [http://localhost:1313/mao/#bio](http://localhost:1313/mao/#bio)
- **Accès direct univers House Organique** : [http://localhost:1313/mao/#house-organique](http://localhost:1313/mao/#house-organique)
- **Aperçu statique autonome home** : [file:///Users/artnoart/Code/_projets/artn0art/_docs/apercu-home-3-carres.html](file:///Users/artnoart/Code/_projets/artn0art/_docs/apercu-home-3-carres.html)
- **Aperçu statique autonome intérieure** : [file:///Users/artnoart/Code/_projets/artn0art/_docs/apercu-page-interieure-mao.html](file:///Users/artnoart/Code/_projets/artn0art/_docs/apercu-page-interieure-mao.html)
