<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%
    if (session.getAttribute("Administrador") != null) {
%>

<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title> Sistema PREP | Votos </title>
        <!-- Tell the browser to be responsive to screen width -->
        <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
        <link rel="stylesheet" href="bower_components/bootstrap/dist/css/bootstrap.min.css">
        <!-- Font Awesome -->
        <link rel="stylesheet" href="bower_components/font-awesome/css/font-awesome.min.css">
        <!-- Ionicons -->
        <link rel="stylesheet" href="bower_components/Ionicons/css/ionicons.min.css">
        <!-- Theme style -->
        <link href="dist/css/AdminLTE.min.css" rel="stylesheet" type="text/css"/>
        <link href="swetalert/sweetalert.css" rel="stylesheet" type="text/css"/>

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
                                <li><a href="Controlador?accion=AdministrarUsuarios"> <i class="fa fa-tags"> </i> Administrar Usuarios </a> </li>
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
                        <li><a href="FormularioAdministrador.jsp"> <i class="fa fa-dashboard"> </i> Inicio </a> </li>
                        <li class="active"> Panel Administrativo </li>
                    </ol>
                </section>

                <section class="content">
                    <div class="text-center">
                        <h2> Registros </h2>
                        <div class="box-body">
                            <div class="table-responsive" >
                                <table class="table table-striped dataTable table-hover" border ='5' class="display">
                                    <thead class="thead-ligth">
                                        <tr>
                                            <th class="text-center"> Código de Registro </th>
                                            <th class="text-center"> Partido Político </th>
                                            <th class="text-center"> Candidatura</th>
                                            <th class="text-center"> Votos </th>
                                            <th class="text-center"> Tipo de Casilla </th>
                                            <th class="text-center"> Seccional </th>
                                            <th class="text-center"> Distrito </th>
                                            <th class="text-center"> Acciones </th>
                                        </tr>
                                    </thead>                  

                                    <c:forEach var="V" items="${ListaVotos}">
                                    <tbody>
                                        <tr>
                                            <td class="text-center">
                                                ${V.idRegistro}
                                            </td>
                                            <td class="text-center">
                                                ${V.partido}
                                            </td>
                                            <td class="text-center">
                                                ${V.candidatura}
                                            </td>
                                            <td class="text-center">
                                                ${V.votos}
                                            </td>
                                            <td class="text-center">
                                                ${V.tipoCasilla}
                                            </td>
                                            <td class="text-center">
                                                ${V.seccional}
                                            </td>
                                            <td class="text-center">
                                                ${V.distrito}
                                            </td>
                                            <td class="text-center">
                                                <a href = "Controlador?accion=CargarRegistro&IdRegistro=${V.idRegistro}" class="btn btn-primary" role="button"> Actualizar </a>
                                                <input type="hidden" id="codigo" value="${V.idRegistro}">
                                                <a id="deleteVote" href="<c:url value="Controlador">
                                                       <c:param name="accion" value="BorrarRegistro" />
                                                       <c:param name="IdRegistro" value="${V.idRegistro}" />
                                                   </c:url>"> <button type="button" class="btn btn-danger" data-toggle="tooltip"  title="Borrar" data-original-title="Borrar"> Borrar </button>
                                                </a>
                                            </td>
                                        </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </div>
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
        <script src="swetalert/sweetalert.js" type="text/javascript"></script>
        <script src="js/funcionesUsuario.js" type="text/javascript"></script>

        <!-- Optionally, you can add Slimscroll and FastClick plugins.
             Both of these plugins are recommended to enhance the
             user experience. -->
    </body>
</html>

<%    } else {
        response.sendRedirect("FormularioCapturista.jsp");
    }
%>
