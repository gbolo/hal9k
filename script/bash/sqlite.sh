# Extract blog from sqlite db:
sqlite3 tlsca.db "SELECT quote(column_name) FROM table_name WHERE id = 1;" | cut -d\' -f2 | xxd -r -p  > data.bin
