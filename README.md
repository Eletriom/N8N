# N8N para Pterodactyl

![N8N Logo](https://n8n.io/images/n8n-logo.png)

## Sobre o Projeto

Este repositório contém uma implementação do N8N ([https://n8n.io/](https://n8n.io/)) otimizada para execução em servidores [Pterodactyl](https://pterodactyl.io/). O N8N é uma poderosa plataforma de automação de fluxo de trabalho que permite conectar diferentes sistemas e serviços sem precisar de conhecimentos de programação.

## Características

- Imagem Docker otimizada para Pterodactyl
- Configuração automática de ambiente via variáveis
- Suporte a SQLite para armazenamento local
- Configuração de segurança pré-definida
- Suporte a task runners para melhor desempenho

## Requisitos

- Servidor Pterodactyl
- Egg compatível para N8N
- Pelo menos 1GB de RAM recomendado
- 2 vCPUs recomendados

## Instalação

1. Importe o arquivo egg-n8n.json no seu painel Pterodactyl
2. Crie um novo servidor usando o egg
3. Inicie o servidor

## Variáveis de Ambiente

| Variável | Descrição | Valor Padrão |
|----------|-----------|--------------|
| `N8N_VERSION` | Versão do N8N a ser instalada | 1.91.2 |
| `N8N_PROTOCOL` | Protocolo HTTP ou HTTPS | http |
| `N8N_SECURE_COOKIE` | Uso de cookies seguros | false |
| `GENERIC_TIMEZONE` | Timezone do servidor | UTC |
| `N8N_DB_TYPE` | Tipo de banco de dados | sqlite |
| `N8N_ENFORCE_SETTINGS_FILE_PERMISSIONS` | Forçar permissões seguras | true |
| `N8N_RUNNERS_ENABLED` | Ativar task runners | true |

## Uso

Após a instalação, acesse o N8N através do endereço:

```
http://seu-servidor:porta
```

Na primeira execução, você precisará configurar um usuário administrador.

## Persistência

Os dados são armazenados em:

```
/home/container/.n8n/
```

Certifique-se de que este diretório esteja configurado para backup no Pterodactyl.

## Exemplos de Uso

Aqui estão alguns exemplos do que você pode fazer com N8N:

- Integrar dados entre sistemas (Stripe, Shopify, Google Sheets)
- Criar automações para mídias sociais
- Implementar alertas e notificações para sistemas
- Sincronizar dados entre diferentes serviços
- Realizar processamento de dados automatizado

## Atualizando

Para atualizar o N8N para uma nova versão:

1. Acesse o painel do Pterodactyl
2. Pare o servidor
3. Atualize a variável de ambiente `N8N_VERSION` para a versão desejada
4. Reinicie o servidor

## Segurança

Recomendações para aumentar a segurança:

- Configure o `N8N_PROTOCOL` como `https` se tiver um certificado
- Use senhas fortes para seu usuário administrador
- Limite o acesso ao seu servidor N8N via firewall
- Considere a implementação de autenticação externa

## Perguntas Frequentes (FAQ)

**P: O N8N suporta bancos de dados externos?**  
R: Sim, você pode configurar MySQL, PostgreSQL ou outros bancos suportados através das variáveis de ambiente.

**P: É possível executar tarefas em segundo plano?**  
R: Sim, os task runners estão habilitados por padrão para execução eficiente.

**P: Como faço backup dos meus fluxos de trabalho?**  
R: Configure backups regulares do diretório `/home/container/.n8n/` no painel do Pterodactyl.

## Recursos Adicionais

- [Documentação Oficial do N8N](https://docs.n8n.io/)
- [Comunidade N8N](https://community.n8n.io/)
- [Documentação do Pterodactyl](https://pterodactyl.io/project/introduction.html)
- [Tutoriais em Vídeo (YouTube)](https://www.youtube.com/c/n8n_io)

## Solução de Problemas

- **Erro de conexão**: Verifique se as portas estão corretamente configuradas no Pterodactyl.
- **Erro de memória**: Aumente a alocação de memória do servidor.
- **Webhook não funciona**: Verifique a configuração da variável `N8N_WEBHOOK_URL`.
- **Erro ao iniciar**: Verifique os logs do servidor para identificar o problema específico.
- **Performance lenta**: Aumente os recursos alocados para o servidor ou otimize seus fluxos de trabalho.

## Limitações Conhecidas

- Em servidores com recursos limitados, fluxos de trabalho complexos podem sofrer com timeouts
- Alguns nós específicos do N8N podem exigir configurações adicionais para funcionar corretamente
- O acesso SSH ao contêiner pode ser necessário para depuração avançada

## Contribuindo

Contribuições são bem-vindas! Por favor, envie um pull request ou abra uma issue para discutir alterações propostas.

## Licença

Este projeto é distribuído sob a mesma licença do N8N. Veja mais detalhes no [site oficial do N8N](https://n8n.io/licensing/).

## Créditos

- [N8N](https://n8n.io/) - Plataforma de automação de fluxo de trabalho
- [Pterodactyl](https://pterodactyl.io/) - Plataforma de gerenciamento de servidores
- [Eletriom](https://eletriom.com.br) - Autor desta implementação 