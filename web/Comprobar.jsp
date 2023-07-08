<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">

        <title> Sistema PREP | Inicio de Sesion </title>
        <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
        <link rel="stylesheet" href="bower_components/bootstrap/dist/css/bootstrap.min.css">
        <link rel="stylesheet" href="bower_components/font-awesome/css/font-awesome.min.css">
        <link rel="stylesheet" href="bower_components/Ionicons/css/ionicons.min.css">
        <link rel="stylesheet" href="dist/css/AdminLTE.min.css">
        <link rel="stylesheet" href="plugins/iCheck/square/blue.css">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">
    </head>

    <body class="hold-transition login-page">
        <div class="login-box">
            <div class="login-logo">
                <b> Instituto Nacional Electoral </b>
            </div>
            <!-- /.login-logo -->
            <div class="login-box-body">
                <h3 class="login-box-msg"> Iniciar Sesión </h3>

                <form action="http://localhost:8080/Sistema_PREP/Controlador"  method="post">
                    <input type="hidden" name="accion" value="Ingresar">
                    <div class="form-group has-feedback">
                        <input type="text" name="txtUsu" id="txtUsu" value="" class="form-control"  placeholder="Usuario">
                        <span class="glyphicon glyphicon-envelope form-control-feedback"> </span>
                    </div>
                    <div class="form-group has-feedback">
                        <input type="password" name="txtPass" id="txtPass" value="" class="form-control" placeholder="Contraseña">
                        <span class="glyphicon glyphicon-lock form-control-feedback"> </span>
                    </div>
                    <div class="social-auth-links text-center">
                        <div class="social-auth-links text-center">
                            <input type = "submit" value ="Ingresar" class = "btn btn-primary btn-block"/>
                        </div>
                    </div>
                </form>
                
                <div class = "social-auth-links text-center">
                    <a href = "#" class="btn btn-block btn-social btn-facebook btn-flat"> 
                        <i class="fa fa-info">
                        </i> Mensaje: 
                        ${ msje }
                    </a>
                </div>
                    
                <div class = "social-auth-links text-center">
                    ¿Olvidaste tu Contraseña? 
                    <a href = "Recuperar.jsp" class="text-center"> Recuperar </a>
                    <br>
                    ¿Eres Nuevo? 
                    <a href = "RegistrarUsuarios.jsp" class="text-center"> Registrar </a>
                    <br>
                </div>
                    
            </div>
            <!-- /.login-box-body -->
        </div>
        <!-- /.login-box -->

        <!-- jQuery 3 -->
        <script src = "bower_components/jquery/dist/jquery.min.js"> </script>
        <!-- Bootstrap 3.3.7 -->
        <script src = "bower_components/bootstrap/dist/js/bootstrap.min.js"> </script>
        <!-- iCheck -->
        <script src = "plugins/iCheck/icheck.min.js"> </script>

        <script>
            $(function () {
                $('input').iCheck({
                    checkboxClass: 'icheckbox_square-blue',
                    radioClass: 'iradio_square-blue',
                    increaseArea: '20%'
                });
            });
        </script>
    </body>
</html>
