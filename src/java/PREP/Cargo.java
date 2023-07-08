package PREP;

public class Cargo {
    
    private int idCargo;
    private String nombreCargo;
    private boolean Estado;

    public Cargo(int idCargo, String nombreCargo, boolean estado){
        this.idCargo = idCargo;
        this.nombreCargo = nombreCargo;
        this.Estado = estado;
    }
    
    public Cargo(){
        
    }
    
    public int getIdCargo() {
        return idCargo;
    }

    public void setIdCargo(int idCargo) {
        this.idCargo = idCargo;
    }

    public String getNombreCargo() {
        return nombreCargo;
    }

    public void setNombreCargo(String NombreCargo) {
        this.nombreCargo = NombreCargo;
    }

    public boolean getEstado() {
        return Estado;
    }

    public void setEstado(boolean Estado) {
        this.Estado = Estado;
    }
    
    
}
