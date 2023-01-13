#!/bin/bash

a_domain=("$@")
route_domain="/var/www/ssl/"

star="STAR_"
com="_COM"

 
country=""
state=""
locality=""
organization=""
organizationalunit=""
email=""


if [[ ${#a_domain[@]} > 0 ]]
then
    for i in "${a_domain[@]}"
        do
            if [[ ! -d $route_domain$i ]]
            then
                mkdir $route_domain$i
                echo "*****Domain" $i "folder created*****"
            fi
           if [[ -d $route_domain$i ]]
            then
             cd $route_domain$i && sudo openssl genrsa -out  $star$i$com.key  4096 
             sudo openssl req -out $star$i$com.csr -key $star$i$com.key -new -sha256 \
             -subj "/C=$country/ST=$state/L=$locality/O=$organization/OU=$organizationalunit/CN=*$i.com/emailAddress=$email"
             sudo chmod 777 -R $route_domain$i
             echo "***** Certificate Created*****"
           fi
        done
else
    echo "*****Enter a domain please*****"
fi
 