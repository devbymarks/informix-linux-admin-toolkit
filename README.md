# 🐧 IBM Informix Linux Administration Toolkit

Toolkit de administração do **IBM Informix em ambientes Linux**, desenvolvido a partir de atividades práticas do dia a dia profissional, com foco em configuração de instâncias, gerenciamento de armazenamento, administração de logs, automação de backups, monitoramento e troubleshooting.

**Tecnologias:** Linux • IBM Informix • Shell Script • SQL • ontape • onstat

## 📌 Sobre o projeto

O IBM Informix Linux Administration Toolkit reúne scripts, configurações de referência e procedimentos técnicos relacionados às rotinas de administração do IBM Informix em servidores Linux.

O projeto surgiu da necessidade de organizar e padronizar atividades operacionais realizadas no ambiente profissional, facilitando a execução de tarefas administrativas, a identificação de problemas e a manutenção das instâncias de banco de dados.

A estrutura contempla procedimentos relacionados à configuração do ambiente, gerenciamento de dbspaces e chunks, administração de logs, execução de backups e diagnóstico de problemas de infraestrutura e banco de dados.

Além de centralizar rotinas técnicas, o projeto busca melhorar a organização dos procedimentos operacionais e facilitar sua reutilização em atividades de manutenção e administração de servidores.

## 🎯 Objetivos

- Organizar procedimentos de instalação e configuração do IBM Informix em Linux.
- Padronizar configurações de ambiente, arquivos ONCONFIG e sqlhosts.
- Gerenciar dbspaces, chunks e estruturas de armazenamento.
- Administrar Physical Logs e Logical Logs.
- Automatizar rotinas de backup nível 0 utilizando ontape.
- Facilitar o diagnóstico e a análise do estado das instâncias.
- Gerar relatórios técnicos para análise de utilização e extents.
- Centralizar comandos e procedimentos de troubleshooting.
- Melhorar a organização e a manutenção das rotinas administrativas.
- Aplicar boas práticas de segurança e sanitização de informações.

## 📚 Funcionalidades

| Área | Descrição |
|---|---|
| Instalação | Preparação do Linux e organização do ambiente Informix |
| Configuração | Variáveis de ambiente, ONCONFIG e sqlhosts |
| Storage | Administração de dbspaces, chunks e armazenamento |
| Logs | Gerenciamento de Physical Logs e Logical Logs |
| Backup | Rotinas de backup nível 0 com ontape |
| Automação | Scripts Bash e KornShell para tarefas administrativas |
| Monitoramento | Verificação de status, logs, dbspaces e chunks |
| Relatórios | Levantamento de informações sobre extents |
| Troubleshooting | Diagnóstico de falhas de configuração, permissões e armazenamento |
| SQL | Rotinas administrativas relacionadas ao ambiente Informix |
| Segurança | Organização de exemplos e proteção de informações operacionais |

## 🏗️ Arquitetura de referência

```text
Linux Server
└── IBM Informix Dynamic Server
    ├── rootdbs
    ├── dbs_plog
    │   └── Physical Log
    ├── dbs_log
    │   └── Logical Logs
    ├── dbs_temp
    │   └── Operações temporárias
    ├── dbs_data
    │   └── Dados das aplicações
    └── dbs_sysadmin
        └── Banco administrativo

Rotinas administrativas
├── Configuração da instância
├── Gerenciamento de storage
├── Administração de logs
├── Backup nível 0
├── Relatórios técnicos
└── Troubleshooting
```

Os nomes dos dbspaces apresentados são ilustrativos e podem variar conforme a configuração de cada ambiente.

## 📂 Estrutura do repositório

```text
informix-linux-admin-toolkit/
├── README.md
├── LICENSE
├── SECURITY.md
├── .gitignore
├── configs/
│   ├── informix.env.example
│   ├── onconfig.project.example
│   └── sqlhosts.example
├── docs/
│   ├── 01-INSTALLATION.md
│   ├── 02-STORAGE-AND-LOGS.md
│   ├── 03-BACKUP.md
│   └── 04-TROUBLESHOOTING.md
├── scripts/
│   ├── backup_level0.sh
│   ├── create_logical_logs.sh
│   └── extents_report.ksh
└── sql/
    └── reset_sysadmin.sql
```

A organização separa scripts, arquivos de configuração de referência, documentação técnica e rotinas SQL, facilitando a manutenção e a evolução do toolkit.

## ⚙️ Scripts principais

### 💾 `backup_level0.sh`

Automatiza uma rotina de backup nível 0 utilizando o `ontape`, registra informações da instância e gera cópias de referência dos arquivos de configuração selecionados.

Exemplo de execução:

```bash
BACKUP_DIR=/backup/ontape \
LOG_FILE=/var/log/informix/backup_level0.log \
./scripts/backup_level0.sh
```

O destino, as permissões e os parâmetros de backup devem ser validados conforme a configuração do servidor antes da execução.

### 🧾 `create_logical_logs.sh`

Automatiza a inclusão de logical logs em um dbspace.

```bash
./scripts/create_logical_logs.sh 95 dbs_log 20000
```

Parâmetros:

- Quantidade de logical logs.
- Dbspace de destino.
- Tamanho de cada log em KB.

### 📊 `extents_report.ksh`

Gera um relatório de extents e utilização de tabelas de uma base Informix.

```bash
./scripts/extents_report.ksh demo_db > extents-demo_db.txt
```

## 🔎 Comandos de administração e diagnóstico

| Comando | Finalidade |
|---|---|
| `onstat -` | Verificar o estado da instância |
| `onstat -u` | Consultar usuários e sessões |
| `onstat -m` | Consultar mensagens do log de diagnóstico |
| `onstat -d` | Verificar dbspaces e chunks |
| `onstat -l` | Consultar logical logs |

Esses comandos auxiliam nas atividades de administração e troubleshooting. A interpretação dos resultados depende do estado da instância e da versão do Informix.

## 🧰 Tecnologias e conhecimentos aplicados

- Administração de servidores Linux.
- IBM Informix Dynamic Server.
- Bash e KornShell.
- SQL e rotinas administrativas.
- Gerenciamento de dbspaces e chunks.
- Administração de Physical Logs e Logical Logs.
- Backup e recuperação com ontape.
- Diagnóstico utilizando onstat.
- Automação de tarefas operacionais.
- Análise de permissões e sistemas de arquivos.
- Troubleshooting de banco de dados e infraestrutura.
- Documentação e padronização de procedimentos técnicos.

## 🖥️ Ambiente de referência

O ambiente de referência utilizado no projeto contempla o **IBM Informix 11.70 FC7 em Linux de 64 bits**.

Os comandos e procedimentos devem ser revisados antes da utilização em outras versões ou ambientes, considerando as diferenças de configuração, permissões e recursos disponíveis.

## 🔐 Segurança e confidencialidade

Como o projeto está relacionado a atividades realizadas em um ambiente profissional, sua publicação deve preservar a confidencialidade das informações da empresa.

O repositório público deve conter somente arquivos revisados e autorizados para divulgação.

Não publique:

- Senhas, tokens ou chaves privadas.
- Endereços e informações internas de servidores sem autorização.
- Dados de clientes ou informações corporativas confidenciais.
- Backups, dumps ou arquivos reais de bancos de dados.
- Arquivos completos de configuração de produção sem sanitização.
- Instaladores proprietários ou arquivos cuja redistribuição não seja autorizada.

Os exemplos publicados devem utilizar dados fictícios e configurações de referência.

Consulte o arquivo `SECURITY.md` antes de realizar alterações destinadas à publicação.

## ⚠️ Cuidados operacionais

Alguns comandos administrativos do Informix podem alterar estruturas críticas ou causar perda de dados.

Por exemplo, `oninit -i` pode inicializar novamente as estruturas de uma instância e provocar perda de dados existentes. Seu uso exige confirmação da finalidade, do ambiente e do procedimento de recuperação.

Antes de executar comandos administrativos, valide as variáveis de ambiente, a instância de destino, as permissões e os impactos da operação.

## 🚀 Evoluções planejadas

- Validação automática dos pré-requisitos do servidor.
- Parametrização de rotinas por arquivos de configuração.
- Validação da integridade e do resultado dos backups.
- Implementação de políticas de retenção.
- Monitoramento da utilização de dbspaces.
- Identificação de alertas relacionados aos logs.
- Geração de relatórios em CSV e HTML.
- Testes automatizados das rotinas administrativas.
- Documentação de restore e validação de recuperação.

## 👨‍💻 Autor

**Matheus Marks**

Projeto desenvolvido a partir da experiência prática com administração de servidores Linux, banco de dados IBM Informix, automação de rotinas operacionais, backups e troubleshooting de infraestrutura.

O toolkit representa a organização de procedimentos e ferramentas utilizados em atividades profissionais, com foco em padronização, manutenção e eficiência operacional.

## ⭐ Apoie o projeto

Se este repositório foi útil, considere deixar uma ⭐ para apoiar sua evolução.

## 📄 Licença

Este projeto está disponível sob a licença MIT, desde que os arquivos publicados possam ser legalmente distribuídos sob esses termos.

IBM e Informix são marcas de seus respectivos proprietários. Este é um projeto independente, sem vínculo oficial com a IBM.
