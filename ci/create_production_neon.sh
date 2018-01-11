#!/bin/bash
# We need to install dependencies only for Docker
[[ ! -e /.dockerenv ]] && exit 0

dir=$(cd `dirname $0` && pwd)

create_production_neon() {
    cat > "$dir/../app/config/config.local.neon" <<EOF
parameters:
    host: $1
    user: $2
    password: '$3'
    dbname: $4

parameters:

database:
		dsn: 'mysql:host=$1;dbname=$4'
		user: $2
		password: '$3'

EOF
}

create_production_neon $1 $2 $3 $4;

while [ "$1" != "" ]; 
do
   case $1 in
    -h | --help ) 
         echo "Usage: create_production_neon.sh HOST USER PASSWORD DB_NAME"
         echo "   -h | --help - displays this message"
         exit
      ;;
    * )
     ;;
  esac
  shift
done