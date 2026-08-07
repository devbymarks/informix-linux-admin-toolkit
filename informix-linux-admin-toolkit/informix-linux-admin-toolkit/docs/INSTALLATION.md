# Instalação e preparação do IBM Informix no Linux

> Este documento foi reescrito a partir de um procedimento operacional real e sanitizado para uso público. Ajuste caminhos, versão, recursos e políticas de segurança antes de qualquer uso.

## 1. Criar grupo e usuário

Execute como `root`:

```bash
groupadd informix
useradd -g informix -d /home/informix -m informix
passwd informix
```

Use uma senha forte e exclusiva. Nunca registre a senha no repositório.

## 2. Preparar diretório de instalação

```bash
mkdir -p /opt/Install
cd /opt/Install
```

Copie para esse diretório apenas o instalador obtido por um canal autorizado.

Exemplo genérico:

```bash
cp /caminho/IBM_INFORMIX_INSTALLER.tar /opt/Install/
cd /opt/Install
tar -xvf IBM_INFORMIX_INSTALLER.tar
```

Depois execute o instalador conforme a documentação da versão utilizada.

> O projeto original utilizou uma edição 64 bits do Informix 11.70 FC7. O nome exato do pacote não é distribuído neste repositório.

## 3. Instalar apenas os componentes necessários

Durante a instalação, valide principalmente:

- o diretório de instalação;
- os componentes selecionados;
- se uma instância de demonstração será ou não criada;
- proprietário e grupo dos arquivos.

Neste projeto, o diretório de referência é:

```text
/opt/IBM/informix
```

## 4. Preparar diretório dos chunks

Como `root`:

```bash
mkdir -p /opt/IBM/ifmxdata
chown -R informix:informix /opt/IBM/ifmxdata
chmod 750 /opt/IBM/ifmxdata
```

Criar a pasta da instância:

```bash
mkdir -p /opt/IBM/ifmxdata/ol_demo
chown -R informix:informix /opt/IBM/ifmxdata/ol_demo
```

## 5. Configurar variáveis de ambiente

Adicione ao perfil do usuário `informix` ou carregue o arquivo de exemplo deste projeto:

```bash
source configs/informix.env.example
```

Variáveis principais:

```bash
export INFORMIXSERVER=ol_demo
export INFORMIXDIR=/opt/IBM/informix
export ONCONFIG=onconfig.ol_demo
export INFORMIXSQLHOSTS=/opt/IBM/informix/etc/sqlhosts
export PATH="$PATH:$INFORMIXDIR/bin"
export TERM=vt100
```

## 6. Criar arquivos dos chunks

Como usuário `informix`:

```bash
cd /opt/IBM/ifmxdata/ol_demo

touch rootdbs_dat.000
touch dbs_plog_dat.000
touch dbs_log_dat.000
touch dbs_temp_dat.000
touch dbs_data_dat.000
touch dbs_sysadmin_dat.000

chmod 660 *.000
```

## 7. Configurar `sqlhosts`

Use o arquivo `configs/sqlhosts.example` como referência e adapte ao servidor.

Exemplo:

```text
ol_demo    onsoctcp    192.0.2.10    9088
```

## 8. Preparar ONCONFIG

Não copie o arquivo `onconfig.std` deste repositório: ele não é distribuído aqui.

Utilize o template fornecido pela sua instalação licenciada do Informix e revise os parâmetros necessários. O arquivo `configs/onconfig.project.example` contém somente uma pequena referência aos parâmetros utilizados no laboratório.

## 9. Inicialização da instância

### PERIGO: operação destrutiva

A inicialização com:

```bash
oninit -i
```

cria/inicializa estruturas de armazenamento e pode destruir uma instância existente se utilizada incorretamente.

Use apenas em uma instância nova, depois de validar `INFORMIXSERVER`, `ONCONFIG`, `ROOTPATH` e o plano de recuperação.

## 10. Validar a instância

```bash
onstat -
onstat -u
onstat -m
```

Se houver falha de inicialização, consulte o `MSGPATH` configurado no ONCONFIG. No layout deste projeto:

```text
/opt/IBM/informix/tmp/online.log
```

Próximo passo: [`STORAGE-AND-LOGS.md`](STORAGE-AND-LOGS.md).
