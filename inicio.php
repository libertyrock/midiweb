<?php

shell_exec("./inicio.sh 1> out");
$gestor = @fopen('out', 'r');
if ($gestor) {
    while (($bufer = fgets($gestor, 4096)) !== false) {
        echo '<span>'.$bufer.'<span>';
    }

    if (!feof($gestor)) {
        echo 'Error: fallo inesperado de fgets()\n';
    }
    fclose($gestor);
}
