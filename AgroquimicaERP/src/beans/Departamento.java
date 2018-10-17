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
public class Departamento {
    
    private int idDepartamento;
    private String nombre;
    private String estatus;

    public Departamento(int idDepartamento, String nombre, String estatus) {
        this.idDepartamento = idDepartamento;
        this.nombre = nombre;
        this.estatus = estatus;
    }
    
    public Departamento(int idDepartamento, String nombre) {
        this.idDepartamento = idDepartamento;
        this.nombre = nombre;
    }

    public int getIdDepartamento() {
        return idDepartamento;
    }

    public String getNombre() {
        return nombre;
    }

    public String getEstatus() {
        return estatus;
    }
}
