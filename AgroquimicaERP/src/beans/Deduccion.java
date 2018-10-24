/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package beans;

/**
 *
 * @author Miguel
 */
public class Deduccion {
    
    private int idDeduccion;
    private String nombre;
    private String descripcion;
    private float porcentaje;
    private String estatus;
    
    public Deduccion(int idDeduccion, String nombre, String descripcion, float porcentaje, String estatus) {
        this.idDeduccion = idDeduccion;
        this.nombre = nombre;
        this.descripcion = descripcion;
        this.porcentaje = porcentaje;
        this.estatus = estatus;
    }
    
    public Deduccion(String nombre, String descripcion, float porcentaje) {
        this.nombre = nombre;
        this.descripcion = descripcion;
        this.porcentaje = porcentaje;
    }

    public int getIdDeduccion() {
        return idDeduccion;
    }

    public String getNombre() {
        return nombre;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public float getPorcentaje() {
        return porcentaje;
    }
    
    public String getEstatus() {
        return estatus;
    }
}
