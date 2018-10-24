/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package beans;

/**
 *
 * @author Miguel-sama
 */
public class Ciudad {
    
    private int idCiudad;
    private String nombre;
    private int idEstado;
    private String estatus;

    public Ciudad(int idCiudad, String nombre, int idEstado, String estatus) {
        this.idCiudad = idCiudad;
        this.nombre = nombre;
        this.idEstado = idEstado;
        this.estatus = estatus;
    }
    
    public Ciudad(String nombre, int idEstado) {
        this.nombre = nombre;
        this.idEstado = idEstado;
    }

    public int getIdCiudad() {
        return idCiudad;
    }

    public String getNombre() {
        return nombre;
    }

    public int getIdEstado() {
        return idEstado;
    }

    public String getEstatus() {
        return estatus;
    }
}
