package beans;

import java.util.Date;

public class AusenciasJustificadas {
    private int idAusencia;
    private Date fechaSolicitud;
    private Date fechaInicio;
    private Date fechaFin;
    private String tipo;
    private int idEmpleadoS;
    private int idEmpleadoA;

    public AusenciasJustificadas(int idAusencia, Date fechaSolicitud, Date fechaInicio, Date fechaFin, String tipo, int idEmpleadoS, int idEmpleadoA) {
        this.idAusencia = idAusencia;
        this.fechaSolicitud = fechaSolicitud;
        this.fechaInicio = fechaInicio;
        this.fechaFin = fechaFin;
        this.tipo = tipo;
        this.idEmpleadoS = idEmpleadoS;
        this.idEmpleadoA = idEmpleadoA;
    }
    
    public AusenciasJustificadas(Date fechaSolicitud, Date fechaInicio, Date fechaFin, String tipo, int idEmpleadoS, int idEmpleadoA) {
        this.fechaSolicitud = fechaSolicitud;
        this.fechaInicio = fechaInicio;
        this.fechaFin = fechaFin;
        this.tipo = tipo;
        this.idEmpleadoS = idEmpleadoS;
        this.idEmpleadoA = idEmpleadoA;
    }

    public int getIdAusencia() {
        return idAusencia;
    }

    public Date getFechaSolicitud() {
        return fechaSolicitud;
    }

    public Date getFechaInicio() {
        return fechaInicio;
    }

    public Date getFechaFin() {
        return fechaFin;
    }

    public String getTipo() {
        return tipo;
    }

    public int getIdEmpleadoS() {
        return idEmpleadoS;
    }

    public int getIdEmpleadoA() {
        return idEmpleadoA;
    }
    
}
