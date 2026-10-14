# Audit site artn0art — 15/10 · chantiers pour AN et CU

> Par 🟦 CLA (fin de forfait). Mesuré sur les fichiers ; je n'ai PAS pu voir le rendu (pas de Hugo dans ma machine, 127.0.0.1:1313 hors de portée) → le contrôle visuel est confié à CU.

## État en une ligne par page
| Page | État | Problème principal |
|---|---|---|
| Accueil | en ligne | modifié, non commité |
| DJ | en ligne | encart Cours DJ neuf, à voir à l'écran |
| MAO | **jamais commitée** | 2 857 mots, 7 encarts + 4 accordéons : très longue ; 47 `style=""` en ligne ; un `<script>` dans le contenu ; tu/vous mélangés (7/3) |
| Bricodage | **jamais commitée** | 3 modules sur 5 « 🚧 en construction » (textes de Didier) |
| Jukbike | en ligne | 1 photo de 3,4 Mo en .JPEG (galerie) |
| Mentions légales, Confidentialité | en ligne | identité légale manquante depuis juillet (bloqué Didier) |
| a2dd, ateliers, bricodeur, producteur, reactable | brouillons | à publier ou non (Didier) |

## 🔴 Risque n°1 — rien n'est sauvegardé
Dernier commit : 30/07. Pages MAO, Bricodage, leurs gabarits, 14 icônes : **jamais commités**. Un mauvais geste et tout est perdu.

## 🟩 CU — code et contrôle (ordre)
1. **Commit local** de tout l'existant (pas de push). Message clair, une seule fois.
2. **Contrôle visuel** : `hugo server`, captures desktop + mobile de /, /dj/, /mao/, /bricodage/, /projets/jukbike/. Accordéons qui s'ouvrent, ancres `#cours-dj #max-for-live #note #move #push`, icônes visibles.
3. **Lighthouse mobile** sur ces 5 pages (référence juillet : 97/100/100/100).
4. **Photo jukbike 3,4 Mo** → webp < 300 Ko, nom sans espace.
5. **Liens** : tous les liens internes et mailto répondent.
6. Rapport dans le canal (fil D575).

## 🟧 AN — design et intégration (après le commit de CU)
1. **MAO : sortir les 47 `style=""`** vers des classes dans `custom.css` (tableaux, marges). Même rendu, code propre.
2. **MAO : le `<script>` d'ouverture des ancres** → dans le gabarit `layouts/mao/list.html`, partagé avec DJ (ancre `#cours-dj`).
3. **MAO : une rangée d'icônes en haut** (les 7 univers : Downtempo, House organique, Techno mélodique, Max for Live, Note, Move, Push). Clic = ouvre l'encart. Texte au survol, pas de mot sous l'icône (règle « je suis visuel »). La page devient lisible sans tout dérouler.
4. **Même rangée sur Bricodage** si elle plaît sur MAO.
5. Vérifier que les 5 nouvelles icônes (max_for_live, note, move, push, cours_dj) tiennent avec les anciennes ; `note_move_push.webp` ne sert plus.

## 👤 Didier tranche (une fois, ici)
1. **Tu ou vous** sur tout le site ? (aujourd'hui mélangé)
2. **MAO** : rangée d'icônes en haut (proposé) ou découper en sous-pages ?
3. **Brouillons** : lesquels publier ?
4. **Mentions légales** : nom, adresse, statut — bloqué depuis juillet, obligatoire avant toute mise en ligne de MAO.

## Règles
Claim avant d'écrire · rien d'inventé · **aucun push** sans l'ordre de Didier · échanges dans le canal.
