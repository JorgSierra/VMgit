#!/bin/bash

chequeoActivo=$(systemctl status apache2 | grep running | wc -l)

if [[ $chequeoActivo ]]; then
    echo "Apache activo"
else
    echo "Apache inactivo"
fi
