#!/bin/bash

OUTPUT_DIR="docs/diagrams"
OUTPUT_INDEX_FILE="$OUTPUT_DIR/index.md"
DIAGRAMS_DIR="docs/images"

mkdir -p $OUTPUT_DIR

# Gerar o arquivo de índice
echo "# Diagramas C4" > $OUTPUT_INDEX_FILE
echo "" >> $OUTPUT_INDEX_FILE

# Função para adicionar imagens ao arquivo Markdown
add_images_to_md() {
  local dir=$1
  local base_name=$2
  local output_file=$3
  local diagram_type=$4
  local pattern=$5

  echo "## Diagrama de $diagram_type" >> $output_file
  for file in "$dir"/*"$pattern"*.svg; do
    if [[ "$file" != *"-key.svg" ]]; then
      filename=$(basename -- "$file")
      echo "![${filename%.*}](../images/$base_name/$filename)" >> $output_file
      echo "" >> $output_file
    fi
  done
}

# Processar todos os diretórios de diagramas
for dir in $DIAGRAMS_DIR/*; do
  if [ -d "$dir" ]; then
    base_name=$(basename "$dir")
    output_file="$OUTPUT_DIR/$base_name.md"
    
    # Adicionar entrada no índice
    echo "- [Arquitetura $base_name]($base_name.md)" >> $OUTPUT_INDEX_FILE
    
    # Gerar o arquivo Markdown para cada conjunto de diagramas
    echo "# Arquitetura $base_name" > $output_file
    echo "" >> $output_file

    # Adicionar imagens de diagramas de contêiner e contexto
    add_images_to_md "$dir" "$base_name" "$output_file" "Contêiner" "Container"
    add_images_to_md "$dir" "$base_name" "$output_file" "Contexto do Sistema" "SystemContext"
  fi
done

echo "Arquivos Markdown gerados em $OUTPUT_DIR"
