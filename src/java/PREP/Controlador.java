package PREP;

import java.io.IOException;
import java.io.PrintWriter;
import java.security.InvalidParameterException;
import java.sql.SQLException;
import java.util.Enumeration;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.annotation.Resource;
import javax.mail.MessagingException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;

@WebServlet(name = "Controlador", urlPatterns = {"/Controlador"})
public class Controlador extends HttpServlet {

    private Modelo modeloUsuarios;

    @Resource(mappedName = "jdbc/prep")
    DataSource ds;

    @Override
    public void init() throws ServletException {
        super.init();
        try {
            modeloUsuarios = new Modelo(ds);
        } catch (Exception e) {
            throw new ServletException(e);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        RequestDispatcher vista;
        Modelo modelo = new Modelo();
        int idUsuario;
        String Comando = request.getParameter("accion");
        try {
            if (Comando != null) {
                switch (Comando) {
                    case "Ingresar":
                        Ingresar(request, response);
                        break;

                    case "Registrar":
                        Registrar(request, response);
                        break;

                    case "Recuperar":
                        Recuperar(request, response);
                        break;

                    case "Cerrar":
                        CerrarSesion(request, response);
                        break;

                    case "AdministrarUsuarios":
                        List<Usuarios> lista = modelo.consultarUsuarios();
                        request.setAttribute("Usuarios", lista);
                        vista = request.getRequestDispatcher("AdministrarUsuarios.jsp");
                        vista.forward(request, response);
                        break;

                    case "ActualizarUsuarios":
                        request.setAttribute("idUsuario", request.getParameter("idUsuario"));
                        vista = request.getRequestDispatcher("ModificarUsuario.jsp");
                        vista.forward(request, response);
                        break;

                    case "ActualizarUsuario":
                        Actualizar(request, response);
                        break;

                    case "BorrarUsuario":
                        idUsuario = Integer.parseInt(request.getParameter("idUsuario"));
                        modelo.eliminarUsuario(idUsuario);
                        vista = request.getRequestDispatcher("Controlador?accion=AdministrarUsuarios");
                        vista.forward(request, response);
                        break;

                    case "RegistrarVotos":
                        RegistrarVotos(request, response);
                        break;

                    case "AdministrarVotos":
                        AdministrarVotos(request, response);
                        break;

                    case "CargarRegistro":
                        CargarRegistro(request, response);
                        break;

                    case "EditarRegistro":
                        EditarRegistro(request, response);
                        break;

                    case "BorrarRegistro":
                        BorrarRegistro(request, response);
                        break;
                        
                    case "GenerarReporte":
                        GenerarReporte(request,response);
                        break;
                        
                    default:
                        response.sendRedirect("Comprobar.jsp");
                        break;
                }
            } else {
                response.sendRedirect("Comprobar.jsp");
            }

        } catch (Exception e) {
            try {
                this.getServletConfig().getServletContext().getRequestDispatcher("/Mensaje.jsp").forward(request, response);
            } catch (Exception ex) {
                System.out.println("Error" + e.getMessage());
            }
        }
    }

    private void Ingresar(HttpServletRequest request, HttpServletResponse response) {
        try {
            HttpSession sesion;
            Modelo modelo;
            Usuarios usuario;
            usuario = this.obtenerUsuario(request);
            modelo = new Modelo(ds);
            usuario = modelo.Identificar(usuario);
            if (usuario != null && usuario.getCargo().getNombreCargo().equals("Administrador") && usuario.getEstado() == true) {
                //modelo.Conectar(usuario);
                sesion = request.getSession();
                sesion.setAttribute("Administrador", usuario);
                request.setAttribute("msje", "Bienvenido al sistema");
                this.getServletConfig().getServletContext().getRequestDispatcher("/FormularioAdministrador.jsp").forward(request, response);
            } else if (usuario != null && usuario.getCargo().getNombreCargo().equals("Capturista") && usuario.getEstado() == true) {
                //modelo.Conectar(usuario);
                sesion = request.getSession();
                sesion.setAttribute("Capturista", usuario);
                this.getServletConfig().getServletContext().getRequestDispatcher("/FormularioCapturista.jsp").forward(request, response);
            } else if (usuario != null && usuario.getEstado() == false) {
                request.setAttribute("msje", "Validación pendiente");
                request.getRequestDispatcher("/Comprobar.jsp").forward(request, response);
            } else {
                request.setAttribute("msje", "Credenciales Incorrectas");
                request.getRequestDispatcher("/Comprobar.jsp").forward(request, response);
            }
        } catch (Exception ex) {
            Logger.getLogger(Controlador.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    private Usuarios obtenerUsuario(HttpServletRequest request) {
        Usuarios u = new Usuarios();
        u.setUsuario(request.getParameter("txtUsu"));
        u.setContrasena(request.getParameter("txtPass"));
        return u;
    }

    private void CerrarSesion(HttpServletRequest request, HttpServletResponse response) throws Exception {
        try {
            HttpSession sesion = request.getSession();

            if (sesion.getAttribute("Administrador") != null) {
                sesion.setAttribute("Administrador", null);
            } else if (sesion.getAttribute("Capturista") != null) {
                sesion.setAttribute("Capturista", null);
            }

            sesion.invalidate();
            response.sendRedirect("Comprobar.jsp");

        } catch (IOException ex) {
            Logger.getLogger(Controlador.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    private void Registrar(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String nomb = request.getParameter("txtNombres");
        String apell = request.getParameter("txtApellidos");
        String correo = request.getParameter("txtCorreoElectronico");
        String dir = request.getParameter("txtDireccion");
        String col = request.getParameter("txtColonia");
        String munic = request.getParameter("txtMunicipio");
        String cp = request.getParameter("txtCodigoPostal");
        String razonS = request.getParameter("txtRazonSocial");
        String telef = request.getParameter("txtNumero");
        String user = request.getParameter("txtUsuario");
        String contra = request.getParameter("txtPassword");
        String error = null;

        Usuarios NuevoUsuario = new Usuarios(nomb, apell, correo, dir, col, munic, cp, razonS, telef, user, contra);
        error = Modelo.registrarUsuario(NuevoUsuario, error);

        if (error != null) {
            request.setAttribute("msje", "Nombre de usuario o correo no disponible");
            RequestDispatcher rd = request.getRequestDispatcher("/RegistrarUsuarios.jsp");
            rd.forward(request, response);
        } else {
            request.setAttribute("msje", error);
            RequestDispatcher rd = request.getRequestDispatcher("/Comprobar.jsp");
            rd.forward(request, response);
        }
    }

    private void Actualizar(HttpServletRequest request, HttpServletResponse response) throws Exception {

        boolean estado = true;
        Cargo cargo = null;
        String nombreCargo;

        int id = Integer.parseInt(request.getParameter("txtIdUsuario"));
        String nombre = request.getParameter("txtNombre");
        String apellidos = request.getParameter("txtApellidos");
        String correo = request.getParameter("txtCorreoElectronico");
        String direccion = request.getParameter("txtDireccion");
        String colonia = request.getParameter("txtColonia");
        String municipio = request.getParameter("txtMunicipio");
        String cp = request.getParameter("txtCodigoPostal");
        String usuario = request.getParameter("txtUsuario");
        String contrasena = request.getParameter("txtPassword");
        String idCasilla = request.getParameter("txtIdCasilla");
        String razonSocial = request.getParameter("txtRazonSocial");
        String idCargo = request.getParameter("txtIdCargo");
        String telefono = request.getParameter("txtNumero");

        if (idCargo.equals("1")) {
            nombreCargo = "Administrador";
        } else {
            nombreCargo = "Capturista";
        }

        if (request.getParameter("txtEstado").equalsIgnoreCase("Aprobado")) {
            estado = true;
        } else {
            estado = false;
        }

        cargo = new Cargo((Integer.parseInt(idCargo)), nombreCargo, estado);
        Usuarios UsuarioEditado = new Usuarios(id, nombre, apellidos, correo, direccion, colonia, municipio, cp, usuario, contrasena, idCasilla, razonSocial, estado, cargo, idCargo, telefono);
        Modelo.editarUsuario(UsuarioEditado);

        RequestDispatcher rd = request.getRequestDispatcher("Controlador?accion=AdministrarUsuarios");
        rd.forward(request, response);

    }

    private void RegistrarVotos(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String tipoCasilla = request.getParameter("Casilla");
        String candidatura = request.getParameter("Candidatura");
        String partido = request.getParameter("Partido");
        String casilla = request.getParameter("txtNumeroCasilla");
        int seccional = Integer.parseInt(request.getParameter("txtSeccional"));
        int distrito = Integer.parseInt(request.getParameter("txtDistrito"));
        int votos = Integer.parseInt(request.getParameter("txtVotos"));

        Registro NuevoRegistro = new Registro(votos, distrito, seccional, partido, candidatura, casilla);
        Modelo.registrarVotos(NuevoRegistro);

        RequestDispatcher rd = request.getRequestDispatcher("/RegistrarVotosAdministrador.jsp");
        rd.forward(request, response);
    }

    private void AdministrarVotos(HttpServletRequest request, HttpServletResponse response) {
        List<Registro> Registro;

        try {
            Registro = Modelo.getVotos();
            request.setAttribute("ListaVotos", Registro);
            RequestDispatcher rd = request.getRequestDispatcher("AdministrarVotos.jsp");
            rd.forward(request, response);

        } catch (Exception e) {
            System.out.println(e);
        }
    }

    private void CargarRegistro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException, Exception {
        int idReg = Integer.parseInt(request.getParameter("IdRegistro"));
        Registro xRegistro = Modelo.getRegistro(idReg);
        request.setAttribute("Registro_Actualizar", xRegistro);
        RequestDispatcher rd = request.getRequestDispatcher("ModificarVoto.jsp");
        rd.forward(request, response);
    }

    private void EditarRegistro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
        int idRegistro = Integer.parseInt(request.getParameter("txtIdRegistro"));
        int votos = Integer.parseInt(request.getParameter("txtVotos"));
        int distrito = Integer.parseInt(request.getParameter("txtDistrito"));
        int seccional = Integer.parseInt(request.getParameter("txtSeccional"));
        String partido = request.getParameter("txtPartido");
        String candidatura = request.getParameter("txtCandidatura");
        String casilla = request.getParameter("txtCasilla");
        String tipoCasilla = request.getParameter("txtTipoCasilla");

        Registro RegistroEditado = new Registro(idRegistro, votos, distrito, seccional, partido, candidatura, casilla, tipoCasilla);

        Modelo.editarRegistro(RegistroEditado);

        RequestDispatcher rd = request.getRequestDispatcher("Controlador?accion=AdministrarVotos");
        rd.forward(request, response);
    }

    private void BorrarRegistro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
        int idRegistro = Integer.parseInt(request.getParameter("IdRegistro"));
        Modelo.eliminarRegistro(idRegistro);

        RequestDispatcher rd = request.getRequestDispatcher("Controlador?accion=AdministrarVotos");
        rd.forward(request, response);
    }

    private void Recuperar(HttpServletRequest request, HttpServletResponse response) throws IOException, MessagingException, InvalidParameterException, Exception {
        Modelo modelo;
        Usuarios user;
        user = obtenerCorreo(request);
        modelo = new Modelo(ds);
        user = modelo.RecuperarContrasena(user);

        try {
            if (user != null) {
                Mail m = new Mail("C:\\Users\\Usuario\\Desktop\\Sistema_PREP\\src\\conf\\configuracion.prop");
                System.out.println("Pasa la busqueda de prop");
                m.enviarEmail("Pograma de Resultados Electorales Preliminares - Recuperación de la Contraseña", "Hola, " + user.getNombre() + ". \n Su Contraseña es: " + user.getContrasena(), user.getCorreo());
                request.setAttribute("msje", "El Correo se Envió Exitosamente");
                request.getRequestDispatcher("/Comprobar.jsp").forward(request, response);
            } else {
                request.setAttribute("msje", "Ninguna Cuenta Registrada con esos Datos");
                request.getRequestDispatcher("/Recuperar.jsp").forward(request, response);
            }
        } catch (InvalidParameterException | IOException | MessagingException ex) {
            System.out.println(ex.getMessage());
        }
    }

    private Usuarios obtenerCorreo(HttpServletRequest request) {
        Usuarios us = new Usuarios();
        us.setUsuario(request.getParameter("txtUsuario"));
        us.setCorreo(request.getParameter("txtCorreoElectronico"));
        return us;
    }
    private void GenerarReporte(HttpServletRequest request, HttpServletResponse response) {
        List<Reporte> Reporte;
        HttpSession sesion = request.getSession();
        try {
            Reporte = Modelo.getReporte();
            request.setAttribute("ListaReportes", Reporte);           
            
            if(sesion.getAttribute("Administrador") != null){
            RequestDispatcher rd = request.getRequestDispatcher("GenerarReportesAdministrador.jsp");
            rd.forward(request, response);
            }else{
            RequestDispatcher rd = request.getRequestDispatcher("GenerarReportesCapturista.jsp");
            rd.forward(request, response);
            }              
        } catch (Exception e) {
            System.out.println(e);
        }
    }
}
