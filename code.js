// **************************************
// ************* Eventos ****************
// **************************************

function events() {
    $('#start').click(start_click);
    $('#inicio').click(inicio_click);
}

function start_click() {
    var parametros = { id: 0, desc: 'desc' };
    sndsvr('comando.php', parametros, start_click_res);
}

function start_click_res(response) {
    var jdatos = JSON.parse(response);
    $("#comando").html(jdatos.id+jdatos.desc);

}

function inicio_click() {
    $("#inicio_res").html("");
    $("#inicio").prop('disabled', true); // Disable
    sndsvr('inicio.php', null, inicio_click_res);
}

function inicio_click_res(response) {
    $("#inicio_res").html(response);
    $("#inicio").prop('disabled', false); // Enable

}

// **************************************
// *********** Fin eventos **************
// **************************************


function sndsvr(comando, parametros=null, func) {
    $.ajax({
        data: parametros,
        url: comando,
        type: 'post',
        success: function (response) {
            func(response);
        }
    });
}

// **************************************
// ************* Inicio *****************
// **************************************
$(document).ready(function () {
    events();
    
});
