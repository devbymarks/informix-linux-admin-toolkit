# IBM Informix Linux Administration Toolkit

## Sobre o projeto

O **IBM Informix Linux Administration Toolkit** é um projeto de infraestrutura e administração de banco de dados criado para documentar e automatizar tarefas comuns na implantação e manutenção de uma instância IBM Informix em ambiente Linux.

A ideia nasceu a partir de uma rotina prática de administração: preparar o servidor, instalar o Informix, organizar os dbspaces, configurar logical e physical logs, executar backups e acompanhar a utilização de espaço das tabelas.

O projeto transforma anotações operacionais em uma estrutura organizada, reutilizável e segura para estudo, laboratório e demonstração técnica.

**Desenvolvido e documentado por Matheus Barcelli.**

---

## O que este projeto faz?

De forma simples, o projeto reúne exemplos para:

1. Preparar um servidor Linux para receber o IBM Informix.
2. Configurar as variáveis de ambiente da instância.
3. Criar e organizar chunks e dbspaces.
4. Configurar Logical Log, Physical Log e espaço temporário.
5. Executar backup nível 0 utilizando `ontape`.
6. Automatizar a criação de logical logs.
7. Gerar relatório de utilização de extents das tabelas.
8. Executar rotinas administrativas no banco `sysadmin`.
9. Padronizar arquivos de exemplo como `sqlhosts` e parâmetros principais do `ONCONFIG`.

---

## Por que este projeto importa?

Em servidores de banco de dados, uma instalação funcional não depende apenas de instalar o software.

É necessário planejar armazenamento, permissões, logs, backup, conectividade e monitoramento. Um erro em qualquer uma dessas etapas pode causar indisponibilidade, dificuldade de recuperação ou desperdício de espaço em disco.

Este projeto demonstra uma rotina de administração que busca tornar esse processo **mais documentado, repetível e menos dependente de procedimentos manuais**.

---

## Exemplo simples

Imagine que uma nova máquina Linux precisa hospedar uma instância Informix.

Sem um procedimento padronizado, o administrador teria que lembrar manualmente:

- quais diretórios criar;
- quais variáveis de ambiente configurar;
- onde armazenar os chunks;
- como criar os dbspaces;
- como preparar os logs;
- como realizar o primeiro backup;
- como validar se a instância está online.

Com este repositório, essas tarefas ficam separadas em documentação, exemplos de configuração e scripts de apoio.

---

## Arquitetura do projeto

```text
Linux Server
    |
    +-- IBM Informix Server
    |      |
    |      +-- rootdbs
    |      +-- dbs_plog      -> Physical Log
    |      +-- dbs_log       -> Logical Log
    |      +-- dbs_temp      -> Dados temporários
    |      +-- dbs_data      -> Dados da aplicação
    |      +-- dbs_sysadmin  -> Administração
    |
    +-- Backup
    |      +-- ontape Level 0
    |      +-- inventário de dbspaces
    |      +-- versão da instância
    |
    +-- Monitoramento
           +-- onstat
           +-- relatório de extents
```

---

## Estrutura do repositório

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
│   ├── INSTALLATION.md
│   ├── STORAGE-AND-LOGS.md
│   ├── BACKUP.md
│   └── TROUBLESHOOTING.md
├── scripts/
│   ├── backup_level0.sh
│   ├── create_logical_logs.sh
│   └── extents_report.ksh
└── sql/
    └── reset_sysadmin.sql
```

---

## Tecnologias e conhecimentos demonstrados

- Linux Server
- Shell Script / KornShell
- IBM Informix Dynamic Server
- SQL
- Administração de banco de dados
- Dbspaces e chunks
- Logical Log e Physical Log
- `ontape`
- `onstat`, `onspaces`, `onparams` e `onmode`
- Automação de rotinas operacionais
- Troubleshooting
- Controle de permissões no Linux
- Documentação técnica
- Boas práticas para publicação segura no GitHub

---

## Pré-requisitos

Este repositório não distribui o instalador do IBM Informix.

Para reproduzir o laboratório, é necessário possuir legalmente uma distribuição compatível do IBM Informix e preparar uma máquina Linux com privilégios administrativos.

A documentação original deste projeto utilizava como referência o **IBM Informix 11.70 FC7 em Linux 64 bits**. Os comandos devem ser revisados antes de serem aplicados em outras versões.

---

## Começando

### 1. Prepare as variáveis de ambiente

Copie o exemplo:

```bash
cp configs/informix.env.example ~/.informix.env
```

Revise os valores e carregue:

```bash
source ~/.informix.env
```

### 2. Configure a conectividade

Use `configs/sqlhosts.example` apenas como modelo.

O endereço `192.0.2.10` utilizado no repositório é um endereço reservado para documentação e deve ser substituído pelo endereço do seu ambiente.

### 3. Siga o processo de instalação

Consulte:

```text
docs/INSTALLATION.md
```

### 4. Configure armazenamento e logs

Consulte:

```text
docs/STORAGE-AND-LOGS.md
```

### 5. Configure o backup

Consulte:

```text
docs/BACKUP.md
```

---

## Comandos úteis

Verificar o estado da instância:

```bash
onstat -
```

Ver sessões/usuários:

```bash
onstat -u
```

Ver mensagens recentes:

```bash
onstat -m
```

Ver logical logs:

```bash
onstat -l
```

Ver dbspaces e chunks:

```bash
onstat -d
```

---

## Segurança

Os arquivos originais usados para construir este projeto continham informações de ambiente real, incluindo endereços IP, credenciais e dados de clientes.

Essas informações **não fazem parte deste repositório**. Todos os exemplos públicos usam nomes e endereços fictícios ou reservados para documentação.

Antes de publicar alterações, consulte também o arquivo [`SECURITY.md`](SECURITY.md).

---

## Atenção com comandos destrutivos

Alguns comandos administrativos do Informix podem alterar ou destruir uma instância.

Por exemplo:

```bash
oninit -i
```

Esse comando inicializa o espaço de armazenamento da instância e **não deve ser executado em um ambiente com dados que precisam ser preservados**.

Use este repositório em laboratório ou após validar completamente o procedimento e o plano de recuperação.

---

## Melhorias futuras

- Adicionar validação automática de pré-requisitos.
- Criar instalação parametrizada por arquivo de configuração.
- Adicionar verificação de status do backup.
- Implementar política de retenção.
- Adicionar alertas para utilização de dbspaces.
- Gerar relatórios de capacidade em formato CSV/HTML.
- Adicionar testes dos scripts em ambiente de laboratório.

---

## Autor

**Matheus Barcelli**

Projeto criado a partir de experiência prática com administração de servidores Linux e IBM Informix.

---

## Licença

Os arquivos autorais deste repositório estão disponibilizados sob a licença MIT.

IBM e Informix são marcas de seus respectivos proprietários. Este é um projeto independente, educacional e de portfólio, sem vínculo oficial com a IBM. O repositório não inclui binários, instaladores ou o arquivo padrão completo `onconfig.std` fornecido pelo fabricante.
