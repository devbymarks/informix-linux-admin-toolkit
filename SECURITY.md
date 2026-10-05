# Segurança e publicação

Este repositório foi preparado para publicação pública.

## Nunca publique

- senhas reais;
- usuários acompanhados de senha;
- IPs públicos ou privados de ambientes reais;
- CNPJ, CPF, inscrição estadual ou outros dados cadastrais de clientes;
- nomes de bancos de dados de clientes;
- nomes internos de hosts que identifiquem ambientes;
- chaves, tokens ou certificados;
- dumps ou backups de bancos de dados;
- instaladores proprietários do IBM Informix;
- arquivos de configuração copiados integralmente de ambientes de produção.

## Padrão utilizado neste projeto

- instância de exemplo: `ol_demo`;
- banco de exemplo: `demo_db`;
- endereço de documentação: `192.0.2.10`;
- diretório de chunks: `/opt/IBM/ifmxdata/ol_demo`.

Antes de executar `git add`, revise as alterações:

```bash
git diff
git status
```

Uma busca simples por possíveis segredos também pode ajudar:

```bash
grep -RniE 'password|passwd|senha|token|secret|jdbc:|[0-9]{11,14}' . --exclude-dir=.git
```
