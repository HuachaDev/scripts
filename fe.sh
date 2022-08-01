#!/bin/bash
a_ruc=("$@")
#echo ${a_ruc[1]}
route="/var/www/mcets.fe/"

routes=(
    "/boletas"
    "/boletas/response"
    "/comunicacionbaja"
    "/comunicacionbaja/response"
    "/comunicacion_baja"
    "/comunicacion_baja/response"
    "/facturas"
    "/facturas/response"
    "/facturas/response/dummy"
    "/nota_credito"
    "/nota_credito/response"
    "/nota_credito/response/dummy"
    "/nota_debito"
    "/statuscdr"
    "/status_ra"
    "/status_ra/dummy"
    "/status_rc"
    "/status_rc/dummy"
)

if [[ ${#a_ruc[@]} > 0 ]]
then 
    for i in "${a_ruc[@]}"
        do
            if [[ ! -d $route$i ]]
            then
                mkdir $route$i
                    echo "*****Dir" $i "created*****"
            fi
            if [[ -d  $route$i  ]]
                then
                    for j in "${routes[@]}"
                    do
                        if [[ ! -d $route$i$j ]]
                        then
                             mkdir $route$i$j  
                        fi
                    done
            fi
            chmod 777 -R $route$i   
        done
else
    echo "*****Enter a ruc, please*****"
fi







