package beans;

public class NominasPercepciones {
    private int idNomina;
    private int idPercepcion;
    private float importe;

    public NominasPercepciones(int idNomina, int idPercepcion, float importe) {
        this.idNomina = idNomina;
        this.idPercepcion = idPercepcion;
        this.importe = importe;
    }

    public int getIdNomina() {
        return idNomina;
    }

    public int getIdPercepcion() {
        return idPercepcion;
    }

    public float getImporte() {
        return importe;
    }
}
