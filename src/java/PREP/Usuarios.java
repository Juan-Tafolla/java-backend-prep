package PREP;

public class Usuarios {

    private int id;
    private boolean estado;
    private Cargo cargo;
    private String nombre, apellidos, correo, direccion, colonia, municipio, cp, usuario, contrasena, idCasilla, razonSocial, idCargo,telefono;

    public Usuarios (){
        
    }

    public Usuarios(int id, String nombre, String apellidos, String correo, String direccion, String colonia, String municipio, String cp,
                    String usuario, String contrasena, String idCasilla, String razonSocial, boolean estado, Cargo cargo, String idCargo,String telefono) {
        this.id = id;
        this.nombre = nombre;
        this.apellidos = apellidos;
        this.correo = correo;
        this.direccion = direccion;
        this.colonia = colonia;
        this.municipio = municipio;
        this.cp = cp;
        this.usuario = usuario;
        this.contrasena = contrasena;
        this.idCasilla = idCasilla;
        this.razonSocial = razonSocial;
        this.estado = estado;
        this.cargo = cargo;
        this.idCargo = idCargo;
        this.telefono = telefono;
    }

     public Usuarios(String usuario,String contrasena){
         this.usuario = usuario;
         this.contrasena = contrasena;
     
     }

    Usuarios(String nomb, String apell, String correo, String dir, String col, String munic, String cp, String razonS, String telef, String user, String contra) {
       this.nombre = nomb;
       this.apellidos = apell;
       this.correo = correo;
       this.direccion = dir;
       this.colonia = col;
       this.municipio = munic;
       this.cp = cp;
       this.razonSocial = razonS;
       this.telefono = telef;
       this.usuario = user;
       this.contrasena = contra;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Cargo getCargo() {
        return cargo;
    }

    public void setCargo(Cargo cargo) {
        this.cargo = cargo;
    }

    public boolean getEstado() {
        return estado;
    }

    public void setEstado(boolean estado) {
        this.estado = estado;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getApellidos() {
        return apellidos;
    }

    public void setApellidos(String apellidos) {
        this.apellidos = apellidos;
    }

    public String getCorreo() {
        return correo;
    }

    public void setCorreo(String correo) {
        this.correo = correo;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public String getColonia() {
        return colonia;
    }

    public void setColonia(String colonia) {
        this.colonia = colonia;
    }

    public String getMunicipio() {
        return municipio;
    }

    public void setMunicipio(String municipio) {
        this.municipio = municipio;
    }

    public String getCp() {
        return cp;
    }

    public void setCp(String cp) {
        this.cp = cp;
    }

    public String getUsuario() {
        return usuario;
    }

    public void setUsuario(String usuario) {
        this.usuario = usuario;
    }

    public String getContrasena() {
        return contrasena;
    }

    public void setContrasena(String contrasena) {
        this.contrasena = contrasena;
    }

    public String getIdCasilla() {
        return idCasilla;
    }

    public void setIdCasilla(String idCasilla) {
        this.idCasilla = idCasilla;
    }

    public String getIdCargo() {
        return idCargo;
    }

    public void setIdCargo(String idCargo) {
        this.idCargo = idCargo;
    }

    public String getRazonSocial() {
        return razonSocial;
    }

    public void setRazonSocial(String razonSocial) {
        this.razonSocial = razonSocial;
    }

    public String getTelefono() {
        return telefono;
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }

}
