#!/bin/bash

# Defina as informações de conexão
HOST="db-primitecnologia-1.cnhctv90ciq3.us-east-1.rds.amazonaws.com"
USER="admin"
PASSWORD="chdkC36bVYRBBKm6"

# Obtenha uma lista de todos os bancos de dados que o usuário admin tem acesso
DATABASES=$(mysql --host="$HOST" --user="$USER" --password="$PASSWORD" -e "SHOW DATABASES;" | grep -v Database)

# Defina o diretório de destino para os arquivos de backup
BACKUP_DIR="/caminho/para/o/diretorio/de/backup"

# Obtenha a data e hora atual
DATETIME=$(date +\%Y\%m\%d_\%H\%M\%S)

# Loop através da lista de bancos de dados e crie um backup para cada um
for DB in $DATABASES
do
  OUTPUT_FILE="$BACKUP_DIR/${DB}_${DATETIME}.sql"
  mysqldump --host="$HOST" --user="$USER" --password="$PASSWORD" "$DB" > "$OUTPUT_FILE"
  echo "Backup do banco de dados $DB concluído e salvo em $OUTPUT_FILE"
done
