package beans;

public class NominasDeducciones {
    private int idNomina;
    private int idDeduccion;
    private float importe;

    public NominasDeducciones(int idNomina, int idDeduccion, float importe) {
        this.idNomina = idNomina;
        this.idDeduccion = idDeduccion;
        this.importe = importe;
    }

    public int getIdNomina() {
        return idNomina;
    }

    public int getIdDeduccion() {
        return idDeduccion;
    }

    public float getImporte() {
        return importe;
    }
}
