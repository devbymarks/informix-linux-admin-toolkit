#!/usr/bin/env bash
set -euo pipefail

COUNT="${1:-95}"
DBSPACE="${2:-dbs_log}"
SIZE_KB="${3:-20000}"

if ! [[ "$COUNT" =~ ^[0-9]+$ ]] || [ "$COUNT" -le 0 ]; then
  echo "Uso: $0 <quantidade> [dbspace] [tamanho_kb]" >&2
  exit 1
fi

command -v onparams >/dev/null 2>&1 || {
  echo "Erro: onparams não encontrado no PATH." >&2
  exit 1
}

echo "Criando $COUNT logical log(s) no dbspace '$DBSPACE' com $SIZE_KB KB cada."

for ((i=1; i<=COUNT; i++)); do
  echo "[$i/$COUNT] onparams -a -d $DBSPACE -s $SIZE_KB"
  onparams -a -d "$DBSPACE" -s "$SIZE_KB"
done

echo "Concluído. Valide o resultado com: onstat -l"
