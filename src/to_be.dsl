workspace {

    model {
        user = person "Usuário" {
            description "Usuário do sistema"
        }

        system = softwareSystem "Sistema de Crédito" {
            description "Sistema para gestão de Crédito"

            mobileApp = container "Aplicativo Móvel" {
                description "Aplicativo móvel usado pelo usuário"
                technology "Android, Kotlin"
            }

            bff = container "Backend para Frontend" {
                description "Backend para Frontend servindo o Aplicativo Móvel"
                technology "Spring Boot, Kotlin"
            }

            api = container "API de Crédito" {
                description "API que fornece funcionalidades de crédito"
                technology "Golang"
            }

            database = container "Banco de Dados" {
                description "Banco de dados que armazena informações de crédito"
                technology "MongoDB"
            }

            messaging = container "Sistema de Mensagens" {
                description "Sistema de mensagens para publicação de eventos"
                technology "Kafka"
            }

            # Adicione mudanças planejadas para a arquitetura aqui
            newService = container "Novo Serviço" {
                description "Novo serviço planejado para a futura arquitetura"
                technology "Go"
            }

            user -> mobileApp "Usa"
            mobileApp -> bff "Chama"
            bff -> api "Chama"
            api -> database "Lê e escreve em"
            api -> messaging "Publica eventos no tópico" "credit-api.events"
            api -> newService "Chama o novo serviço"
        }
    }

    views {
        systemContext system {
            include *
            autolayout lr
        }

        container system {
            include *
            autolayout lr
        }

        theme default
    }
}
