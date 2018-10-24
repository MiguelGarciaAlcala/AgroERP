/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.sql.Connection;
import beans.Horario;
import java.sql.CallableStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.swing.JOptionPane;
import javax.swing.JTable;
import javax.swing.table.DefaultTableModel;

/**
 *
 * @author Miguel
 */
public class HorariosDAO extends CRUD <Horario, Integer> {

    public HorariosDAO(Connection con) {
        this.con = con;
    }

    @Override
    public void getAll(JTable tbl) {
        DefaultTableModel tmp = (DefaultTableModel) tbl.getModel();
        this.query = "{call RecursosHumanos.sp_getSchedules()}";
        
        try {
            try (CallableStatement st = con.prepareCall(this.query)) {
                rs = st.executeQuery();
                
                while (rs.next()) {
                    int idHorario = rs.getInt("idHorario");
                    String nombre = rs.getString("nombreComp");
                    String hrInicio = rs.getString("hi");
                    String hrFin = rs.getString("hf");
                    String dias = rs.getString("dias");
                    
                    Object registro[] = {idHorario, nombre, hrInicio, hrFin, dias};
                    
                    tmp.addRow(registro);
                }   tbl.setModel(tmp);
            }
        } catch (SQLException ex) {
            Logger.getLogger(CiudadesDAO.class.getName()).log(Level.SEVERE, null, ex);
        } 
    }
    
    public void getAll(JTable tbl, int idEmp) {
        DefaultTableModel tmp = (DefaultTableModel) tbl.getModel();
        this.query = "{call RecursosHumanos.sp_getSchedulesEmp(?)}";
        
        try {
            try (CallableStatement st = con.prepareCall(this.query)) {
                st.setInt(1, idEmp);
                rs = st.executeQuery();
                
                while (rs.next()) {
                    int idHorario = rs.getInt("idHorario");
                    String hrInicio = rs.getString("hi");
                    String hrFin = rs.getString("hf");
                    String dias = rs.getString("dias");
                    
                    Object registro[] = {idHorario, hrInicio, hrFin, dias};
                    
                    tmp.addRow(registro);
                }   tbl.setModel(tmp);
            }
        } catch (SQLException ex) {
            Logger.getLogger(CiudadesDAO.class.getName()).log(Level.SEVERE, null, ex);
        } 
    }

    @Override
    public boolean insert(Horario hr) {
        query = "{call RecursosHumanos.sp_addSchedule(?,?,?,?)}";
        try {
            try (CallableStatement st = con.prepareCall(query)) {
                st.setString(1, hr.getHoraInicio());
                st.setString(2, hr.getHoraFin());
                st.setString(3, hr.getDias());
                st.setInt(4, hr.getIdEmpleado());
                
                if(st.executeUpdate() > 0) {
                    JOptionPane.showMessageDialog(null, "Horario registrado", "Registro exitoso", 1);
                    return true;
                }
            }
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, "Ocurrió un error al registrar el horario", "Error de inserción", 0);
        }   return false;
    }

    @Override
    public boolean update(Horario hr) {
        query = "{call RecursosHumanos.sp_updateSchedule(?,?,?,?,?)}";
        try {
            try (CallableStatement st = con.prepareCall(query)) {
                st.setInt(1, hr.getIdHorario());
                st.setString(2, hr.getHoraInicio());
                st.setString(3, hr.getHoraFin());
                st.setString(4, hr.getDias());
                st.setInt(5, hr.getIdEmpleado());
                
                st.executeUpdate();
                return true;
            }
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, "Ocurrió un error al actualizar el horario", "Error de actualización", 0);
        }   return false;
    }

    @Override
    public boolean delete(Integer id) {
        query = "{call RecursosHumanos.sp_killSchedule(?)}";
        try {
            try (CallableStatement st = con.prepareCall(query)) {
                st.setInt(1, id);
                
                st.executeUpdate();
                return true;
            }
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, 
                    "Ocurrió un error al eliminar el registro\n" + ex.getMessage(), "Error de eliminación", 0);
            Logger.getLogger(EstadosDAO.class.getName()).log(Level.SEVERE, null, ex);
        }   return false;
    }
    
    public String next() {
        this.query = "{call RecursosHumanos.sp_nextSchedule()}";
        
        try {
            try (CallableStatement st = con.prepareCall(this.query)) {
                rs = st.executeQuery();
                
                if (rs.next()) {
                    int idHr = rs.getInt("sigHorario");
                    return " " + String.format("%03d", idHr);
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(CiudadesDAO.class.getName()).log(Level.SEVERE, null, ex);
        } return null;
    }
    
    public ArrayList<String[]> get(int idEmp, boolean exclude, int idH) {
        this.query = "{call RecursosHumanos.sp_empSchedules(?,?,?)}";
        ArrayList <String[]> hrs = new ArrayList();
        
        try {
            try (CallableStatement st = con.prepareCall(this.query)) {
                st.setInt(1, idEmp);
                st.setString(2, (exclude) ? "E" : "N");
                st.setInt(3, idH);
                rs = st.executeQuery();
                
                while (rs.next()) {
                    String days[] = rs.getString("dias").split(",");
                    hrs.add(days);
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(CiudadesDAO.class.getName()).log(Level.SEVERE, null, ex);
        } return hrs;
    }
    
    public String[] getH(int idH) {
        this.query = "{call RecursosHumanos.sp_getSchedule(?)}";
        String []hr = null;
        
        try {
            try (CallableStatement st = con.prepareCall(this.query)) {
                st.setInt(1, idH);
                rs = st.executeQuery();
                
                if (rs.next()) {
                    hr = new String[]{rs.getString("hi"), rs.getString("hf"), rs.getString("dias"),
                                      rs.getString("nombreComp"), rs.getString("idEm")};
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(CiudadesDAO.class.getName()).log(Level.SEVERE, null, ex);
        } return hr;
    }
}
