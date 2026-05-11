# Audit artn0art — 2026-05-11 (S140)

> Auditeur : Cursor
> Durée audit : ~40 minutes
> Score global : 2,8/5

## 1. Organisation fichiers/dossiers

- Dépôt ~602 M, ~2273 fichiers : gros volume surtout thème Blowfish + `exampleSite` ; **contenu site réel** : 7 pages sous `content/`.
- `hugo.toml` à la racine ; thème en sous-module ; `static/` vide.
- Convention village : `CLAUDE.md`, `MEMORY.md` (quasi vide), `_docs/` partiellement obsolète.
- Pas de `admin/` Decap ni `cv.md` malgré mentions dans `_docs/architecture.md`.

**Score axe 1** : 3/5

**Findings** :
1. Bruit volumétrique thème vs contenu éditorial minimal.
2. Doc interne décrit une arborescence (`config.toml`, fichiers plats) qui n’existe plus.
3. Duplication volontaire des cartes hub entre accueil et `projets/`.

**Actions proposées** :
- **P1** : Réconcilier `_docs/architecture.md` et `_docs/etat.md` avec `hugo.toml` et dossiers `_index.md`.
- **P2** : Documenter maintenance des cartes dupliquées.

## 2. Code

- Site Hugo statique ; pas d’app Python/JS métier hors thème.
- `hugo` non disponible dans l’environnement d’audit — **build non exécuté** ici.
- Archetype crée des brouillons par défaut ; pages actuelles sans `draft: true`.
- `markup.goldmark.renderer.unsafe = true` à surveiller si contenu élargi.

**Score axe 2** : 3/5

**Findings** :
1. Build non vérifié dans cet audit.
2. Pas de workflow CI / Netlify à la racine du site.
3. TODO visibles (DJ, Jukbike) sur pages publiées.

**Actions proposées** :
- **P1** : Build Hugo local (≥ 0.155) et documenter la commande.
- **P1** : Remplir ou retirer TODO avant vitrine pro.
- **P2** : Config déploiement racine si Netlify/Pages.

## 3. Documentation

- `CLAUDE.md` globalement aligné avec la structure Hugo actuelle.
- `_docs/etat.md` en retard ; `MEMORY.md` / `conventions.md` vides.
- Aucune mention `kb-dj` dans le dépôt ; « production » = sens musical (Reactable, Ableton), pas la KB prod.

**Score axe 3** : 2,5/5

**Findings** :
1. Documentation interne trompeuse pour onboarding.
2. SEO basique (title, description) sans images OG / hero.
3. Écart version annoncée (~17 pages) vs 7 sources.

**Actions proposées** :
- **P0** : Corriger `_docs` obsolètes (onboarding agents).
- **P1** : Enrichir SEO et assets `static/`.
- **P2** : Lien explicite vers kb-dj / kb-prod si souhaité côté vitrine.

## 4. Cohérence écosystème

- Présent tableau global « En construction ».
- Pages projets (a2dd, reactable, jukbike) partiellement remplies.
- Pas de pont KB documenté ; cohérence plutôt narrative sur le site.

**Score axe 4** : 3/5

**Actions proposées** :
- **P2** : Liens sortants vers projets Code et musique si politique de vitrine unifiée.

## 5. Synthèse + plan d'action priorisé

### P0
- [ ] Réconcilier documentation interne et structure réelle.

### P1
- [ ] Build Hugo validé ; TODO pages ; assets statiques.
- [ ] SEO de base (partage social).

### P2
- [ ] Factoriser cartes ; MEMORY/conventions.

### Suite recommandée
- Phase 2 : Cursor sur Hugo + contenu ; build local obligatoire avant déploiement.

### Décisions Didier en attente
1. Publier avec TODO ou attendre contenu DJ/Jukbike final ?
