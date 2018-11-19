package beans;

import java.util.Date;

public class Nominas {
    private int idNomina;
    private Date fechaPago;
    private float totalP;
    private float totalD;
    private float cantidadNeta;
    private int diasTrabajados;
    private int faltas;
    private Date fechaInicio;
    private Date fechaFin;
    private int idEmpleado;
    private int idFormaPago;

    public Nominas(int idNomina, Date fechaPago, float totalP, float totalD, float cantidadNeta, int diasTrabajados, int faltas, Date fechaInicio, Date fechaFin, int idEmpleado, int idFormaPago) {
        this.idNomina = idNomina;
        this.fechaPago = fechaPago;
        this.totalP = totalP;
        this.totalD = totalD;
        this.cantidadNeta = cantidadNeta;
        this.diasTrabajados = diasTrabajados;
        this.faltas = faltas;
        this.fechaInicio = fechaInicio;
        this.fechaFin = fechaFin;
        this.idEmpleado = idEmpleado;
        this.idFormaPago = idFormaPago;
    }
    
    public Nominas(Date fechaPago, float totalP, float totalD, float cantidadNeta, int diasTrabajados, int faltas, Date fechaInicio, Date fechaFin, int idEmpleado, int idFormaPago) {
        this.fechaPago = fechaPago;
        this.totalP = totalP;
        this.totalD = totalD;
        this.cantidadNeta = cantidadNeta;
        this.diasTrabajados = diasTrabajados;
        this.faltas = faltas;
        this.fechaInicio = fechaInicio;
        this.fechaFin = fechaFin;
        this.idEmpleado = idEmpleado;
        this.idFormaPago = idFormaPago;
    }

    public int getIdNomina() {
        return idNomina;
    }

    public Date getFechaPago() {
        return fechaPago;
    }

    public float getTotalP() {
        return totalP;
    }

    public float getTotalD() {
        return totalD;
    }

    public float getCantidadNeta() {
        return cantidadNeta;
    }

    public int getDiasTrabajados() {
        return diasTrabajados;
    }

    public int getFaltas() {
        return faltas;
    }

    public Date getFechaInicio() {
        return fechaInicio;
    }

    public Date getFechaFin() {
        return fechaFin;
    }

    public int getIdEmpleado() {
        return idEmpleado;
    }

    public int getIdFormaPago() {
        return idFormaPago;
    }
}
