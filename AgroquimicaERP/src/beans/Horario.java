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
 */
public class Horario {
    private int idHorario;
    private String horaInicio;
    private String horaFin;
    private String dias;
    private int idEmpleado;

    public Horario(int idHorario, String horaInicio, String horaFin, String dias, int idEmpleado) {
        this.idHorario = idHorario;
        this.horaInicio = horaInicio;
        this.horaFin = horaFin;
        this.dias = dias;
        this.idEmpleado = idEmpleado;
    }
    
    public Horario(String horaInicio, String horaFin, String dias, int idEmpleado) {
        this.horaInicio = horaInicio;
        this.horaFin = horaFin;
        this.dias = dias;
        this.idEmpleado = idEmpleado;
    }

    public int getIdHorario() {
        return idHorario;
    }

    public String getHoraInicio() {
        return horaInicio;
    }

    public String getHoraFin() {
        return horaFin;
    }

    public String getDias() {
        return dias;
    }

    public int getIdEmpleado() {
        return idEmpleado;
    }
}
