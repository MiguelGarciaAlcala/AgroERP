/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.sql.Connection;

/**
 *
 * @author Miguel-sama
 */
public class DAO {
    public DeduccionesDAO deducciones;
    public PercepcionesDAO percepciones;
    public EstadosDAO estados;
    public CiudadesDAO ciudades;
    public UsuariosDAO usuarios;
    public EmpleadosDAO empleados;
    public DepartamentosDAO deptos;
    public PuestosDAO puestos;
    public HorariosDAO horarios;
    public NominasDAO nominas;
    public NominasDeduccionesDAO nominasDeducciones;
    public NominasPercepcionesDAO nominasPercepciones;
    public AusenciasJustificadasDAO ausenciasJustificadas;

    public DAO(Connection con) {
        this.deducciones = new DeduccionesDAO(con);
        this.percepciones = new PercepcionesDAO(con);
        this.estados = new EstadosDAO(con);
        this.ciudades = new CiudadesDAO(con);
        this.usuarios = new UsuariosDAO(con);
        this.empleados = new EmpleadosDAO(con);
        this.deptos = new DepartamentosDAO(con);
        this.puestos = new PuestosDAO(con);
        this.horarios = new HorariosDAO(con);
        this.nominas = new NominasDAO(con);
        this.nominasDeducciones = new NominasDeduccionesDAO(con);
        this.nominasPercepciones = new NominasPercepcionesDAO(con);
        this.ausenciasJustificadas = new AusenciasJustificadasDAO(con);
    }
}
