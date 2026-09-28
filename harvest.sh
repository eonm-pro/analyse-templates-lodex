#!/usr/bin/env bash
set -euo pipefail

: "${S3_DEST:?S3_DEST must be set, e.g. myalias/my-bucket/lodex-templates}"

OUT_DIR="templates"
ARCHIVE="templates.zip"

mkdir -p "$OUT_DIR"

ezcrawl | jq -rs '
    .[].instance?.tenant? |
    select(. != null) |
    [.name, .publicUrl, .username, .password] |
    @tsv
' | while IFS=$'\t' read -r name publicUrl username password; do
    [[ -z "$name" ]] && continue

    echo "🔍 Traitement de l'instance : $name ($publicUrl)"

    export LODEX_USERNAME="$username"
    export LODEX_PASSWORD="$password"
    export LODEX_INSTANCE="$publicUrl"
    export LODEX_TENANT="$name"

    mkdir -p "$OUT_DIR/$name"
    target="$OUT_DIR/$name/template_$(date +%Y%m%d_%H%M%S).tar.gz"

    if lodex-cli export-template > "$target" < /dev/null; then
        echo "✅ Template téléchargé pour : $name"
    else
        echo "❌ Échec pour : $name" >&2
        rm -f "$target"
    fi

    unset LODEX_USERNAME LODEX_PASSWORD LODEX_INSTANCE LODEX_TENANT
done

zip -r "$ARCHIVE" "$OUT_DIR"
echo "📦 Archive créée : $ARCHIVE"

# Upload to S3
mc cp "$ARCHIVE" "$S3_DEST/$ARCHIVE"
echo "☁️  Envoyé vers : $S3_DEST/$ARCHIVE"