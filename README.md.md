# 🐧 IBM Informix Linux Administration Toolkit

> Toolkit educacional e de portfólio para administração do IBM Informix em ambientes Linux, com foco em instalação, configuração, armazenamento, logs, backup e troubleshooting.

[Linux](https://camo.githubusercontent.com/74208acd9a5229cd77499d9c13ef33223b59f12c65329482e19cf4777157656e/68747470733a2f2f696d672e736869656c64732e696f2f62616467652f4c696e75782d41646d696e697374726174696f6e2d4643433632343f7374796c653d666c61742d737175617265266c6f676f3d6c696e7578266c6f676f436f6c6f723d626c61636b) [IBM Informix](https://camo.githubusercontent.com/3fae297fd79776d10332d4aae1bc4bb51cbf6bf6a4c1b267e29e9520a05f3123/68747470733a2f2f696d672e736869656c64732e696f2f62616467652f49424d2d496e666f726d69782d3035324641443f7374796c653d666c61742d737175617265266c6f676f3d69626d266c6f676f436f6c6f723d7768697465) [Shell Script](https://camo.githubusercontent.com/f03310c3f4ee21d88023a18e11e3cf128e16c811a2903d18ab1d4a91e604e58e/68747470733a2f2f696d672e736869656c64732e696f2f62616467652f5368656c6c2d426173682532302532462532304b6f726e5368656c6c2d3445414132353f7374796c653d666c61742d737175617265266c6f676f3d676e752d62617368266c6f676f436f6c6f723d7768697465) [SQL](https://camo.githubusercontent.com/d374ae0dba5bc39dc18fc21a85ed463cbe9a40dab79875b90a4448f7667d952d/68747470733a2f2f696d672e736869656c64732e696f2f62616467652f44617461626173652d53514c2d3333363739313f7374796c653d666c61742d737175617265) [License](https://camo.githubusercontent.com/ac049ef4e7a0b7196b09add6ac2d4f180e544c0ac779c2b2ac2fd2723a209579/68747470733a2f2f696d672e736869656c64732e696f2f62616467652f6c6963656e73652d4d49542d626c75653f7374796c653d666c61742d737175617265)

## 📌 Sobre o projeto

O **IBM Informix Linux Administration Toolkit** reúne procedimentos, scripts e exemplos de configuração utilizados para estudar e padronizar tarefas de administração do IBM Informix em Linux.

O projeto foi organizado a partir de experiências práticas de administração de servidores, transformando procedimentos operacionais em uma base reutilizável para **laboratório, estudos, documentação técnica e portfólio profissional**.

### 🎯 Objetivos

- documentar uma instalação de Informix em Linux;
- organizar configurações de ambiente, `ONCONFIG` e `sqlhosts`;
- demonstrar a criação e organização de dbspaces e chunks;
- trabalhar com Physical Log e Logical Logs;
- automatizar um backup nível 0 com `ontape`;
- gerar informações úteis para diagnóstico e capacidade;
- centralizar comandos de troubleshooting;
- manter exemplos sanitizados e seguros para publicação no GitHub.

> **Importante:** este repositório não é um instalador do IBM Informix nem substitui a documentação oficial da versão utilizada. Os arquivos foram preparados como material de estudo e referência.

---

## 📚 O que você encontra aqui

| **Área**        | **Conteúdo**                                             |
| --------------- | -------------------------------------------------------- |
| Instalação      | Preparação do Linux, usuário, diretórios e ambiente      |
| Configuração    | Variáveis, `ONCONFIG` e `sqlhosts`                       |
| Storage         | Chunks, dbspaces, Physical Log, Logical Log e temporário |
| Backup          | Backup nível 0 com `ontape` e inventário da instância    |
| Automação       | Scripts Bash/KornShell para rotinas administrativas      |
| Monitoramento   | Comandos `onstat` e relatório de extents                 |
| Troubleshooting | Diagnóstico de status, logs, permissões e armazenamento  |
| SQL             | Rotina administrativa para SysAdmin                      |
| Segurança       | Sanitização de dados antes da publicação                 |

---

## 🏗️ Arquitetura de referência

```
Linux Server
│
└── IBM Informix
    │
    ├── rootdbs
    ├── dbs_plog       → Physical Log
    ├── dbs_log        → Logical Logs
    ├── dbs_temp       → Operações temporárias
    ├── dbs_data       → Dados da aplicação
    └── dbs_sysadmin   → Banco administrativo

Rotinas
│
├── Configuração
├── Backup Level 0
├── Relatório de extents
├── Administração de logical logs
└── Troubleshooting

```

---

## 📂 Estrutura do repositório

```
informix-linux-admin-toolkit/
│
├── README.md
├── LICENSE
├── SECURITY.md
├── .gitignore
│
├── configs/
│   ├── informix.env.example
│   ├── onconfig.project.example
│   └── sqlhosts.example
│
├── docs/
│   ├── 01-INSTALLATION.md
│   ├── 02-STORAGE-AND-LOGS.md
│   ├── 03-BACKUP.md
│   └── 04-TROUBLESHOOTING.md
│
├── scripts/
│   ├── backup_level0.sh
│   ├── create_logical_logs.sh
│   └── extents_report.ksh
│
└── sql/
    └── reset_sysadmin.sql

```

A numeração dos documentos indica uma ordem recomendada de leitura e execução.

---

## 🔄 Fluxo recomendado

```
01. Preparar Linux
       ↓
02. Instalar Informix
       ↓
03. Configurar ambiente
       ↓
04. Configurar ONCONFIG / sqlhosts
       ↓
05. Criar chunks e dbspaces
       ↓
06. Configurar logs
       ↓
07. Validar instância
       ↓
08. Executar backup
       ↓
09. Monitorar / diagnosticar

```

### 📦 1. Instalação

Comece por [`docs/01-INSTALLATION.md`](https://github.com/devbymarks/informix-linux-admin-toolkit/blob/main/docs/01-INSTALLATION.md).

### 💾 2. Storage e logs

Depois, consulte [`docs/02-STORAGE-AND-LOGS.md`](https://github.com/devbymarks/informix-linux-admin-toolkit/blob/main/docs/02-STORAGE-AND-LOGS.md).

### 💾 3. Backup

Para a rotina de backup, consulte [`docs/03-BACKUP.md`](https://github.com/devbymarks/informix-linux-admin-toolkit/blob/main/docs/03-BACKUP.md).

### 🛠️ 4. Troubleshooting

Em caso de problema, utilize [`docs/04-TROUBLESHOOTING.md`](https://github.com/devbymarks/informix-linux-admin-toolkit/blob/main/docs/04-TROUBLESHOOTING.md).

---

## ⚙️ Scripts principais

### 💾 `backup_level0.sh`

Executa uma rotina de backup nível 0 usando `ontape`, registra informações da instância e cria snapshots dos arquivos de configuração selecionados.

Exemplo:

```
BACKUP_DIR=/backup/ontape \
LOG_FILE=/var/log/informix/backup_level0.log \
./scripts/backup_level0.sh
```

> O destino e a configuração do `ontape` devem ser revisados antes do uso em produção.

### 🧾 `create_logical_logs.sh`

Automatiza a inclusão de logical logs em um dbspace.

```
./scripts/create_logical_logs.sh 95 dbs_log 20000
```

Parâmetros:

```
<quantidade> [dbspace] [tamanho_kb]

```

### 📊 `extents_report.ksh`

Gera um relatório de extents e utilização das tabelas de uma base Informix.

```
./scripts/extents_report.ksh demo_db > extents-demo_db.txt
```

---

## 🔎 Comandos de diagnóstico

Verificar o estado da instância:

```
onstat -
```

Ver usuários e sessões:

```
onstat -u
```

Ver mensagens recentes:

```
onstat -m
```

Ver dbspaces e chunks:

```
onstat -d
```

Ver logical logs:

```
onstat -l
```

Esses comandos são referências rápidas; a interpretação da saída depende do estado da instância e da versão do Informix.

---

## 🧰 Tecnologias e conhecimentos demonstrados

- **Linux Server**
- **IBM Informix Dynamic Server**
- **Bash / KornShell**
- **SQL**
- **Dbspaces e chunks**
- **Logical Log e Physical Log**
- **`ontape`**
- **`onstat`, `onspaces`, `onparams` e `onmode`**
- **Automação de rotinas administrativas**
- **Backup e recuperação**
- **Troubleshooting de infraestrutura**
- **Permissões e organização de filesystem**
- **Documentação técnica**

---

## ✅ Pré-requisitos

Para reproduzir o laboratório, você precisa de:

- um servidor Linux;
- IBM Informix instalado por um meio autorizado/licenciado;
- usuário administrativo para preparação do sistema;
- usuário `informix` para as rotinas da instância;
- espaço em disco suficiente para os chunks e backups;
- conhecimento básico de Linux, shell e administração de banco de dados.

A referência histórica deste projeto utiliza **IBM Informix 11.70 FC7 em Linux 64 bits**. Comandos e parâmetros devem ser revisados antes de serem utilizados em versões diferentes.

---

## 🔐 Segurança

Este projeto foi sanitizado para publicação pública. **Não coloque no GitHub informações do ambiente real.**

Nunca publique:

- senhas;
- tokens ou chaves privadas;
- IPs de ambientes reais quando não forem apropriados para divulgação;
- dados de clientes;
- dumps ou backups reais;
- certificados privados;
- arquivos completos de configuração de produção sem revisão;
- instaladores proprietários.

Os exemplos deste repositório utilizam valores fictícios ou reservados para documentação, como `ol_demo` e `192.0.2.10`.

Consulte [`SECURITY.md`](https://github.com/devbymarks/informix-linux-admin-toolkit/blob/main/SECURITY.md) antes de publicar alterações.

---

## ⚠️ Atenção: comandos potencialmente destrutivos

Algumas operações administrativas do Informix podem alterar estruturas críticas ou causar perda de dados quando executadas incorretamente.

Por exemplo:

```
oninit -i
```

A inicialização com `-i` deve ser usada somente em uma instância nova e após confirmar `INFORMIXSERVER`, `ONCONFIG`, `ROOTPATH` e o plano de recuperação.

**Nunca execute comandos destrutivos em produção apenas copiando exemplos deste repositório.**

---

## 🛡️ Boas práticas adotadas

- exemplos separados dos arquivos reais de ambiente;
- nenhum segredo armazenado no código;
- permissões mais restritivas nos exemplos de backup;
- documentação organizada por etapa;
- scripts com validação básica de variáveis e comandos;
- nomes de hosts e endereços sanitizados;
- alertas explícitos para operações destrutivas;
- `.gitignore` para evitar o versionamento de arquivos gerados.

---

## 🚀 Roadmap

Próximas evoluções planejadas:

- 🧪 Validação automática dos pré-requisitos do servidor;
- ⚙️ Instalação parametrizada por arquivo de configuração;
- 🧪 Validação automática do resultado do backup;
- 🗂️ Política de retenção de backups;
- 📊 Monitoramento de utilização de dbspaces;
- 🚨 Alertas para logical/physical logs;
- 📄 Geração de relatórios em CSV/HTML;
- 🧪 Testes automatizados dos scripts em laboratório;
- 📚 Documentação de restore e teste de recuperação.

---

## 👨‍💻 Autor

**Matheus Barcelli**

Projeto desenvolvido como material de estudo, documentação técnica e portfólio na área de **Linux, infraestrutura, banco de dados e automação**.

---

## ⭐ Apoie o projeto

Se este projeto foi útil para você, considere deixar uma ⭐ no repositório.

Se quiser contribuir com melhorias, documentação ou novas rotinas, fique à vontade para abrir uma **Issue** ou enviar um **Pull Request**.

---

## 📄 Licença

Este projeto está disponível sob a licença **MIT**.

IBM e Informix são marcas de seus respectivos proprietários. Este é um projeto independente, educacional e de portfólio, sem vínculo oficial com a IBM.