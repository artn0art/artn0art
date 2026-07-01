# Brancher le CMS (Sveltia) — guide de mise en route

Le site utilise **Sveltia CMS** (`static/admin/`, fork moderne de Decap). Il permet d'éditer le texte des pages depuis `artn0art.com/admin/` : les modifs sont committées sur GitHub, qui redéploie automatiquement.

Ce qui est déjà éditable (voir `static/admin/config.yml`) : Accueil, page DJ, page Contact, cartes/profils de l'accueil, **et tous les projets** (dont Jukbike, via la collection « Projets & Facettes »).

Il manque **une seule chose** pour que `/admin/` fonctionne en ligne : l'**authentification GitHub**. Deux voies.

---

## Voie A — Éditer sans CMS (0 setup, dispo tout de suite)

Pour changer un texte immédiatement, sans rien installer :

1. Sur `github.com/artn0art/artn0art`, ouvre le fichier (ex. `content/projets/jukbike/index.md`).
2. Clique le crayon ✏️ (Edit), modifie le texte.
3. Bouton « Commit changes » → le site se redéploie tout seul (~1-2 min).

C'est la manière la plus simple. Inconvénient : tu vois le markdown/HTML, pas un rendu visuel.

---

## Voie B — Activer le back-office Sveltia (`/admin/`)

Sveltia (backend GitHub) a besoin d'une **OAuth App GitHub** + d'un petit **relais d'authentification**. Étapes :

### 1. Déployer le relais d'auth (worker Cloudflare, gratuit)

- Repo officiel : `https://github.com/sveltia/sveltia-cms-auth`
- Déploie-le sur Cloudflare Workers (bouton « Deploy » du repo, ou `wrangler`).
- Note l'URL du worker, ex. `https://sveltia-cms-auth.<toncompte>.workers.dev`.

### 2. Créer l'OAuth App GitHub

GitHub → *Settings* → *Developer settings* → *OAuth Apps* → *New OAuth App* :

- **Application name** : `artn0art CMS`
- **Homepage URL** : `https://artn0art.com`
- **Authorization callback URL** : `https://sveltia-cms-auth.<toncompte>.workers.dev/callback`
- Génère un **Client ID** et un **Client Secret**.

### 3. Renseigner les secrets du worker

Dans les variables d'environnement du worker Cloudflare :

- `GITHUB_CLIENT_ID` = le Client ID
- `GITHUB_CLIENT_SECRET` = le Client Secret
- `ALLOWED_DOMAINS` = `artn0art.com`

### 4. Pointer la config CMS vers le worker

Dans `static/admin/config.yml`, ajouter `base_url` (et `auth_endpoint`) au backend :

```yaml
backend:
  name: github
  repo: artn0art/artn0art
  branch: main
  base_url: https://sveltia-cms-auth.<toncompte>.workers.dev
```

Commit + push.

### 5. Tester

Va sur `https://artn0art.com/admin/` → « Login with GitHub » → tu dois pouvoir éditer et publier.

> Astuce dev local : `local_backend: true` est déjà activé. Avec `npx @sveltia/cms-server` lancé en local + `hugo server`, tu peux éditer via `localhost` sans OAuth.

---

## Voie C — Alternative clé en main : Pages CMS

Si la Voie B te semble lourde, **Pages CMS** (`pagescms.org`) offre une UI simple, login GitHub via leur app hébergée (quasi zéro config serveur). Bon plan B pour éditer sans gérer de worker.

---

**Reco** : pour éditer *maintenant* → Voie A (GitHub.com). Pour un back-office durable → Voie B (Sveltia) ou Voie C (Pages CMS) si tu veux éviter le worker.
