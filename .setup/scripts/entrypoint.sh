#!/bin/bash

# Diretórios de entrada e saída
SRC_DIR="src"
DIAGRAMS_DIR="src/diagrams"
IMAGES_DIR="docs/images"

# Criar diretórios para os diagramas e imagens
mkdir -p $DIAGRAMS_DIR
mkdir -p $IMAGES_DIR

# Função para processar um arquivo DSL
process_dsl_file() {
  local dsl_file=$1
  local base_name=$(basename "$dsl_file" .dsl)
  
  # Criar diretórios específicos para cada arquivo DSL
  mkdir -p "$DIAGRAMS_DIR/$base_name"
  mkdir -p "$IMAGES_DIR/$base_name"
  
  # Exportar diagramas a partir do arquivo DSL
  /opt/structurizr-cli/structurizr.sh export -w "$dsl_file" -format plantuml -o "$DIAGRAMS_DIR/$base_name/"
  
  # Gerar imagens SVG a partir dos arquivos .puml
  java -jar /usr/local/bin/plantuml.jar -tsvg -o "../../../$IMAGES_DIR/$base_name" "$DIAGRAMS_DIR/$base_name/"*.puml
}

# Processar todos os arquivos DSL na pasta src
for dsl_file in $SRC_DIR/*.dsl; do
  process_dsl_file "$dsl_file"
done

# Gerar arquivos Markdown
chmod +x /app/.setup/scripts/generate_md.sh
/app/.setup/scripts/generate_md.sh
