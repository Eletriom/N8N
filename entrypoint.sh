#!/bin/bash
cd /home/container

# Imprimir as informações de arranque
echo "┌──────────────────────────────────────────┐"
echo "│                                          │"
echo "│       N8N Pterodactyl by Eletriom        │"
echo "│                                          │"
echo "└──────────────────────────────────────────┘"
echo "Versão do N8N: ${N8N_VERSION}"

# Diretório de dados padrão
export N8N_USER_FOLDER="/home/container/.n8n"
mkdir -p "${N8N_USER_FOLDER}"

# Configuração de IP/Porta através do ambiente do Pterodactyl
export N8N_HOST=${SERVER_IP}
export N8N_PORT=${SERVER_PORT}

# Definição do protocolo com suporte a variável de ambiente
if [ -n "${N8N_PROTOCOL}" ]; then
    echo "Usando protocolo definido: ${N8N_PROTOCOL}"
else
    export N8N_PROTOCOL="http"
    echo "Usando protocolo padrão: ${N8N_PROTOCOL}"
fi

# Definição do cookie seguro com suporte a variável de ambiente
if [ -n "${N8N_SECURE_COOKIE}" ]; then
    echo "Usando configuração de cookie seguro definida: ${N8N_SECURE_COOKIE}"
else
    export N8N_SECURE_COOKIE="false"
    echo "Usando configuração de cookie seguro padrão: ${N8N_SECURE_COOKIE}"
fi

# Definição de variáveis para o Webhook URL baseado no ambiente
if [ -n "${HOSTNAME}" ] && [ -n "${N8N_PORT}" ]; then
    export N8N_WEBHOOK_URL="${N8N_PROTOCOL}://${HOSTNAME}:${N8N_PORT}/"
    echo "Webhook URL: ${N8N_WEBHOOK_URL}"
else
    echo "Aviso: HOSTNAME ou N8N_PORT não definidos. Webhook URL não configurado automaticamente."
fi

# Configuração da zona de tempo
if [ -n "${GENERIC_TIMEZONE}" ]; then
    export TZ=${GENERIC_TIMEZONE}
    echo "Timezone definida para: ${TZ}"
fi

# Se estiver definido usar SQLite
if [ "${N8N_DB_TYPE}" = "sqlite" ]; then
    export N8N_DB_TYPE=sqlite
    export N8N_DB_SQLITE_PATH="${N8N_USER_FOLDER}/database.sqlite"
    echo "Usando SQLite: ${N8N_DB_SQLITE_PATH}"
fi

# Verificando se devemos usar a porta personalizada
if [ -n "${N8N_PORT}" ]; then
    echo "Porta personalizada: ${N8N_PORT}"
fi

# Configuração para permissões de arquivo
if [ -n "${N8N_ENFORCE_SETTINGS_FILE_PERMISSIONS}" ]; then
    echo "Configuração de permissões de arquivo: ${N8N_ENFORCE_SETTINGS_FILE_PERMISSIONS}"
else
    export N8N_ENFORCE_SETTINGS_FILE_PERMISSIONS="true"
    echo "Aplicando permissões seguras para arquivos de configuração: ${N8N_ENFORCE_SETTINGS_FILE_PERMISSIONS}"
fi

# Configuração para ativação dos task runners
if [ -n "${N8N_RUNNERS_ENABLED}" ]; then
    echo "Configuração de task runners: ${N8N_RUNNERS_ENABLED}"
else
    export N8N_RUNNERS_ENABLED="true"
    echo "Ativando task runners: ${N8N_RUNNERS_ENABLED}"
fi

# Executar o n8n
if [ -z "$@" ] || [ "$1" = "bash" ] || [ "$1" = "/entrypoint.sh" ]; then
    echo "Iniciando n8n..."
    exec n8n start
else
    # Se foram passados argumentos específicos, execute-os
    echo "Executando comando personalizado: $@"
    exec $@
fi