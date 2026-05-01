---
name: handoff
description: "Génère automatiquement un handoff de fin de session — résumé structuré de tout ce qui a été fait, décisions prises, pièges découverts, fichiers touchés, et commandes pour reprendre. Se déclenche quand l'utilisateur dit 'handoff', 'résumé de session', 'on fait le handoff', 'note ce qu'on a fait', 'bilan', 'clôture', ou toute demande de fin/résumé de session. Utilise ce skill même si l'utilisateur dit juste 'handoff' sans contexte. Utilise aussi ce skill quand la conversation approche de sa fin et qu'un travail significatif a été accompli."
---

# Skill Handoff — Résumé de session pour continuité

## Pourquoi

Didier travaille par sessions numérotées (S114, S116, S116b...) sur un écosystème de projets. Le handoff est le pont entre deux sessions : il permet à la prochaine instance de Claude de reprendre exactement là où on s'est arrêté. Sans handoff, on perd du contexte, on refait du travail, on re-casse des choses corrigées, et Didier doit tout ré-expliquer.

Le handoff est écrit **pour Claude**, pas pour un humain. Il doit être suffisamment précis pour qu'un nouveau Claude puisse reprendre sans poser de questions de contexte.

## Déclenchement

Mots-clés : "handoff", "résumé de session", "bilan", "on fait le handoff", "note ce qu'on a fait", "clôture de session".

## Processus complet

### 1. Déterminer le numéro de session

Chercher les handoffs existants :

```bash
ls -t _archives/handoffs/handoff-*.md 2>/dev/null | head -3
```

Si le dernier est `handoff-2026-04-08-S116.md` et qu'on est le même jour avec du travail supplémentaire, la nouvelle session est **S116b** (puis S116c, etc.). Si c'est un autre jour, incrémenter le numéro principal.

En cas de doute, demander à Didier.

### 2. Détecter le projet courant

Le skill s'adapte au projet dans lequel il est exécuté :

```bash
# Nom du projet = nom du dossier racine
PROJECT_NAME="$(basename "$(pwd)")"

# Chemin iCloud standard de Didier
PROJECT_PATH="~/Library/Mobile\ Documents/com~apple~CloudDocs/_claude/_projets/$PROJECT_NAME"
```

Vérifier si le projet suit le modèle Hub+Spokes (présence de `CLAUDE.md` + `_docs/`). Si oui, la capitalisation s'applique. Sinon, le handoff seul suffit.

### 3. Scanner la conversation

Relire toute la conversation et extraire 7 catégories d'information. L'exhaustivité compte ici — un piège oublié sera redécouvert douloureusement.

1. **Ce qu'on a fait** — chaque tâche accomplie, groupée par thème. Inclure les détails techniques (noms de fonctions, chemins de fichiers, chiffres concrets).

2. **Décisions prises** — tout choix technique qui ne doit pas être remis en question. Inclure le **pourquoi** de chaque décision pour éviter qu'elle soit inversée par un futur Claude bien intentionné.

3. **Pièges découverts** — bugs, comportements inattendus, incompatibilités. Assez de détail (symptôme + cause + solution) pour ne jamais les redécouvrir. C'est la section la plus précieuse du handoff.

4. **En cours / non terminé** — ce qui a été commencé mais pas fini, ce qui est bloqué et pourquoi. Inclure la commande ou l'action exacte pour débloquer.

5. **Fichiers créés et modifiés** — séparés en deux sous-sections ("Créés" et "Modifiés"). Toujours avec le chemin relatif depuis la racine du projet et une description courte du changement.

6. **Commandes pour la prochaine session** — un bloc bash unique, copier-collable, avec les commandes numérotées et commentées. C'est ce que Didier lancera au début de la prochaine session.

7. **État des projets touchés** (si plusieurs projets concernés) — une ligne par projet avec version/état.

### 4. Écrire le handoff

Structure exacte :

```markdown
# Handoff — YYYY-MM-DD (session SXX)

## Contexte rapide
[1-2 lignes : contexte projet + résumé de la session en une phrase]

## Ce qu'on a fait cette session

### [Thème 1]
- Point concret avec **détails techniques**
- Fichier : `chemin/vers/fichier` — ce qui a changé

### [Thème 2]
- ...

## Décisions prises
- **[Décision]** : pourquoi (court mais suffisant pour ne pas revenir dessus)
- ...

## En cours / non terminé
- **[Tâche]** : état actuel, ce qui bloque, commande pour débloquer
- ...

## Pièges découverts cette session
- **[Piège]** : symptôme → cause → solution
- ...

## Fichiers clés créés/modifiés

### Créés
- `chemin/fichier` — description courte

### Modifiés
- `chemin/fichier` — ce qui a changé

## Commandes pour la prochaine session

```bash
cd <PROJECT_PATH>

# 1. [Première action]
commande exacte

# 2. [Deuxième action]
commande exacte
```
```

### Principes de rédaction

- **Concret > vague** : "fix `scan_folder()` dans detect_pays.py : utilisait `query_musicbrainz()` directement au lieu de `classify_artist_country()` (cascade complète)" plutôt que "correction d'un bug"
- **Chemins relatifs** depuis la racine du projet, pas juste le nom du fichier
- **Chiffres** : "23/23 tracks écrites", "180 mappings", "99.6% de couverture" — les chiffres permettent de vérifier
- **Commandes copiables** : si Didier doit faire quelque chose, donner la commande exacte dans un bloc `bash`
- **Pas de détail ligne par ligne** : résumer le changement, pas lister chaque modification
- **Français** pour le texte, anglais pour les noms de fichiers et le code

### 5. Sauvegarder

Emplacement : **`_archives/handoffs/handoff-YYYY-MM-DD-SXX.md`**

Exemple : `_archives/handoffs/handoff-2026-04-08-S116b.md`

Créer le dossier `_archives/handoffs/` s'il n'existe pas. Présenter le fichier à l'utilisateur avec `present_files` si disponible.

### 6. Capitalisation — mettre à jour la documentation du projet

Après le handoff, vérifier si le projet suit le modèle Hub+Spokes (`CLAUDE.md` + `_docs/`). Si oui, mettre à jour les fichiers pertinents :

| Ce qui a changé | Fichier à mettre à jour |
|-----------------|------------------------|
| Architecture, pipeline, modules | `_docs/architecture.md` |
| Avancement session, état courant | `_docs/etat-actuel.md` (réécrire la section courante) |
| Nouveau piège technique | `_docs/pieges.md` |
| Règles, conventions modifiées | `_docs/conventions.md` |
| Pointeur session dans le hub | `CLAUDE.md` (table des pointeurs) |
| Historique ancien (quand etat-actuel.md grossit) | `_docs/_archive.md` |

Si le projet a des modules avec `resume.json`, les mettre à jour aussi.

Signaler à Didier ce qui a été mis à jour. Si une mise à jour a déjà été faite pendant la session, ne pas la refaire.

## Ce que le handoff N'EST PAS

- Pas un journal de bord ("j'ai lu tel fichier puis j'ai fait telle recherche")
- Pas un diff git (pas le contenu des fichiers)
- Pas un tutoriel (pas de réexplication de concepts)
- Pas un document public — c'est un doc technique interne entre instances Claude
