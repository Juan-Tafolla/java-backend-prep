package PREP;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.sql.DataSource;

public class Modelo {

    private static DataSource origenDatos;

    public Modelo() {
    }

    public Modelo(DataSource origenDatos) {
        this.origenDatos = origenDatos;
    }

    public Usuarios Identificar(Usuarios user) throws Exception {
        Usuarios usu = null;
        Connection con = null;
        Statement stmt = null;
        ResultSet rs = null;

        String sql = "SELECT U.IDUSUARIO, C.NOMBRECARGO, U.ESTADO , U.IDCASILLA FROM USUARIOS U INNER JOIN CARGO C ON U.IDCARGO = C.IDCARGO WHERE U.USUARIO ='" + user.getUsuario() + "' AND U.Contrasena ='" + user.getContrasena() + "'";

        try {
            con = origenDatos.getConnection();
            stmt = con.createStatement();
            rs = stmt.executeQuery(sql);

            if (rs.next() == true) {
                usu = new Usuarios();
                usu.setId(rs.getInt("IDUSUARIO"));
                usu.setUsuario(user.getUsuario());
                usu.setCargo(new Cargo());
                usu.getCargo().setNombreCargo(rs.getString("NOMBRECARGO"));
                usu.setEstado(rs.getBoolean("ESTADO"));
                usu.setIdCasilla(rs.getString("IDCASILLA"));
            }
            return usu;
        } finally {
            rs.close();
            stmt.close();
            con.close();
        }
    }

    static String registrarUsuario(Usuarios NuevoUsuario, String msg) {
        try {
            Connection con = null;
            PreparedStatement pstmt = null;

            try {
                con = origenDatos.getConnection();

                String sql = "INSERT INTO Usuarios (Nombre,Apellidos,Correo,Direccion,Colonia,Municipio,CP,razonSocial,telefono,usuario,contrasena)"
                        + " VALUES(?,?,?,?,?,?,?,?,?,?,?)";
                pstmt = con.prepareStatement(sql);

                pstmt.setString(1, NuevoUsuario.getNombre());
                pstmt.setString(2, NuevoUsuario.getApellidos());
                pstmt.setString(3, NuevoUsuario.getCorreo());
                pstmt.setString(4, NuevoUsuario.getDireccion());
                pstmt.setString(5, NuevoUsuario.getColonia());
                pstmt.setString(6, NuevoUsuario.getMunicipio());
                pstmt.setString(7, NuevoUsuario.getCp());
                pstmt.setString(8, NuevoUsuario.getRazonSocial());
                pstmt.setString(9, NuevoUsuario.getTelefono());
                pstmt.setString(10, NuevoUsuario.getUsuario());
                pstmt.setString(11, NuevoUsuario.getContrasena());
                pstmt.execute();

            } finally {
                pstmt.close();
                con.close();
            }
        } catch (SQLException ex) {
            Logger.getLogger(Modelo.class.getName()).log(Level.SEVERE, null, ex);
            msg = ex.getMessage();
            return msg;
        }
        return msg = null;
    }

    public List<Usuarios> consultarUsuarios() throws Exception {
        ArrayList<Usuarios> lista = new ArrayList<>();
        Usuarios usu = null;
        Connection con = null;
        Statement stmt = null;
        ResultSet rs = null;

        String sql = "SELECT * FROM USUARIOS";

        try {
            con = origenDatos.getConnection();
            stmt = con.createStatement();
            rs = stmt.executeQuery(sql);

            while (rs.next() == true) {
                usu = new Usuarios();
                usu.setId(rs.getInt("IDUSUARIO"));
                usu.setNombre(rs.getString("NOMBRE"));
                usu.setApellidos(rs.getString("APELLIDOS"));
                usu.setCorreo(rs.getString("CORREO"));
                usu.setDireccion(rs.getString("DIRECCION"));
                usu.setColonia(rs.getString("COLONIA"));
                usu.setMunicipio(rs.getString("MUNICIPIO"));
                usu.setCp(rs.getString("CP"));
                usu.setUsuario(rs.getString("USUARIO"));
                usu.setContrasena(rs.getString("CONTRASENA"));
                usu.setIdCasilla(rs.getString("IDCASILLA"));
                usu.setRazonSocial(rs.getString("RAZONSOCIAL"));
                usu.setEstado(rs.getBoolean("ESTADO"));
                usu.setIdCargo(rs.getString("IDCARGO"));
                usu.setTelefono(rs.getString("TELEFONO"));
                lista.add(usu);
            }

        } finally {
            rs.close();
            stmt.close();
            con.close();
        }

        return lista;
    }

    public Usuarios consultarUsuario(int idUsuario) throws Exception {
        Usuarios usu = null;
        Connection con = null;
        Statement stmt = null;
        ResultSet rs = null;

        String sql = "SELECT * FROM USUARIOS WHERE IDUSUARIO = '" + idUsuario + "'";

        try {
            con = origenDatos.getConnection();
            stmt = con.createStatement();
            rs = stmt.executeQuery(sql);

            if (rs.next() == true) {
                usu = new Usuarios();
                usu.setId(rs.getInt("IDUSUARIO"));
                usu.setNombre(rs.getString("NOMBRE"));
                usu.setApellidos(rs.getString("APELLIDOS"));
                usu.setCorreo(rs.getString("CORREO"));
                usu.setDireccion(rs.getString("DIRECCION"));
                usu.setColonia(rs.getString("COLONIA"));
                usu.setMunicipio(rs.getString("MUNICIPIO"));
                usu.setCp(rs.getString("CP"));
                usu.setUsuario(rs.getString("USUARIO"));
                usu.setContrasena(rs.getString("CONTRASENA"));
                usu.setIdCasilla(rs.getString("IDCASILLA"));
                usu.setRazonSocial(rs.getString("RAZONSOCIAL"));
                usu.setEstado(rs.getBoolean("ESTADO"));
                usu.setTelefono(rs.getString("TELEFONO"));
                usu.setIdCargo(rs.getString("IDCARGO"));
            }

            return usu;

        } finally {
            rs.close();
            stmt.close();
            con.close();
        }
    }

    public boolean eliminarUsuario(int idUsuario) throws Exception {
        Connection con = null;
        Statement stmt = null;

        String sql = "DELETE FROM USUARIOS WHERE IDUSUARIO = '" + idUsuario + "'";
        try {
            con = origenDatos.getConnection();
            stmt = con.createStatement();
            stmt.executeUpdate(sql);

        } finally {
            stmt.close();
            con.close();
        }

        return true;
    }

    static void editarUsuario(Usuarios UsuarioEditado) {

        try {
            Connection con = null;
            PreparedStatement pstmt = null;

            try {
                con = origenDatos.getConnection();
                String sql = ("UPDATE Usuarios SET Nombre=?,Apellidos=?,Correo=?,Direccion=?,Colonia=?,Municipio=?,Cp=?,RazonSocial=?,Telefono=?,Usuario=?,Contrasena=?,Estado=?,IdCargo=? WHERE IdUsuario = ?");
                pstmt = con.prepareStatement(sql);

                pstmt.setString(1, UsuarioEditado.getNombre());
                pstmt.setString(2, UsuarioEditado.getApellidos());
                pstmt.setString(3, UsuarioEditado.getCorreo());
                pstmt.setString(4, UsuarioEditado.getDireccion());
                pstmt.setString(5, UsuarioEditado.getColonia());
                pstmt.setString(6, UsuarioEditado.getMunicipio());
                pstmt.setString(7, UsuarioEditado.getCp());
                pstmt.setString(8, UsuarioEditado.getRazonSocial());
                pstmt.setString(9, UsuarioEditado.getTelefono());
                pstmt.setString(10, UsuarioEditado.getUsuario());
                pstmt.setString(11, UsuarioEditado.getContrasena());
                pstmt.setBoolean(12, UsuarioEditado.getEstado());
                pstmt.setString(13, UsuarioEditado.getIdCargo());
                pstmt.setInt(14, UsuarioEditado.getId());

                pstmt.execute();

            } finally {
                pstmt.close();
                con.close();
            }

        } catch (SQLException ex) {
            Logger.getLogger(Modelo.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    static void registrarVotos(Registro NuevoRegistro) {
        try {
            Connection con = null;
            PreparedStatement pstmt = null;
            try {

                con = origenDatos.getConnection();
                String sql = "INSERT INTO Registro (Votos,Partido,Candidatura,Distrito,Seccional,Casilla)"
                        + " VALUES(?,?,?,?,?,?)";
                pstmt = con.prepareStatement(sql);

                pstmt.setInt(1, NuevoRegistro.getVotos());
                pstmt.setString(2, NuevoRegistro.getPartido());
                pstmt.setString(3, NuevoRegistro.getCandidatura());
                pstmt.setInt(4, NuevoRegistro.getDistrito());
                pstmt.setInt(5, NuevoRegistro.getSeccional());
                pstmt.setString(6, NuevoRegistro.getCasilla());
                pstmt.execute();

            } finally {
                pstmt.close();
                con.close();
            }
        } catch (SQLException ex) {
            Logger.getLogger(Modelo.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    static List<Registro> getVotos() throws SQLException {
        List<Registro> registro = new ArrayList<>();

        Connection con = null;
        Statement stmt = null;
        ResultSet rs = null;

        try {
            con = origenDatos.getConnection();
            String consulta = "SELECT R.*,C.TipoCasilla FROM REGISTRO R INNER JOIN CASILLA C ON R.CASILLA = C.IDCASILLA;";
            stmt = con.createStatement();
            rs = stmt.executeQuery(consulta);
            while (rs.next()) {
                int idRegistro = rs.getInt(1);
                int votos = rs.getInt(2);
                String partido = rs.getString(3);
                String candidatura = rs.getString(4);
                int distrito = rs.getInt(5);
                int seccional = rs.getInt(6);
                String casilla = rs.getString(7);
                String tipoCasilla = rs.getString(8);

                Registro tempReg = new Registro(idRegistro, votos, distrito, seccional, partido, candidatura, casilla, tipoCasilla);
                registro.add(tempReg);

            }

            return registro;
        } finally {
            rs.close();
            stmt.close();
            con.close();
        }

    }

    static Registro getRegistro(int idReg) throws SQLException, Exception {
        Registro reg = null;
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        int id = idReg;
        try {
            con = origenDatos.getConnection();
            String sql = ("SELECT R.*,C.TipoCasilla FROM REGISTRO R INNER JOIN CASILLA C ON R.CASILLA = C.IDCASILLA WHERE R.IDREGISTRO=?");
            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, id);
            rs = pstmt.executeQuery();
            if (rs.next()) {
                int idRegistro = rs.getInt(1);
                int votos = rs.getInt(2);
                String partido = rs.getString(3);
                String candidatura = rs.getString(4);
                int distrito = rs.getInt(5);
                int seccional = rs.getInt(6);
                String casilla = rs.getString(7);
                String tipoCasilla = rs.getString(8);

                reg = new Registro(idRegistro, votos, distrito, seccional, partido, candidatura, casilla, tipoCasilla);
            } else {
                throw new Exception("No se ha encontrado un registro con id =" + id);
            }

            return reg;

        } finally {
            rs.close();
            pstmt.close();
            con.close();
        }
    }

    static void editarRegistro(Registro RegistroEditado) throws SQLException {
        Connection con = null;
        PreparedStatement pstmt = null;

        try {
            con = origenDatos.getConnection();

            String sql = ("UPDATE Registro SET Votos=?,Partido=?,Candidatura=?,Distrito=?,Seccional=?,Casilla=? WHERE IDREGISTRO=?");
            String sql2 = ("UPDATE Casilla SET TipoCasilla=? WHERE IDCASILLA=?");
            pstmt = con.prepareStatement(sql);

            pstmt.setInt(1, RegistroEditado.getVotos());
            pstmt.setString(2, RegistroEditado.getPartido());
            pstmt.setString(3, RegistroEditado.getCandidatura());
            pstmt.setInt(4, RegistroEditado.getDistrito());
            pstmt.setInt(5, RegistroEditado.getSeccional());
            pstmt.setString(6, RegistroEditado.getCasilla());
            pstmt.setInt(7, RegistroEditado.getIdRegistro());
            pstmt.execute();

            pstmt = con.prepareStatement(sql2);
            pstmt.setString(1, RegistroEditado.getTipoCasilla());
            pstmt.setString(2, RegistroEditado.getCasilla());
            pstmt.execute();

        } finally {
            pstmt.close();
            con.close();
        }
    }

    static int eliminarRegistro(int idRegistro) throws SQLException {
        int status = 0;

        Connection con = origenDatos.getConnection();
        PreparedStatement pstmt = con.prepareStatement("DELETE FROM REGISTRO WHERE IDREGISTRO =?");
        pstmt.setInt(1, idRegistro);
        status = pstmt.executeUpdate();
        con.close();
        return status;
    }

    public Usuarios RecuperarContrasena(Usuarios user) throws Exception {
        Usuarios usu = null;
        Connection con = null;
        Statement stmt = null;
        ResultSet rs = null;

        String sql = "SELECT IDUSUARIO,NOMBRE,CONTRASENA FROM USUARIOS WHERE USUARIO='" + user.getUsuario() + "' AND CORREO='" + user.getCorreo() + "'";

        try {
            con = origenDatos.getConnection();
            stmt = con.createStatement();
            rs = stmt.executeQuery(sql);

            if (rs.next() == true) {
                usu = new Usuarios();
                usu.setId(rs.getInt("IDUSUARIO"));
                usu.setUsuario(user.getUsuario());
                usu.setNombre(rs.getString("NOMBRE"));
                usu.setCorreo(user.getCorreo());
                usu.setContrasena(rs.getString("CONTRASENA"));
            }
            return usu;
        } finally {
            rs.close();
            stmt.close();
            con.close();
        }
    }

    static List<Reporte> getReporte() throws SQLException {
        List<Reporte> reporte = new ArrayList<>();

        Connection con = null;
        Statement stmt = null;
        Statement stmt2 = null;
        ResultSet rs = null;
        ResultSet rs2 = null;

        try {
            con = origenDatos.getConnection();
            String sql = "SELECT DISTINCT PARTIDO,CANDIDATURA FROM REGISTRO";
            stmt = con.createStatement();
            rs = stmt.executeQuery(sql);
            while (rs.next()) {
                String partido = rs.getString(1);
                String candidatura = rs.getString(2);

                String consulta2 = "SELECT SUM(VOTOS) AS TOTALVOTOS,COUNT(idRegistro) AS REGISTROS FROM REGISTRO WHERE PARTIDO ='" + partido + "' AND CANDIDATURA ='" + candidatura + "'";

                stmt2 = con.prepareStatement(consulta2);
                rs2 = stmt2.executeQuery(consulta2);
                while (rs2.next()) {
                    int totalvotos = rs2.getInt(1);
                    int registros = rs2.getInt(2);

                    Reporte tempRep = new Reporte(totalvotos, registros, candidatura, partido);
                    reporte.add(tempRep);

                }
            }

            return reporte;

        } finally {
            rs.close();
            stmt.close();
            con.close();
        }
    }

}
