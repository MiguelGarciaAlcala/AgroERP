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
    private Date horaInicio;
    private Date horaFin;
    private int dias;
    private int idEmpleado;

    public Horario(int idHorario, Date horaInicio, Date horaFin, int dias, int idEmpleado) {
        this.idHorario = idHorario;
        this.horaInicio = horaInicio;
        this.horaFin = horaFin;
        this.dias = dias;
        this.idEmpleado = idEmpleado;
    }
    
    public Horario(Date horaInicio, Date horaFin, int dias, int idEmpleado) {
        this.horaInicio = horaInicio;
        this.horaFin = horaFin;
        this.dias = dias;
        this.idEmpleado = idEmpleado;
    }

    public int getIdHorario() {
        return idHorario;
    }

    public Date getHoraInicio() {
        return horaInicio;
    }

    public Date getHoraFin() {
        return horaFin;
    }

    public int getDias() {
        return dias;
    }

    public int getIdEmpleado() {
        return idEmpleado;
    }
}
