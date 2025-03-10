FROM openjdk:17-slim

RUN apt-get update && \
    apt-get install -y --no-install-recommends curl unzip bash libfreetype6 libfontconfig1 graphviz && \
    rm -rf /var/lib/apt/lists/*

# Esse cara vai servir para gerar os PNGs a partir dos arquivos .puml
RUN curl -L -o plantuml.jar https://sourceforge.net/projects/plantuml/files/plantuml.jar/download && \
    mv plantuml.jar /usr/local/bin/plantuml.jar

# Esse cara vai servir para gerar os diagramas a partir dos arquivos .dsl
RUN curl -L -o structurizr-cli.zip https://github.com/structurizr/cli/releases/latest/download/structurizr-cli.zip && \
    unzip structurizr-cli.zip -d /opt/structurizr-cli && \
    chmod +x /opt/structurizr-cli/structurizr.sh && \
    rm structurizr-cli.zip

WORKDIR /app

COPY . /app

RUN chmod +x /app/.setup/scripts/generate_md.sh
RUN chmod +x /app/.setup/scripts/entrypoint.sh

ENTRYPOINT ["/bin/bash", "/app/.setup/scripts/entrypoint.sh"]
