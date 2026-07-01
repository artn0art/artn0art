# Audit artn0art — 2 juillet 2026

> Audit complet post-migration GitHub Pages (v1). Réalisé sur le build local Hugo v0.163.2 (28 pages FR) + inspection code, config, contenu, SEO, accessibilité, perf, infra et CMS.
>
> **Périmètre live confirmé par Didier** : seules **Jukbike** et **DJ** sont des pages actives. Le reste (ateliers, producteur, bricodeur, reactable, a2dd) est **WIP**, publié progressivement. La priorisation ci-dessous en tient compte.

## Score global

| Domaine | Note | Commentaire |
|---|---|---|
| Déploiement / infra | 4.5/5 | GitHub Pages OK, CNAME câblé, DNS propagé, HTTPS à confirmer |
| SEO | 3/5 | Titres OK, mais accueil sans description ni H1, robots.txt absent, WIP exposé |
| Accessibilité | 3/5 | Pas de H1 sur accueil et Jukbike, quelques `alt` à vérifier |
| Contenu / qualité rédac | 3.5/5 | Bon ton, mais fautes FR sur la page Jukbike (live) |
| Performance | 4/5 | Images webp légères, CSS minifié ; PDF 1,2 Mo à surveiller |
| CMS (édition texte) | 2/5 | Sveltia présent mais non fonctionnel (OAuth) + Jukbike hors config |
| Hygiène repo / code | 4/5 | Propre ; déprécations Hugo à traiter |

---

## P0 — À corriger en priorité (impacte les pages live ou le référencement)

### P0.1 — Pages WIP exposées à Google
`ateliers`, `bricodeur`, `producteur` sont **construites et présentes dans le `sitemap.xml`** → indexables par les moteurs alors qu'elles ne sont pas prêtes. (`reactable` et `a2dd` sont bien en `draft: true`, donc exclues ✓.)
**Correctif** : soit passer ces 3 pages en `draft: true` (recommandé tant qu'elles ne sont pas prêtes), soit ajouter `_build: { list: never, render: link }` / exclure du sitemap. Elles restent accessibles pour toi en preview locale.

### P0.2 — Fautes de français sur la page Jukbike (live)
Module **Crieur** : « annonce le programme **a** venir » → « à venir » ; « **a** l'aide d'une boîte à criées » → « à l'aide » ; « vide grenier » → « vide-grenier ».
Module **Karaoké** : « paroles sur écran et **un micros** » → « un micro » ; « dès le **couche** du soleil » → « dès le **coucher** du soleil » ; double espace « internationale␣␣et␣␣française ».
**Correctif** : corrections directes dans `content/projets/jukbike/index.md`.

### P0.3 — Aucun H1 sur l'accueil ni sur Jukbike
La home et la page Jukbike n'émettent **aucun `<h1>`** (elles utilisent des `h2`/`h3`). Mauvais pour le SEO et l'accessibilité (structure de titres).
**Correctif** : ajouter un H1 (visuellement discret si besoin, ex. classe `sr-only`) — « artn0art — DJ & créatif » sur l'accueil, « Jukbike » sur la page Jukbike.

### P0.4 — Pas de meta description sur l'accueil
`content/_index.md` ne contient qu'un `title`. La page la plus importante n'a **pas de description** (moins bon partage/SEO).
**Correctif** : ajouter un champ `description:` à l'accueil (≤ 155 caractères).

---

## P1 — Important (à traiter après les P0)

### P1.1 — CMS non fonctionnel + Jukbike absent de la config
Voir la section **« Volet CMS »** ci-dessous. En l'état, `/admin/` ne s'authentifie pas (OAuth GitHub à configurer) et la page **Jukbike n'est pas dans `static/admin/config.yml`** (seules Accueil, DJ, Contact + les cartes profils sont éditables).

### P1.2 — robots.txt absent
Aucun `robots.txt` généré. Recommandé d'en avoir un qui pointe vers le sitemap.
**Correctif** : `enableRobotsTXT = true` dans `hugo.toml` (Blowfish génère alors un robots.txt propre).

### P1.3 — Déprécations Hugo (bruit de build, cassera à terme)
- `hugo.toml` : `languageCode` → `locale`, `languageName` → `label` (déprécié depuis 0.158).
- Un partial utilise `.Site.Data` (→ `hugo.Data`) et `.Site.LanguageCode` (→ `.Site.Language.Locale`).
- Warning « Module blowfish is not compatible with this Hugo version » : le thème déclare 0.141/0.157, on build en 0.163. Sans impact aujourd'hui, mais à surveiller lors des mises à jour du thème.
**Correctif** : mettre à jour les clés de config + le partial concerné.

### P1.4 — Attributs `alt` à vérifier
12 images, dont 4 avec `alt` vide. Les **icônes de modules** (`alt=""`) sont décoratives → correct. Mais vérifier que les **logos des cartes d'accueil** (Jukbike, DJ) ont un `alt` descriptif (ex. « Logo Jukbike ») plutôt que vide, pour le SEO image et les lecteurs d'écran.

---

## P2 — Confort / hygiène (non bloquant)

- **Cohérence des emblèmes** : le sous-titre de `jukbox.webp` est en minuscules (« vélo disco mobile ») alors que les 3 autres sont en Capitales De Chaque Mot. À harmoniser si tu veux (nécessite le fichier source vectoriel pour un rendu propre).
- **Plaquette PDF** 1,2 Mo (`static/documents/`) : acceptable, mais compressible (~2-3× plus léger) si tu vises la vitesse mobile.
- **Fichiers en clutter local** (non trackés, sans impact prod) : `jukbike-plaquette-2026-editable.pptx` (989 Ko) et `.DS_Store` traînent dans le dossier — bien exclus de git ✓, mais tu peux les ranger.
- **`netlify.toml`** conservé mais inerte (décision assumée) — OK.
- **HTTPS** : vérifier que « Enforce HTTPS » est bien coché dans Settings → Pages une fois le certificat émis.

---

## Ce qui va bien ✓

- Déploiement GitHub Pages opérationnel, domaine custom `artn0art.com` câblé (CNAME + DNS OVH pointés, email préservé).
- Titres de pages soignés et cohérents (`Jukbike — Vélo disco mobile · artn0art`).
- Meta descriptions présentes sur DJ, Projets, Jukbike, Contact, mentions.
- Balises canonical + og:image sur toutes les pages, favicon/OG câblés.
- Images en **webp** légères (max 130 Ko), CSS bundle minifié, lazy-loading des icônes.
- Menu contextuel Devis/Booking propre, pages légales (mentions + confidentialité) présentes.
- Repo propre : `.DS_Store`, `.pptx`, `_inbox` bien gitignorés ; sous-module thème OK.

---

## Volet CMS — « Sveltia/Decap me permet-il de changer du texte facilement ? »

**Ce que tu as déjà** : **Sveltia CMS** (`static/admin/`) — un fork moderne, rapide et maintenu de **Decap CMS** (ex-Netlify CMS). Même format de config (`config.yml`), meilleure perf. C'est le bon choix : pas besoin de revenir à Decap.

**Réponse courte** : oui, **c'est exactement fait pour ça** — une interface `/admin/` où tu édites le texte des pages (éditeur markdown visuel) et ça committe tout seul sur GitHub, qui redéploie. **Mais ce n'est pas encore utilisable en l'état**, pour 2 raisons :

1. **Authentification à configurer.** Depuis l'abandon de Netlify (qui fournissait le login), Sveltia a besoin d'une **OAuth GitHub** pour écrire dans le repo. Concrètement : créer une *GitHub OAuth App* + un petit relais d'auth (un worker Cloudflare gratuit, ou le service d'auth de Sveltia). Tant que ce n'est pas fait, `/admin/` ne se connecte pas.
2. **Couverture incomplète.** La config actuelle rend éditables l'**Accueil**, la page **DJ**, la page **Contact** et les **cartes profils**. La page **Jukbike** (la plus riche, avec les 4 modules) **n'y est pas** — et comme elle contient du HTML brut (accordéons), l'éditer dans un éditeur markdown reste peu confortable.

### Alternatives, de la plus simple à la plus complète

1. **Éditer directement sur GitHub.com (zéro setup, dispo tout de suite).** Sur le repo, ouvre le fichier `.md`, clique le crayon ✏️, modifie, « Commit » → le site se redéploie. Gratuit, immédiat, aucun risque. Inconvénient : tu vois le markdown/HTML, pas un rendu visuel.
2. **Finir Sveltia (recommandé si tu veux une vraie interface).** Configurer l'OAuth GitHub + ajouter **toutes les pages** (dont Jukbike) à `config.yml`. Résultat : back-office propre, gratuit, git-based. ~1 h de setup.
3. **Pages CMS (pagescms.org).** Très simple, pensé pour non-devs, login GitHub via leur app hébergée (peu de setup), UI agréable. Bonne alternative si Sveltia te rebute.
4. **TinaCMS.** Édition **visuelle en direct** (tu cliques sur le texte de la page et tu le modifies en live). UX supérieure, mais setup plus lourd et offre cloud pour l'auth.
5. **Keystatic.** Moderne, git-based, très bon confort, mais orienté dev pour l'installation.

**Ma reco pragmatique** : pour éditer du texte *tout de suite* sans rien installer → **option 1 (GitHub.com)**. Pour un vrai back-office durable → **finir Sveltia (option 2)** en y ajoutant la page Jukbike ; si le setup OAuth te bloque, **Pages CMS (option 3)** est le plan B le plus simple.

---

## Plan d'action suggéré (ordre)

1. **P0.1** passer ateliers/bricodeur/producteur en `draft` (stoppe l'exposition Google).
2. **P0.2** corriger les fautes FR de la page Jukbike.
3. **P0.3 + P0.4** ajouter H1 + description sur l'accueil, H1 sur Jukbike.
4. **P1.2 + P1.3** activer `robots.txt`, corriger les déprécations Hugo.
5. **P1.1** décider de la voie CMS (finir Sveltia vs GitHub.com vs Pages CMS) et l'implémenter.
6. **P1.4 / P2** alt des logos, harmonisation emblèmes, compression PDF (optionnel).
