# structurizr POC

A documentação é gerada utilizando o Structurizr CLI e segue o C4 Model para descrever a arquitetura do sistema.

## O que é o C4 Model?

O C4 Model é uma abordagem para descrever a arquitetura de software em diferentes níveis de detalhe. Ele é composto por quatro tipos de diagramas:

1. **Context Diagram**: Mostra o sistema como um todo e suas interações com usuários e outros sistemas.
2. **Container Diagram**: Detalha os principais contêineres de software (aplicativos, bancos de dados, etc.) e suas interações.
3. **Component Diagram**: Descreve os componentes internos de cada contêiner e suas interações.
4. **Code (ou Class) Diagram**: Opcionalmente, mostra detalhes de implementação de classes ou código.

## Estrutura do Projeto

- `catalog-info.yaml`: Arquivo de configuração do Backstage.
- `docker-compose.yml`: Arquivo de configuração do Docker Compose.
- `Makefile`: Arquivo Makefile para comandos de build, up e clean.
- `.setup/`: Diretório contendo scripts de configuração e Dockerfile.
  - `build/Dockerfile`: Dockerfile para construir a imagem do Structurizr CLI.
  - `scripts/generate_md.sh`: Script para gerar os arquivos Markdown com diagramas.
  - `scripts/entrypoint.sh`: Script de entrada para processar os arquivos DSL e gerar diagramas.
- `docs/`: Diretório contendo a documentação do projeto.
  - `images/`: Diretório contendo imagens usadas na documentação.
    - `as-is/`: Imagens da arquitetura atual.
    - `to-be/`: Imagens da arquitetura planejada.
  - `diagrams/`: Diretório contendo os arquivos Markdown gerados com os diagramas.
    - `index.md`: Índice dos diagramas.
    - `as-is.md`: Arquitetura atual.
    - `to-be.md`: Arquitetura planejada.
  - `index.md`: Índice da documentação.
  - `mkdocs.yml`: Arquivo de configuração do MkDocs.
- `src/`: Diretório contendo os arquivos DSL e diagramas gerados.
  - `as_is.dsl`: Arquivo DSL para a arquitetura atual.
  - `to_be.dsl`: Arquivo DSL para a arquitetura planejada.
  - `diagrams/`: Diretório onde os diagramas gerados serão armazenados.
    - `as-is/`: Diagramas da arquitetura atual.
    - `to-be/`: Diagramas da arquitetura planejada.

## Comandos do Makefile

- **build**: Constrói a imagem Docker usando o Docker Compose.
  make build

- **up**: Executa o alvo `clean` antes de subir os serviços com o Docker Compose.
  make up

- **down**: Derruba os serviços com o Docker Compose.
  make down

- **clean**: Remove os arquivos e diretórios especificados.
  make clean

## Adicionando um Novo Arquivo DSL

Para adicionar um novo arquivo DSL e gerar a documentação correspondente, siga os passos abaixo:

1. **Crie o Arquivo DSL**:
   - Adicione um novo arquivo DSL na pasta `src/`. Por exemplo, `src/novo_arquivo.dsl`.

2. **Edite o Arquivo DSL**:
   - Defina a arquitetura desejada no novo arquivo DSL. Por exemplo:
     ```c4
     workspace {
         model {
             sistema = softwareSystem "Novo Sistema" {
                 description "Descrição do novo sistema"
                 tecnologia "Tecnologia usada"
             }
         }
         views {
             systemContext sistema {
                 include *
                 autolayout lr
             }
             theme default
         }
     }
     ```

3. **Execute os Comandos do Makefile**:
   - Construa a imagem Docker:
     make build
   - Suba os serviços e gere a documentação:
     make up

Com esses passos, a documentação será gerada automaticamente para o novo arquivo DSL e os diagramas serão incluídos na pasta `docs/diagrams` e `docs/images`.

** 

## Acessando a Documentação

Para acessar a documentação gerada, navegue até os seguintes arquivos:

- [Índice dos Diagramas](docs/diagrams/index.md)
- [Arquitetura Atual (as-is)](docs/diagrams/as-is.md)
- [Arquitetura Planejada (to-be)](docs/diagrams/to-be.md)
