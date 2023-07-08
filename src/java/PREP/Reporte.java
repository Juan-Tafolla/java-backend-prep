
package PREP;

public class Reporte {
    private int totalvotos,registros;
    private String candidatura, partido;  

    public Reporte(int totalvotos, int registros, String candidatura, String partido) {
        this.totalvotos = totalvotos;
        this.registros = registros;
        this.candidatura = candidatura;
        this.partido = partido;
    }

    
    
    public int getTotalvotos() {
        return totalvotos;
    }

    public void setTotalvotos(int totalvotos) {
        this.totalvotos = totalvotos;
    }

    public int getRegistros() {
        return registros;
    }

    public void setRegistros(int registros) {
        this.registros = registros;
    }

    public String getCandidatura() {
        return candidatura;
    }

    public void setCandidatura(String candidatura) {
        this.candidatura = candidatura;
    }

    public String getPartido() {
        return partido;
    }

    public void setPartido(String partido) {
        this.partido = partido;
    }
    

}
