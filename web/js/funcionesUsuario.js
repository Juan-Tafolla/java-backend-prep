$(document).ready(function () {
    $("tr #deleteUser").click(function (e) {
        e.preventDefault();
        var cod = $(this).parent().find('#codigo').val();
        console.log(cod);
        swal({
            title: "¿Esta Seguro de Eliminar a este Usuario?",
            text: "Una Vez Que Sea Eliminado No Podrá Recuperalo",
            type: "warning",
            showCancelButton: true,
            confirmButtonClass: "btn-danger",
            confirmButtonText: "Sí, Eliminar",
            cancelButtonText: "No, Cancelar",
            closeOnConfirm: false,
            closeOnCancel: false
        },
                function (isConfirm) {
                    if (isConfirm) {
                        borrarUsuario(cod);
                        swal("Eliminado", "El Usuario se ha Eliminado", "success");
                        setTimeout(function () {
                            parent.location.href = "Controlador?accion=AdministrarUsuarios";
                        }, 1800);
                    } else {
                        swal("Cancelado", "El Usuario NO se ha Eliminado", "error");
                    }
                });
    });

    $("tr #deleteVote").click(function (e) {
        e.preventDefault();
        var cod = $(this).parent().find('#codigo').val();
        console.log(cod);
        swal({
            title: "¿Esta Seguro de Eliminar este Registro?",
            text: "Una Vez Que Sea Eliminado No Podrá Recuperalo",
            type: "warning",
            showCancelButton: true,
            confirmButtonClass: "btn-danger",
            confirmButtonText: "Sí, Eliminar",
            cancelButtonText: "No, Cancelar",
            closeOnConfirm: false,
            closeOnCancel: false
        },
                function (isConfirm) {
                    if (isConfirm) {
                        borrarVoto(cod);
                        swal("Eliminado", "El Registro se ha Eliminado", "success");
                        setTimeout(function () {
                            parent.location.href = "Controlador?accion=AdministrarVotos";
                        }, 1800);
                    } else {
                        swal("Cancelado", "El Registro NO se ha Eliminado", "error");
                    }
                });
    });

    function borrarUsuario(cod) {
        var url = "Controlador?accion=BorrarUsuario&idUsuario=" + cod;
        console.log("Borrado");
        $.ajax({
            type: 'GET',
            url: url,
            async: true,
            success: function (r) {

            }
        });
    }
    function borrarVoto(cod) {
        var url = "Controlador?accion=BorrarRegistro&IdRegistro=" + cod;
        console.log("Borrado");
        $.ajax({
            type: 'GET',
            url: url,
            async: true,
            success: function (r) {

            }
        });
    }
});

