#!/bin/bash

SCRIPT_DIR=$(cd "$(dirname "$0")"; pwd)

SOURCE_ZIP="$SCRIPT_DIR/payload.zip"

echo "Buscando payload.zip en: $SOURCE_ZIP"

found=false

for dir in .terraform/modules/backend.lbda_*; do
  if [ -d "$dir" ]; then
    echo "Directorio encontrado: $dir"
    echo "Copiando $SOURCE_ZIP a $dir"
    cp "$SOURCE_ZIP" "$dir/payload.zip"
    found=true
  fi
done

if [ "$found" = false ]; then
  echo "No se encontraron directorios de lambda para copiar payload.zip."
fi
