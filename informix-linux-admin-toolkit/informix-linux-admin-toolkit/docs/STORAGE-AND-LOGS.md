# Dbspaces, chunks e logs

## Estrutura de referência

O ambiente que originou este projeto utilizava a seguinte divisão lógica:

| Área | Objetivo | Referência original |
|---|---|---:|
| `rootdbs` | estruturas internas | 400 MB |
| Physical Log | alterações físicas | 2 GB |
| Logical Log | transações | 3 GB |
| Temporário | operações temporárias | 2 GB |
| Dados | dados da aplicação | 10 GB |
| SysAdmin | banco administrativo | 5 GB |

Os números acima são **referências históricas do laboratório**, não recomendações universais de sizing.

## Criar dbspaces

Os comandos abaixo usam o diretório público de exemplo e tamanhos ilustrativos. Confirme a unidade esperada por sua versão do Informix antes de executar.

### Physical Log

```bash
onspaces -c -d dbs_plog \
  -p /opt/IBM/ifmxdata/ol_demo/dbs_plog_dat.000 \
  -o 0 -s <SIZE_KB>
```

### Logical Log

```bash
onspaces -c -d dbs_log \
  -p /opt/IBM/ifmxdata/ol_demo/dbs_log_dat.000 \
  -o 0 -s <SIZE_KB>
```

### Temporário

```bash
onspaces -c -d dbs_temp -k 4 -t \
  -p /opt/IBM/ifmxdata/ol_demo/dbs_temp_dat.000 \
  -o 0 -s <SIZE_KB>
```

### Dados

```bash
onspaces -c -d dbs_data -k 4 \
  -p /opt/IBM/ifmxdata/ol_demo/dbs_data_dat.000 \
  -o 0 -s <SIZE_KB>
```

### SysAdmin

```bash
onspaces -c -d dbs_sysadmin \
  -p /opt/IBM/ifmxdata/ol_demo/dbs_sysadmin_dat.000 \
  -o 0 -s <SIZE_KB>
```

## Logical Logs

O procedimento original partia dos 5 logical logs criados inicialmente e adicionava novos logs em um dbspace dedicado.

Para automatizar a inclusão, utilize:

```bash
scripts/create_logical_logs.sh 95 dbs_log 20000
```

O script apenas executa a inclusão. Alteração de ponteiros, exclusão dos logs antigos e backups devem ser tratados como operações administrativas separadas e validadas manualmente.

Comandos de acompanhamento:

```bash
onstat -l
onmode -l
```

## Backup antes de alterações críticas

O procedimento original executava backup nível 0 durante a reorganização dos logical logs:

```bash
ontape -s -L 0
```

Não remova logs antigos sem confirmar o estado da instância e a estratégia de recuperação.

## Physical Log

A movimentação do Physical Log para um dbspace dedicado pode ser executada com `onparams -p`.

Exemplo parametrizado:

```bash
onparams -p -s <SIZE_KB> -d dbs_plog -y
```

O tamanho do physical log precisa caber no dbspace escolhido.

## Espaço temporário

No ONCONFIG:

```text
DBSPACETEMP dbs_temp
```

Após alteração de parâmetros que exijam reinício, utilize o procedimento operacional aprovado para sua instância.

## SysAdmin

O banco SysAdmin pode ser realocado para um dbspace dedicado utilizando a rotina disponível em `sql/reset_sysadmin.sql`.
