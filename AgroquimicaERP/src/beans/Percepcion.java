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
public class Percepcion {
    
    private int idPercepcion;
    private String nombre;
    private String descripcion;
    private int diasPagar;
    private String estatus;
    
    public Percepcion(int idPercepcion, String nombre, String descripcion, int diasPagar, String estatus) {
        this.idPercepcion = idPercepcion;
        this.nombre = nombre;
        this.descripcion = descripcion;
        this.diasPagar = diasPagar;
        this.estatus = estatus;
    }
    
    public Percepcion(String nombre, String descripcion, int diasPagar) {
        this.nombre = nombre;
        this.descripcion = descripcion;
        this.diasPagar = diasPagar;
    }

    public int getIdPercepcion() {
        return idPercepcion;
    }

    public String getNombre() {
        return nombre;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public float getDiasPagar() {
        return diasPagar;
    }
    
    public String getEstatus() {
        return estatus;
    }
}
