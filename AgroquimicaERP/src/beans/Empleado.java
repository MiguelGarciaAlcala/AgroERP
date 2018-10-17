/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package beans;

import java.util.Date;

/**
 *
 * @author Miguel
 * OpenCV
 */
public class Empleado {
    
    private int idEmpleado;
    private String nombre;
    private String apaterno;
    private String amaterno;
    private String sexo;
    private Date fechaContratacion;
    private Date fechaNacimiento;
    private float salario;
    private String NSS;
    private String estadoCivil;
    private int diasVacacionales;
    private int diasPermiso;
    private byte fotografia[];
    private String direccion;
    private String colonia;
    private String codigoPostal;
    private String escolaridad;
    private float porcentajeComision;
    private String estatus;
    private int idDepartamento;
    private int idPuesto;
    private int idCiudad;
    private int idSucursal;

    public Empleado(int idEmpleado, String nombre, String apaterno, String amaterno, String sexo, Date fechaContratacion, Date fechaNacimiento, float salario, String NSS, String estadoCivil, int diasVacacionales, int diasPermiso, byte[] fotografia, String direccion, String colonia, String codigoPostal, String escolaridad, float porcentajeComision, String estatus, int idDepartamento, int idPuesto, int idCiudad, int idSucursal) {
        this.idEmpleado = idEmpleado;
        this.nombre = nombre;
        this.apaterno = apaterno;
        this.amaterno = amaterno;
        this.sexo = sexo;
        this.fechaContratacion = fechaContratacion;
        this.fechaNacimiento = fechaNacimiento;
        this.salario = salario;
        this.NSS = NSS;
        this.estadoCivil = estadoCivil;
        this.diasVacacionales = diasVacacionales;
        this.diasPermiso = diasPermiso;
        this.fotografia = fotografia;
        this.direccion = direccion;
        this.colonia = colonia;
        this.codigoPostal = codigoPostal;
        this.escolaridad = escolaridad;
        this.porcentajeComision = porcentajeComision;
        this.estatus = estatus;
        this.idDepartamento = idDepartamento;
        this.idPuesto = idPuesto;
        this.idCiudad = idCiudad;
        this.idSucursal = idSucursal;
    }
    
    public Empleado(String nombre, String apaterno, String amaterno, String sexo, Date fechaContratacion, Date fechaNacimiento, float salario, String NSS, String estadoCivil, int diasVacacionales, int diasPermiso, byte[] fotografia, String direccion, String colonia, String codigoPostal, String escolaridad, float porcentajeComision, int idDepartamento, int idPuesto, int idCiudad, int idSucursal) {
        this.nombre = nombre;
        this.apaterno = apaterno;
        this.amaterno = amaterno;
        this.sexo = sexo;
        this.fechaContratacion = fechaContratacion;
        this.fechaNacimiento = fechaNacimiento;
        this.salario = salario;
        this.NSS = NSS;
        this.estadoCivil = estadoCivil;
        this.diasVacacionales = diasVacacionales;
        this.diasPermiso = diasPermiso;
        this.fotografia = fotografia;
        this.direccion = direccion;
        this.colonia = colonia;
        this.codigoPostal = codigoPostal;
        this.escolaridad = escolaridad;
        this.porcentajeComision = porcentajeComision;
        this.idDepartamento = idDepartamento;
        this.idPuesto = idPuesto;
        this.idCiudad = idCiudad;
        this.idSucursal = idSucursal;
    }

    public int getIdEmpleado() {
        return idEmpleado;
    }

    public String getNombre() {
        return nombre;
    }

    public String getApaterno() {
        return apaterno;
    }

    public String getAmaterno() {
        return amaterno;
    }

    public String getSexo() {
        return sexo;
    }

    public Date getFechaContratacion() {
        return fechaContratacion;
    }

    public Date getFechaNacimiento() {
        return fechaNacimiento;
    }

    public float getSalario() {
        return salario;
    }

    public String getNSS() {
        return NSS;
    }

    public String getEstadoCivil() {
        return estadoCivil;
    }

    public int getDiasVacacionales() {
        return diasVacacionales;
    }

    public int getDiasPermiso() {
        return diasPermiso;
    }

    public byte[] getFotografia() {
        return fotografia;
    }

    public String getDireccion() {
        return direccion;
    }

    public String getColonia() {
        return colonia;
    }

    public String getCodigoPostal() {
        return codigoPostal;
    }

    public String getEscolaridad() {
        return escolaridad;
    }

    public float getPorcentajeComision() {
        return porcentajeComision;
    }

    public String getEstatus() {
        return estatus;
    }

    public int getIdDepartamento() {
        return idDepartamento;
    }

    public int getIdPuesto() {
        return idPuesto;
    }

    public int getIdCiudad() {
        return idCiudad;
    }

    public int getIdSucursal() {
        return idSucursal;
    }    
}
