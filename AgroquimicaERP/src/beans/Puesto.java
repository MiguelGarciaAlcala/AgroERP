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
    private double salarioMinimo;
    private double salarioMaximo;
    private String estatus;

    public Puesto(int idPuesto, String nombre, double salarioMinimo, double salarioMaximo, String estatus) {
        this.idPuesto = idPuesto;
        this.nombre = nombre;
        this.salarioMinimo = salarioMinimo;
        this.salarioMaximo = salarioMaximo;
        this.estatus = estatus;
    }

    public Puesto(int idPuesto, String nombre, double salarioMinimo, double salarioMaximo) {
        this.idPuesto = idPuesto;
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

    public double getSalarioMinimo() {
        return salarioMinimo;
    }

    public double getSalarioMaximo() {
        return salarioMaximo;
    }

    public String getEstatus() {
        return estatus;
    }
}
