#!/bin/bash

# Defina as informações de conexão
HOST="db_ecommerce.l70cnn1573.mysql.dbaas.com.br"
USER="db_ecommerce"
PASSWORD="A35YEok%J5a88p"

# Obtenha uma lista de todos os bancos de dados que o usuário db_ecommerce tem acesso
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
