# Troubleshooting

## Verificar status geral

```bash
onstat -
```

## Ver usuários e sessões

```bash
onstat -u
```

## Ver mensagens da instância

```bash
onstat -m
```

## Ver dbspaces e chunks

```bash
onstat -d
```

## Ver logical logs

```bash
onstat -l
```

## Consultar o log online

O caminho depende de `MSGPATH` no ONCONFIG. No exemplo deste projeto:

```bash
tail -f /opt/IBM/informix/tmp/online.log
```

## Erros comuns a verificar

- variável `INFORMIXSERVER` incorreta;
- `ONCONFIG` apontando para arquivo errado;
- caminho do `sqlhosts` incorreto;
- porta não liberada;
- `ROOTPATH` ou chunks inexistentes;
- proprietário dos chunks diferente de `informix`;
- permissões insuficientes;
- falta de espaço em disco;
- dbspace ou logical log cheio;
- parâmetros incompatíveis com a versão utilizada.

## Relatório de extents

```bash
./scripts/extents_report.ksh demo_db > extents-demo_db.txt
```

O relatório consulta catálogos do banco e o `sysmaster` para mostrar fragmentação, quantidade de extents, páginas alocadas/usadas e percentual de utilização.
