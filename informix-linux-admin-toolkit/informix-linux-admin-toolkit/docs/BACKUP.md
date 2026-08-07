# Backup nível 0 com ontape

O material original possuía uma rotina agendada para executar backup nível 0 e registrar informações da instância.

Este projeto mantém a ideia, mas remove permissões excessivas (`chmod 777`) e dados específicos do ambiente.

## Script

Arquivo:

```text
scripts/backup_level0.sh
```

Ele executa:

1. validação das variáveis de ambiente;
2. registro de início do backup;
3. `ontape -s -L 0`;
4. `onstat -d` para inventário dos dbspaces;
5. `onstat -` para registrar a versão/estado da instância;
6. cópia dos arquivos de configuração escolhidos;
7. registro do resultado em log.

## Preparar diretórios

Exemplo como `root`:

```bash
install -d -o informix -g informix -m 0750 /backup/ontape
install -d -o informix -g informix -m 0750 /var/log/informix
```

## Executar

Como usuário `informix`:

```bash
BACKUP_DIR=/backup/ontape \
LOG_FILE=/var/log/informix/backup_level0.log \
./scripts/backup_level0.sh
```

## Agendamento com cron

O procedimento original executava a rotina às 22:00.

Exemplo:

```cron
0 22 * * * /usr/local/bin/backup_level0.sh
```

Revise horário, retenção, destino, capacidade do filesystem e monitoramento antes de usar em produção.

## Observação importante

`ontape` depende da configuração de backup presente no ONCONFIG e pode exigir configuração adicional para operar sem interação.

Nunca considere um backup válido apenas porque o comando terminou. Um processo de backup deve incluir validação, retenção e testes periódicos de restauração.
