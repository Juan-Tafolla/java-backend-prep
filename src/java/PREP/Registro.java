package PREP;

public class Registro {

    int idRegistro,votos,distrito,seccional;
    String partido,candidatura,casilla,tipoCasilla;

    public Registro(int votos, int distrito, int seccional, String partido, String candidatura, String casilla) {
        this.votos = votos;
        this.distrito = distrito;
        this.seccional = seccional;
        this.partido = partido;
        this.candidatura = candidatura;
        this.casilla = casilla;
    }

    public Registro(int idRegistro, int votos, int distrito, int seccional, String partido, String candidatura, String casilla, String tipoCasilla) {
        this.idRegistro = idRegistro;
        this.votos = votos;
        this.distrito = distrito;
        this.seccional = seccional;
        this.partido = partido;
        this.candidatura = candidatura;
        this.casilla = casilla;
        this.tipoCasilla = tipoCasilla;
    }

    
    public int getIdRegistro() {
        return idRegistro;
    }

    public void setIdRegistro(int idRegistro) {
        this.idRegistro = idRegistro;
    }

    public int getVotos() {
        return votos;
    }

    public void setVotos(int votos) {
        this.votos = votos;
    }

    public int getDistrito() {
        return distrito;
    }

    public void setDistrito(int distrito) {
        this.distrito = distrito;
    }

    public int getSeccional() {
        return seccional;
    }

    public void setSeccional(int seccional) {
        this.seccional = seccional;
    }

    public String getPartido() {
        return partido;
    }

    public void setPartido(String partido) {
        this.partido = partido;
    }

    public String getCandidatura() {
        return candidatura;
    }

    public void setCandidatura(String candidatura) {
        this.candidatura = candidatura;
    }

    public String getCasilla() {
        return casilla;
    }

    public void setCasilla(String casilla) {
        this.casilla = casilla;
    }

    public String getTipoCasilla() {
        return tipoCasilla;
    }

    public void setTipoCasilla(String tipoCasilla) {
        this.tipoCasilla = tipoCasilla;
    }
    
    
    
}
