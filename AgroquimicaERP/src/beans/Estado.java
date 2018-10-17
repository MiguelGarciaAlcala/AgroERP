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
public class Estado {
    
    private int idEstado;
    private String nombre;
    private String siglas;
    private String estatus;
    
    public Estado(int idEstado, String nombre, String siglas, String estatus) {
        this.idEstado = idEstado;
        this.nombre = nombre;
        this.siglas = siglas;
        this.estatus = estatus;
    }
    
    public Estado(String nombre, String siglas) {
        this.nombre = nombre;
        this.siglas = siglas;
    }

    public int getIdEstado() {
        return idEstado;
    }

    public String getNombre() {
        return nombre;
    }

    public String getSiglas() {
        return siglas;
    }

    public String getEstatus() {
        return estatus;
    }
}
