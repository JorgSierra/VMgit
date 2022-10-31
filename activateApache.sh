#!/bin/bash

chequeoActivo=$(systemctl status apache2 | grep running | wc -l)

if [[ $chequeoActivo -ge 1 ]]; then
    echo "Apache activo"
else
    echo "Apache inactivo"
fi
