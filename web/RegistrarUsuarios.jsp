<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>Sistema PREP | Registro de Usuarios </title>
        <!-- Tell the browser to be responsive to screen width -->
        <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
        <link rel="stylesheet" href="bower_components/bootstrap/dist/css/bootstrap.min.css">
        <!-- Font Awesome -->
        <link rel="stylesheet" href="bower_components/font-awesome/css/font-awesome.min.css">
        <!-- Ionicons -->
        <link rel="stylesheet" href="bower_components/Ionicons/css/ionicons.min.css">
        <!-- Theme style -->
        <link href="dist/css/AdminLTE.min.css" rel="stylesheet" type="text/css"/>

        <!-- AdminLTE Skins. We have chosen the skin-blue for this starter
              page. However, you can choose any other skin. Make sure you
              apply the skin class to the body tag so the changes take effect. -->
        <link rel="stylesheet" href="dist/css/skins/skin-blue.min.css">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">
    </head>

    <body class="hold-transition skin-blue sidebar-mini">
        <div class="wrapper">

            <!-- Main Header -->
            <header class="main-header">
                <a href="#" class="logo">
                    <!-- mini logo for sidebar mini 50x50 pixels -->
                    <span class="logo-mini"> <b> S </b> PREP </span>
                    <!-- logo for regular state and mobile devices -->
                    <span class="logo-lg"> <b> Sistema </b> PREP </span>
                </a>

                <!-- Header Navbar -->
                <nav class="navbar navbar-static-top" role="navigation">
                    <!-- Sidebar toggle button-->
                    <a href="#" class="sidebar-toggle" data-toggle="push-menu" role="button">
                        <span class="sr-only"> Toggle navigation </span>
                    </a>
                    <!-- Navbar Right Menu -->
                    <div class="navbar-custom-menu">
                        <ul class="nav navbar-nav">
                            <!-- User Account Menu -->
                            <li class="dropdown user user-menu">
                                <!-- Menu Toggle Button -->
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                                    <!-- The user image in the navbar-->
                                    <img src="dist/img/user2-160x160.jpg" class="user-image" alt="User Image">
                                    <!-- hidden-xs hides the username on small devices so only the image appears. -->
                                    <span class="hidden-xs"> Usuario Nuevo </span>
                                </a>
                                <ul class="dropdown-menu">
                                    <!-- The user image in the menu -->
                                    <li class="user-header">
                                        <img src="dist/img/user2-160x160.jpg" class="img-circle" alt="User Image">

                                        <p>                    
                                            Bienvenido - Registro de Usuarios
                                            <small> Usted quiere, Registrarse </small>
                                        </p>
                                    </li>
                                    <!-- Menu Footer-->
                                    <li class="user-footer">
                                        <div class="pull-right">
                                            <a href="Comprobar.jsp" class="btn btn-default btn-flat"> Regresar </a>
                                        </div>
                                    </li>
                                </ul>
                            </li>
                        </ul>
                    </div>
                </nav>
            </header>
            <!-- Left side column. contains the logo and sidebar -->
            <aside class="main-sidebar">

                <!-- sidebar: style can be found in sidebar.less -->
                <section class="sidebar">

                    <!-- Sidebar user panel (optional) -->
                    <div class="user-panel">
                        <div class="pull-left image">
                            <img src="dist/img/user2-160x160.jpg" class="img-circle" alt="User Image">
                        </div>
                        <div class="pull-left info">
                            <p> Bienvenido, al Registro </p>
                            <!-- Status -->
                            <a href="#"> <i class="fa fa-circle text-success"> </i> Online </a>
                        </div>
                    </div>

                    <!-- search form (Optional) -->
                    <form action="#" method="get" class="sidebar-form">
                        <div class="input-group">
                            <input type="text" name="q" class="form-control" placeholder="Search...">
                            <span class="input-group-btn">
                                <button type="submit" name="search" id="search-btn" class="btn btn-flat"> 
                                    <i class="fa fa-search"> </i>
                                </button>
                            </span>
                        </div>
                    </form>
                    <!-- /.search form -->

                    <!-- Sidebar Menu -->
                    <ul class="sidebar-menu" data-widget="tree">
                        <li class="header"> INICIO </li>
                        <!-- Optionally, you can add icons to the links -->
                        <li class="active"> <a href="#"> <i class="fa fa-link"></i> <span> Panel Administrativo </span> </a> </li>
                        <li class="treeview">
                            <a href="#"> <i class="glyphicon glyphicon-th-large"> </i> <span> Usuarios </span>
                                <span class="pull-right-container">
                                    <i class="fa fa-angle-left pull-right"> </i>
                                </span>
                            </a>
                            <ul class="treeview-menu">
                                <li> <a href="Comprobar.jsp"> <i class="fa fa-archive"> </i> Iniciar Sesión </a> </li>
                                <li> <a href="Recuperar.jsp"> <i class="fa fa-tags"> </i> Recuperar Datos </a> </li>
                            </ul>
                        </li>               
                    </ul>
                    <!-- /.sidebar-menu -->
                </section>
                <!-- /.sidebar -->
            </aside>

            <!-- Content Wrapper. Contains page content -->
            <div class="content-wrapper">
                <!-- Content Header (Page header) -->
                <section class="content-header">
                    <h1>
                        Instituto Nacional Electoral
                        <small> Programa de Resultados Preliminares </small>
                    </h1>
                    <ol class="breadcrumb">
                        <li><a href="Comprobar.jsp"> <i class="fa fa-dashboard"> </i> Inicio </a> </li>
                        <li class="active"> Panel Administrativo </li>
                    </ol>
                </section>

                <section class="content">
                    <div class="text-center">
                        <div class="login-box">
                            <div class="login-box-body">
                                <h3 class="login-box-msg"> Registrar Usuario </h3>
                                <form action="Controlador" method="post">
                                    <input type="hidden" name="accion" value="Registrar">
                                    <div class="form-group has-feedback">
                                        <input type="text" name="txtUsuario" id="txtUsuario" class="form-control"  placeholder="Usuario" required pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{5,20}">
                                        <span class="glyphicon glyphicon-user form-control-feedback"> </span>
                                    </div>
                                    <div class="form-group has-feedback">
                                        <input type="text" name="txtNombres" id="txtNombres"  class="form-control"  placeholder="Nombres" required>
                                        <span class="glyphicon glyphicon glyphicon-pencil form-control-feedback"> </span>
                                    </div>
                                    <div class="form-group has-feedback">
                                        <input type="text" name="txtApellidos" id="txtApellidos"  class="form-control"  placeholder="Apellidos" required>
                                        <span class="glyphicon glyphicon glyphicon-pencil form-control-feedback"> </span>
                                    </div>
                                    <div class="form-group has-feedback">
                                        <input type="text" name="txtCorreoElectronico" id="txtCorreoElectronico" class="form-control"  placeholder="Correo Electronico" required pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$">
                                        <span class="glyphicon glyphicon-envelope form-control-feedback"> </span>
                                    </div>
                                    <div class="form-group has-feedback">
                                        <input type="text" name="txtDireccion" id="txtDireccion" class="form-control"  placeholder="Dirección" required pattern="(?=.*\d)(?=.*[A-Za-z]).{5,}">
                                        <span class="glyphicon glyphicon glyphicon-home form-control-feedback"> </span>
                                    </div>
                                    <div class="form-group has-feedback">
                                        <input type="text" name="txtColonia" id="txtColonia" class="form-control"  placeholder="Colonia" required>
                                        <span class="glyphicon glyphicon glyphicon-home form-control-feedback"> </span>
                                    </div>
                                    <div class="form-group has-feedback">
                                        <input type="text" name="txtMunicipio" id="txtMunicipio" class="form-control"  placeholder="Municipio" required>
                                        <span class="glyphicon glyphicon-map-marker form-control-feedback"> </span>
                                    </div>
                                    <div class="form-group has-feedback">
                                        <input type="text" name="txtCodigoPostal" id="txtCodigoPostal"class="form-control"  placeholder="Código Postal" required pattern="[0-9]{5}">
                                        <span class="glyphicon glyphicon glyphicon-folder-open form-control-feedback"> </span>
                                    </div>
                                    <div class="form-group has-feedback">
                                        <input type="text" name="txtNumero" id="txtNumero" class="form-control"  placeholder="Número de Teléfono" required pattern="[0-9]{10}">
                                        <span class="glyphicon glyphicon glyphicon-earphone form-control-feedback"> </span>
                                    </div>
                                    <div class="form-group has-feedback">
                                        <input type="text" name="txtRazonSocial" id="txtRazonSocial" class="form-control"  placeholder="Razón Social" required>
                                        <span class="glyphicon glyphicon glyphicon-tags form-control-feedback"> </span>
                                    </div>
                                    <div class="form-group has-feedback">
                                        <input type="password" name="txtPassword" id="txtPassword" class="form-control" placeholder="********" required pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{5,20}">
                                        <span class="glyphicon glyphicon-lock form-control-feedback"> </span>
                                    </div>
                                    <div class="row">

                                        <div class = "col-xs-4">
                                            <input type="submit" value="Registrar" class="btn btn-primary btn-block">
                                        </div>

                                    </div>
                                </form>    
                            </div>

                            <br>

                            <div class = "social-auth-links text-center">
                                <a href = "#" class="btn btn-block btn-social btn-facebook btn-flat"> 
                                    <i class="fa fa-info">
                                    </i> Mensaje: 
                                    ${ msje }
                                </a>
                                <a href="Comprobar.jsp" class="btn btn-primary btn-block" role="button"> Regresar </a>
                            </div>

                            <br>   
                        </div> 
                    </div>
                </section>
                <!-- /.content -->
            </div>
            <!-- /.content-wrapper -->

            <!-- Main Footer -->
            <footer class="main-footer">
                <!-- To the right -->
                <div class="pull-right hidden-xs">
                    Ingeniería en Ciencias Computacionales
                </div>
                <!-- Default to the left -->
                <strong> Copyright &copy; 2021 
                    <a href="https://www.udg.mx/"> Universidad de Guadalajara </a> 
                </strong> Todos los Derechos Reservados.
            </footer>

            <div class="control-sidebar-bg"> </div>
        </div>
        <!-- ./wrapper -->

        <!-- REQUIRED JS SCRIPTS -->

        <!-- jQuery 3 -->
        <script src="bower_components/jquery/dist/jquery.min.js"></script>
        <!-- Bootstrap 3.3.7 -->
        <script src="bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
        <!-- AdminLTE App -->
        <script src="dist/js/adminlte.min.js"></script>

        <!-- Optionally, you can add Slimscroll and FastClick plugins.
             Both of these plugins are recommended to enhance the
             user experience. -->
    </body>
</html>