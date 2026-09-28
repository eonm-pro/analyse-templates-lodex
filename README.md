# Lodex Template Analysis

[![Onyxia](https://img.shields.io/badge/Onyxia%20(sspcloud)-Cr%C3%A9er%20un%20nouveau%20service-blue.svg?logo=data:image/svg%2bxml;base64,PHN2ZyBjbGFzcz0ib255eGlhLWZpbGwtdXNlQ2FzZXMtdHlwb2dyYXBoeS10ZXh0Rm9jdXMgdHNzLXUyczk5NC1UaGVtZWRTdmctcm9vdC1CcmFuZEhlYWRlclNlY3Rpb24tbG9nbyIgdmlld0JveD0iMzMgMTkgMzc1IDI1NCIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiBmaWxsPSIjRkY1NjJDIj4KICA8ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIGNsYXNzPSJzcGxhc2hzY3JlZW4tYW5pbWF0aW9uLWdyb3VwMSI+CiAgICA8cGF0aCBkPSJNMjMyLjc0MyA4OC43Nzc0TDI2Ni42OTMgMTIyLjg5OEMyNzcuNTAyIDEzMy43NjEgMjk1LjAxOCAxMzMuNzYxIDMwNS44MTIgMTIyLjg5OEwzMzkuNzYyIDg4Ljc3NzRMMjg2LjI1MyAzNUwyMzIuNzQzIDg4Ljc3NzRaIj48L3BhdGg+CiAgICA8cGF0aCBkPSJNMTA2LjI1MyA4OC43Nzc0TDE0MC4yMDQgMTIyLjg5OEMxNTEuMDEyIDEzMy43NjEgMTY4LjUyOCAxMzMuNzYxIDE3OS4zMjIgMTIyLjg5OEwyMTMuMjczIDg4Ljc3NzRMMTU5Ljc2MyAzNUwxMDYuMjUzIDg4Ljc3NzRaIj48L3BhdGg+ICAgCiAgPC9nPgogIDxnIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyIgY2xhc3M9InNwbGFzaHNjcmVlbi1hbmltYXRpb24tZ3JvdXAyIj4KICAgICAgPHBhdGggZD0iTTQzIDE1Mi4zMzFMNzYuOTUwOCAxODYuNDUyQzg3Ljc1OTQgMTk3LjMxNCAxMDUuMjc1IDE5Ny4zMTQgMTE2LjA2OSAxODYuNDUyTDE1MC4wMiAxNTIuMzMxTDk2LjUwOTkgOTguNTUzN0w0MyAxNTIuMzMxWiI+PC9wYXRoPgogICAgICA8cGF0aCBkPSJNMTY5LjQ5IDE1Mi4zMzFMMjAzLjQ0MSAxODYuNDUyQzIxNC4yNSAxOTcuMzE0IDIzMS43NjUgMTk3LjMxNCAyNDIuNTU5IDE4Ni40NTJMMjc2LjUxIDE1Mi4zMzFMMjIzIDk4LjU1MzdMMTY5LjQ5IDE1Mi4zMzFaIj48L3BhdGg+CiAgICAgIDxwYXRoIGQ9Ik0zNDkuNDkgOTguNTUzN0wyOTUuOTggMTUyLjMzMUwzMjkuOTMxIDE4Ni40NTJDMzQwLjc0IDE5Ny4zMTQgMzU4LjI1NiAxOTcuMzE0IDM2OS4wNDkgMTg2LjQ1Mkw0MDMgMTUyLjMzMUwzNDkuNDkgOTguNTUzN1oiPjwvcGF0aD4KICA8L2c+CiAgPGcgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiBjbGFzcz0ic3BsYXNoc2NyZWVuLWFuaW1hdGlvbi1ncm91cDMiPgogICAgPHBhdGggZD0iTTEwNi4yNTMgMjE1LjlMMTQwLjIwNCAyNTAuMDJDMTUxLjAxMiAyNjAuODgzIDE2OC41MjggMjYwLjg4MyAxNzkuMzIyIDI1MC4wMkwyMTMuMjczIDIxNS45TDE1OS43NjMgMTYyLjEyM0wxMDYuMjUzIDIxNS45WiI+PC9wYXRoPgogICAgPHBhdGggZD0iTTIzMi43NDMgMjE1LjlMMjY2LjY5MyAyNTAuMDJDMjc3LjUwMiAyNjAuODgzIDI5NS4wMTggMjYwLjg4MyAzMDUuODEyIDI1MC4wMkwzMzkuNzYyIDIxNS45TDI4Ni4yNTMgMTYyLjEyM0wyMzIuNzQzIDIxNS45WiI+PC9wYXRoPgogIDwvZz4KPC9zdmc+)](https://datalab.sspcloud.fr/launcher/ide/jupyter-python?name=analyse-templates-lodex&version=2.5.2&s3=default&init.personalInit=«https%3A%2F%2Fraw.githubusercontent.com%2Feonm-pro%2Fanalyse-templates-lodex%2Frefs%2Fheads%2Fmain%2Finit.sh»&git.name=«»&git.email=«»&git.repository=«https%3A%2F%2Fgithub.com%2Feonm-pro%2Fanalyse-templates-lodex»&autoLaunch=false)

# Lodex template usage

Analyse de l'usage des templates des instances Lodex (formats de champs, routines, web services d'enrichissement).

1. **Dans Onyxia** : préparation de l'accès S3 et du secret contenant l'emplacement des données.
2. **En local** : récupération des templates de toutes les instances, puis envoi sur S3.
3. **Dans Onyxia** : lancement du service et analyse avec DuckDB.

## 1. Préparer Onyxia

### Récupérer la configuration `mc` (accès S3)

À faire pour utiliser `mc` **en local** à l'étape 2 :

1. Dans Onyxia, ouvrir **Stockage de données** (menu de gauche).
2. Cliquer sur l'icône d'engrenage à côté du profil `default` pour ouvrir **Détail du profil S3**.
3. Dans « Pour accéder à votre stockage hors des services Datalab », choisir **MinIO Client (bash)**.
4. Copier le script (bouton de copie). Il sera collé dans le terminal local à l'étape 2 :

```bash
export MC_HOST_default='https://...'
```

> Les identifiants sont temporaires (le profil indique la date d'expiration). Quand la session expire, cliquer sur **Renouveler les jetons** dans Onyxia et recopier le nouveau script.

### Créer le secret `LODEX_TEMPLATE`

L'emplacement de l'archive sur S3 se définit dans un secret Onyxia :

1. Dans Onyxia, ouvrir **Mes secrets**.
2. Créer un secret (**Nouveau secret**), par exemple `lodex-template-usage`.
3. Y ajouter la variable (**Ajouter une variable**) :

| Nom de la variable | Valeur |
|--------------------|--------|
| `LODEX_TEMPLATE` | `default/<bucket>/lodex-templates/templates.zip` |

## 2. Récupérer les modèles Lodex (en local)

Prérequis : `ezcrawl`, `lodex-cli`, `jq`, `zip` et `mc`.

Coller dans le terminal le script `mc` copié à l'étape 1, puis lancer le harvest :

```bash
export MC_HOST_default='https://...'
export S3_DEST="default/<bucket>/lodex-templates"
./harvest.sh
```

Le script exporte le template de chaque instance, crée une archive `templates.zip` et l'envoie sur `S3_DEST`.

## 3. Analyser (dans Onyxia)

1. Lancer le service avec le badge **Onyxia** en haut de cette page.

Le script init.sh télécharge et décompresse l'archive dans `data/`, puis exécute `sql/up.sql`, qui crée la base `lodex-template-usage.db`, les vues d'analyse et des exports TSV :

- `field_format_uage` : formats de champs utilisés
- `routine_usage` : routines appelées
- `enrichment_webservices_usage` : web services d'enrichissement

Pour rejouer uniquement l'analyse sur des données déjà extraites :

```bash
duckdb lodex-template-usage.db -c ".read sql/up.sql"
```

Exemple de requête :

```bash
duckdb lodex-template-usage.db -c "SELECT * FROM field_format_uage LIMIT 10;"
```