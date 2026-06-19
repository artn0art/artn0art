# Runbook de déploiement — artn0art.com

> Site Hugo + Blowfish. Objectif : mettre le site en ligne sur Netlify depuis le dépôt
> GitHub, brancher le domaine `artn0art.com` (OVH), activer HTTPS et l'authentification
> Decap CMS.
>
> **Légende** :
> - 🧑 **Action Arnaud** : étape manuelle nécessitant un compte ou des identifiants (OVH, Netlify, GitHub). À faire toi-même, je ne peux pas la réaliser à ta place.
> - 💻 commande à lancer dans un terminal sur ta machine.
>
> Versions de référence : Hugo **0.163.2**, thème Blowfish (submodule git), Decap CMS 3.x.

---

## a) Pré-requis

### a.1 — Dépôt GitHub à jour

Le dépôt distant est `https://github.com/artn0art/artn0art` (branche `main`).

1. 🧑 Le working tree local est actuellement « sale » (fichiers modifiés + untracked). Avant tout déploiement, commiter et pousser. Voir le plan détaillé dans **`_docs/plan-commit-git.md`**.
2. Vérifier que tout est poussé :
   - 💻 `git status` doit afficher « working tree clean ».
   - 💻 `git log origin/main..HEAD` ne doit **rien** renvoyer (local = distant).

### a.2 — Submodule Blowfish présent

Le thème est un submodule git. Netlify clone le submodule automatiquement **si** le `.gitmodules` est correct.

- 💻 Vérifier en local : `git submodule status` (le thème `themes/blowfish` doit apparaître avec un hash commité).
- 🧑 Si le submodule n'est pas poussé, le déploiement Netlify échouera au build (`theme "blowfish" not found`).

### a.3 — Build Hugo vert localement

1. 💻 Nettoyer puis builder avec les options de production :
   ```bash
   hugo --gc --minify
   ```
2. Le build doit se terminer **sans erreur**. État de référence connu : **20 pages, 14 fichiers statiques**.
3. La sortie est générée dans `public/` (ne pas la commiter, elle est régénérée par Netlify).

> Si le build casse en local, il cassera aussi sur Netlify. Toujours valider en local d'abord.

---

## b) Déploiement Netlify depuis le dépôt GitHub

### b.1 — Connexion et import

1. 🧑 Se connecter sur https://app.netlify.com (créer un compte si besoin, idéalement avec l'email dédié `artn0art@proton.me`).
2. 🧑 **Add new site** → **Import an existing project** → **Deploy with GitHub**.
3. 🧑 Autoriser Netlify à accéder à GitHub, puis sélectionner le dépôt **`artn0art/artn0art`**.

### b.2 — Réglages de build

Renseigner exactement :

| Champ | Valeur |
|---|---|
| **Branch to deploy** | `main` |
| **Build command** | `hugo --gc --minify` |
| **Publish directory** | `public` |

### b.3 — Variable d'environnement Hugo

⚠️ **Indispensable** : sans cette variable, Netlify utilise une vieille version de Hugo et le build échoue.

1. 🧑 Dans **Site configuration → Build & deploy → Environment → Environment variables** (ou directement à l'écran d'import, section « Advanced »), ajouter :

   | Key | Value |
   |---|---|
   | `HUGO_VERSION` | `0.163.2` |

2. 🧑 Lancer **Deploy site**.

> **Alternative (recommandée pour fiabiliser)** : committer un fichier `netlify.toml` à la racine du dépôt avec ces réglages, plutôt que de les saisir dans l'UI. Exemple :
> ```toml
> [build]
>   command = "hugo --gc --minify"
>   publish = "public"
> [build.environment]
>   HUGO_VERSION = "0.163.2"
> ```
> (Ce fichier n'existe pas encore dans le dépôt — à créer si tu veux figer la config dans le code. Hors périmètre de ce runbook, qui n'écrit que dans `_docs/`.)

### b.4 — Vérification du premier build

1. 🧑 Suivre le log de déploiement dans l'onglet **Deploys**. Attendre l'état **Published**.
2. 🧑 Ouvrir l'URL temporaire fournie par Netlify (`https://<nom-aléatoire>.netlify.app`) et vérifier que le site s'affiche.
3. Chaque `git push` sur `main` redéclenchera automatiquement un déploiement.

### b.5 — Alternative Cloudflare Pages (en bref)

Si tu préfères Cloudflare Pages plutôt que Netlify :

1. 🧑 https://dash.cloudflare.com → **Workers & Pages → Create → Pages → Connect to Git** → dépôt `artn0art/artn0art`.
2. Framework preset : **Hugo**. Build command : `hugo --gc --minify`. Output directory : `public`.
3. 🧑 Variable d'environnement : `HUGO_VERSION = 0.163.2`.
4. Domaine et SSL se gèrent dans l'onglet **Custom domains** du projet Pages.
5. ⚠️ Decap CMS : Cloudflare Pages **n'a pas** d'équivalent direct à Netlify Identity + Git Gateway. Avec Cloudflare, prévoir l'authentification Decap via **GitHub OAuth** (voir section d, note). Si l'usage prioritaire est le back-office Decap clé-en-main, **Netlify reste le choix le plus simple**.

---

## c) Branchement du domaine `artn0art.com` (acheté chez OVH)

Objectif : faire pointer `artn0art.com` (et `www.artn0art.com`) vers le site Netlify, avec HTTPS.

### c.1 — Déclarer le domaine côté Netlify

1. 🧑 Dans Netlify : **Site configuration → Domain management → Add a domain** → saisir `artn0art.com`.
2. 🧑 Ajouter aussi la variante **`www.artn0art.com`** (Netlify proposera de définir un domaine primaire ; choisir `artn0art.com` apex comme primaire et rediriger `www` vers l'apex, ou l'inverse — au choix).
3. Netlify affiche alors les **valeurs DNS** à créer. Les noter.

### c.2 — Créer les enregistrements DNS chez OVH

🧑 Connexion sur https://www.ovh.com/manager → **Web Cloud → Noms de domaine → artn0art.com → Zone DNS**.

Deux cas selon comment tu gères la zone :

**Cas standard (la zone DNS reste chez OVH) — recommandé :**

| Type | Nom / Sous-domaine | Cible | Note |
|---|---|---|---|
| **A** | `@` (apex `artn0art.com`) | `75.2.60.5` | IP load-balancer Netlify (vérifier la valeur exacte affichée par Netlify, elle peut évoluer) |
| **CNAME** | `www` | `<ton-site>.netlify.app.` | Pointer `www` vers le sous-domaine Netlify du site |

> Le domaine apex (`@`) ne peut pas être un CNAME (limitation DNS). Netlify fournit donc une **adresse A** pour l'apex. Si OVH propose un type **ALIAS / ANAME**, tu peux l'utiliser à la place du A pour pointer l'apex directement sur `<ton-site>.netlify.app` — sinon, garder le **A**.

**Cas « Netlify DNS » (délégation complète) — optionnel :**

Si tu choisis dans Netlify l'option **« Use Netlify DNS »**, Netlify te donne 4 serveurs de noms (`dns1.p0X.nsone.net`, etc.).

| À faire chez OVH | Valeur |
|---|---|
| 🧑 Remplacer les **serveurs DNS** du domaine (section « Serveurs DNS ») | les 4 NS fournis par Netlify |

> Cette option simplifie la gestion (Netlify gère toute la zone) mais déporte le DNS hors d'OVH. Pour un site simple, le **cas standard A + CNAME** suffit.

### c.3 — Propagation et HTTPS / SSL

1. ⏳ La propagation DNS peut prendre de quelques minutes à 24 h.
2. 🧑 Une fois le DNS résolu, Netlify provisionne **automatiquement un certificat Let's Encrypt** : **Domain management → HTTPS → Verify DNS configuration → Provision certificate**.
3. 🧑 Activer **Force HTTPS** (redirection automatique HTTP → HTTPS) une fois le certificat émis.
4. Vérifier : `https://artn0art.com` et `https://www.artn0art.com` répondent en HTTPS sans avertissement.

---

## d) Authentification Decap CMS (back-office `/admin/`)

Le fichier `static/admin/config.yml` utilise déjà `backend: git-gateway` + `branch: main`, et `static/admin/index.html` charge le widget Netlify Identity. Il faut donc activer **Netlify Identity + Git Gateway**.

### d.1 — Activer Netlify Identity

1. 🧑 Netlify : **Site configuration → Identity → Enable Identity**.
2. 🧑 Dans **Identity → Registration**, passer la préférence sur **Invite only** (sinon n'importe qui pourrait s'inscrire et éditer le site).

### d.2 — Activer Git Gateway

1. 🧑 **Identity → Services → Git Gateway → Enable Git Gateway**.
   - Cela autorise Decap à écrire des commits dans le dépôt GitHub au nom de l'utilisateur connecté, sans lui donner d'accès direct à GitHub.

### d.3 — Inviter l'utilisateur

1. 🧑 **Identity → Invite users** → saisir l'email (`artn0art@proton.me`).
2. 🧑 Ouvrir l'email d'invitation reçu, cliquer le lien, **définir un mot de passe**.

### d.4 — Tester l'accès `/admin/`

1. 🧑 Aller sur `https://artn0art.com/admin/`.
2. Se connecter avec l'identifiant invité. Le tableau de bord Decap doit s'ouvrir avec les collections **Pages Fixes** et **Projets & Facettes**.
3. Faire une petite édition de test → **Publish** → vérifier qu'un commit apparaît sur GitHub et qu'un redéploiement Netlify se déclenche.

> **⚠️ Note importante — Netlify Identity est en « sunset ».**
> Netlify a annoncé l'arrêt progressif de Netlify Identity (plus de nouvelles inscriptions à terme, maintenance minimale). Pour un nouveau site, c'est encore fonctionnel aujourd'hui mais **non pérenne**.
>
> **Alternative recommandée à moyen terme : GitHub OAuth.**
> - Remplacer dans `static/admin/config.yml` le backend `git-gateway` par :
>   ```yaml
>   backend:
>     name: github
>     repo: artn0art/artn0art
>     branch: main
>   ```
> - Retirer le `<script>` Netlify Identity de `static/admin/index.html`.
> - Héberger un petit **serveur OAuth** (Decap fournit un exemple déployable en 1 clic sur Netlify Functions / Cloudflare Workers), et déclarer une **GitHub OAuth App** (Settings → Developer settings → OAuth Apps) avec l'URL de callback du serveur OAuth.
> - Avantage : fonctionne aussi bien sur Netlify que sur Cloudflare Pages, et ne dépend pas d'Identity.
> - (Ces modifications touchent `static/admin/` — hors périmètre de ce runbook, à planifier séparément.)

---

## e) Checklist post-déploiement

- [ ] **Site en ligne** : `https://artn0art.com` et `https://www.artn0art.com` répondent en HTTPS (cadenas vert, pas d'avertissement).
- [ ] **Force HTTPS** activé (un appel `http://` redirige bien vers `https://`).
- [ ] **Favicon** : déjà présent dans le dépôt (`static/favicon-32.png`, `static/favicon-512.png`, `static/apple-touch-icon.png`). Vérifier qu'il s'affiche dans l'onglet du navigateur. Si non pris en compte, vérifier les `<link rel="icon">` (gérés via `layouts/partials/extend-head.html`).
- [ ] **OG image (partage réseaux)** : déjà présente (`static/images/og-image.png`). Tester le rendu de partage avec un validateur (ex. l'outil de débogage de partage de LinkedIn ou Facebook) sur l'URL `https://artn0art.com`.
- [ ] **Test mobile** : ouvrir le site sur téléphone (ou outil responsive du navigateur), vérifier la page d'accueil (cartes profils), la lisibilité et la navigation.
- [ ] **Test des pages** : page d'accueil (hub), DJ, Jukbike, les 3 profils secondaires (Producteur, Bricodeur, Massage & Sonothérapie), Contact. Aucun lien mort, images chargées.
- [ ] **Test `/admin/`** : connexion Decap OK, une édition de test se publie et déclenche un redéploiement.
- [ ] **Redéploiement auto** : un `git push` sur `main` relance bien un build Netlify.
- [ ] (Optionnel) Mettre à jour `_docs/etat.md` et `CLAUDE.md` (section « État courant ») pour passer le projet en « déployé ».
