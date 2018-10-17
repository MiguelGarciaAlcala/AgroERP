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
import java.util.logging.Level;
import java.util.logging.Logger;
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
                    String hrInicio = rs.getString("horaInicio");
                    String hrFin = rs.getString("horaFin");
                    String dias = rs.getString("dias");
                    
                    Object registro[] = {idHorario, nombre, hrInicio, hrFin, dias};
                    
                    tmp.addRow(registro);
                }   tbl.setModel(tmp);
            }
        } catch (SQLException ex) {
            Logger.getLogger(CiudadesDAO.class.getName()).log(Level.SEVERE, null, ex);
        } 
    }

    @Override
    public boolean insert(Horario registro) {
        return true;
    }

    @Override
    public boolean update(Horario registro) {
        return true;
    }

    @Override
    public boolean delete(Integer id) {
        return true;
    }
}
