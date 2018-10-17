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
public class Puesto {
    private int idPuesto;
    private String nombre;
    private float salarioMinimo;
    private float salarioMaximo;
    private String estatus;

    public Puesto(int idPuesto, String nombre, float salarioMinimo, float salarioMaximo, String estatus) {
        this.idPuesto = idPuesto;
        this.nombre = nombre;
        this.salarioMinimo = salarioMinimo;
        this.salarioMaximo = salarioMaximo;
        this.estatus = estatus;
    }
    
    public Puesto(String nombre, float salarioMinimo, float salarioMaximo) {
        this.nombre = nombre;
        this.salarioMinimo = salarioMinimo;
        this.salarioMaximo = salarioMaximo;
    }

    public int getIdPuesto() {
        return idPuesto;
    }

    public String getNombre() {
        return nombre;
    }

    public float getSalarioMinimo() {
        return salarioMinimo;
    }

    public float getSalarioMaximo() {
        return salarioMaximo;
    }

    public String getEstatus() {
        return estatus;
    }
}
