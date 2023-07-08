<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
    if (session.getAttribute("Administrador") != null) {
%>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>Sistema PREP | Votos </title>
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
                                    <span class="hidden-xs"> ${ Administrador.usuario } </span>
                                </a>
                                <ul class="dropdown-menu">
                                    <!-- The user image in the menu -->
                                    <li class="user-header">
                                        <img src="dist/img/user2-160x160.jpg" class="img-circle" alt="User Image">

                                        <p>                    
                                            Bienvenido - ${ Administrador.usuario }
                                            <small> Usted es, ${ Administrador.cargo.nombreCargo } </small>
                                        </p>
                                    </li>
                                    <!-- Menu Footer-->
                                    <li class="user-footer">
                                        <div class="pull-right">
                                            <a href="Controlador?accion=Cerrar" class="btn btn-default btn-flat"> Cerrar Sesión </a>
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
                            <p> Bienvenido,  ${ Administrador.usuario } </p>
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
                            <a href="#"> <i class="glyphicon glyphicon-th-large"> </i> <span> Actas </span>
                                <span class="pull-right-container">
                                    <i class="fa fa-angle-left pull-right"> </i>
                                </span>
                            </a>
                            <ul class="treeview-menu">
                                <li> <a href="RegistrarVotosAdministrador.jsp"> <i class="fa fa-archive"> </i> Registrar Votos </a> </li>
                                <li> <a href="Controlador?accion=AdministrarVotos"> <i class="fa fa-tags"> </i> Modificar Votos </a> </li>
                            </ul>
                        </li>
                        <li class="treeview">
                            <a href="#"><i class="fa fa-cart-arrow-down"></i> <span> Usuarios </span>
                                <span class="pull-right-container">
                                    <i class="fa fa-angle-left pull-right"></i>
                                </span>
                            </a>
                            <ul class="treeview-menu">
                                <li><a href="Controlador?accion=AdministrarUsuarios"><i class="fa fa-tags"> </i> Administrar Usuarios </a> </li>
                            </ul>
                        </li>
                        <li class="treeview">
                            <a href="#"><i class="fa fa-area-chart"></i> <span> Estadísticas </span>
                                <span class="pull-right-container">
                                    <i class="fa fa-angle-left pull-right"></i>
                                </span>
                            </a>
                            <ul class="treeview-menu">
                                <li><a href="Controlador?accion=GenerarReporte"><i class="fa fa-bar-chart"></i> Generar Reporte de los Votos </a></li>
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
                        <li> <a href="FormularioAdministrador.jsp"> <i class="fa fa-dashboard"> </i> Inicio </a> </li>
                        <li class="active"> Panel Administrativo </li>
                    </ol>
                </section>

                <section class="content">
                    <div class = "social-auth-links text-center">
                        <h2> Captura de Datos </h2>
                    </div>
                    <form action="Controlador"  method="post">
                        <input type="hidden" name="accion" value="RegistrarVotos">
                        <div class="social-auth-links text-center">
                            <div class="row">
                                <div class="col-lg-3 col-xs-6">
                                </div>
                                <div class="col-lg-3 col-xs-6">
                                    <h3> Tipo de Casilla </h3>
                                    <select name="Casilla" class="form-control" label="Casilla" required>
                                        <option value=""> Casilla </option>
                                        <option value="Basica"> Básica </option>
                                        <option value="Contigua"> Contigua </option>
                                        <option value="Especial"> Especial </option>
                                        <option value="Ordinaria"> Ordinaria </option>
                                        <option value="Otra"> Otra </option>
                                    </select>
                                </div>
                                <div class="col-lg-3 col-xs-6">
                                    <h3> Candidatura </h3>
                                    <select name="Candidatura" class="form-control" label="Candidatura" required>
                                        <option value=""> Candidatura </option>
                                        <option value="Presidente Municipal"> Presidente Municipal </option>
                                        <option value="Diputado Local"> Diputado Local </option>
                                        <option value="Diputado Federal"> Diputado Federal </option>
                                    </select>
                                </div>
                            </div>
                            <div class="social-auth-links text-center">
                                <h3> Partido Político </h3>
                                <select name="Partido" class="form-control" label="Partido Político" required>
                                    <option value=""> Partido Político </option>
                                    <option value="PRI"> PRI </option>
                                    <option value="PAN"> PAN </option>
                                    <option value="PRD"> PRD </option>
                                    <option value="VERDE"> VERDE ECOLÓGISTA </option>
                                    <option value="PT"> PARTIDO DEL TRABAJO </option>
                                    <option value="MORENA"> MORENA </option>
                                    <option value="PES"> PES </option>
                                    <option value="RSP"> REDES SOCIALES PROGRESISTAS </option>
                                    <option value="FUERZAPORMEXICO"> FUERZA MÉXICO </option>
                                    <option value="MOVIMIENTOCIUDADANO"> MOVIMIENTO CIUDADANO </option>
                                    <option value="HAGAMOS"> HAGAMOS </option>
                                    <option value="SOMOS"> SOMOS </option>
                                    <option value="FUTURO"> FUTURO </option>
                                    <option value="PRI-PAN-PRD"> PAN-PRD-PRI </option>
                                    <option value="MORENA-PT-VERDE"> MORENA-VERDE-PT </option>
                                    <option value="INDEPENDIENTE"> INDEPENDIENTE </option>
                                    <option value="NULO"> NULO </option>
                                </select>
                            </div>
                        </div>
                        <br>
                        <br>
                        <div class="form-group has-feedback">
                            <div class="social-auth-links text-center">
                                <select name="txtNumeroCasilla" class="form-control" label="Casilla" required>
                                    <option value=""> Número de Casilla </option>
                                    <option value="TON-101"> TON-101 </option>
                                    <option value="TON-102"> TON-102 </option>
                                    <option value="TON-103"> TON-103 </option>
                                    <option value="TON-104"> TON-104 </option>
                                    <option value="TON-105"> TON-105 </option>
                                    <option value="TON-106"> TON-106 </option>
                                    <option value="TON-107"> TON-107 </option>
                                    <option value="TON-108"> TON-108 </option>
                                    <option value="TON-109"> TON-109 </option>
                                    <option value="TON-201"> TON-201 </option>
                                    <option value="TON-202"> TON-202 </option>
                                    <option value="TON-203"> TON-203 </option>
                                    <option value="TON-204"> TON-204 </option>
                                    <option value="TON-205"> TON-205 </option>
                                    <option value="TON-206"> TON-206 </option>
                                    <option value="TON-207"> TON-207 </option>
                                    <option value="TON-208"> TON-208 </option>
                                    <option value="TON-209"> TON-209 </option>
                                    <option value="TON-210"> TON-210 </option>
                                </select>
                            </div>
                            <span class="glyphicon glyphicon-info-sign form-control-feedback"> </span>
                        </div>
                        <div class="form-group has-feedback">
                            <input type="text" name="txtSeccional" id="txtSeccional"  class="form-control" placeholder="Seccional" required pattern="[0-9]{4}">
                            <span class="glyphicon glyphicon-info-sign form-control-feedback"> </span>
                        </div>
                        <div class="form-group has-feedback">
                            <div class="social-auth-links text-center">
                                <select name="txtDistrito" class="form-control" label="Distrito" required>
                                    <option value=""> Distrito </option>  
                                    <option value="7"> 7 </option>
                                    <option value="20"> 20 </option>
                                </select>
                            </div>
                            <span class="glyphicon glyphicon-info-sign form-control-feedback"> </span>
                        </div>
                        <div class="form-group has-feedback">
                            <input type="text" name="txtVotos" id="txtVotos" class="form-control" placeholder="N° Votos" required pattern="[0-9]{1,10}">
                            <span class="glyphicon glyphicon-info-sign form-control-feedback"> </span>
                        </div>
                        <div class="form-group has-feedback">
                            <input type = "submit" value ="Registrar" class = "btn btn-primary btn-block"/>
                        </div>
                    </form>
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
                <strong>Copyright &copy; 2021 <a href="https://www.udg.mx/"> Universidad de Guadalajara </a>.</strong> Todos los Derechos Reservados.
            </footer>

            <div class="control-sidebar-bg"></div>
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
<%
    } else {
        response.sendRedirect("RegistrarVotosCapturista.jsp");
    }
%>