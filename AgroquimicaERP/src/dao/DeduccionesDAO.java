/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import javax.swing.JTable;
import beans.Deduccion;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.swing.JOptionPane;
import javax.swing.table.DefaultTableModel;

/**
 *
 * @author Miguel-sama
 */
public class DeduccionesDAO extends CRUD <Deduccion, Integer> {

    public DeduccionesDAO(Connection con) {
        this.con = con;
    }

    @Override
    public void getAll(JTable tbl) {
        DefaultTableModel tmp = (DefaultTableModel) tbl.getModel();
        this.query = "{call RecursosHumanos.sp_getDeductions()}";
        
        try {
            try (CallableStatement st = con.prepareCall(this.query)) {
                rs = st.executeQuery();
                
                while (rs.next()) {
                    int idDeduccion = rs.getInt("idDeduccion");
                    String nombre = rs.getString("nombre");
                    String descripcion = rs.getString("descripcion");
                    float porcentaje = rs.getFloat("porcentaje");
                    String estatus = rs.getString("estatus");
                    
                    Object registro[] = 
                        {idDeduccion, nombre, descripcion, porcentaje, parseEstatus(estatus), estatus};
                    
                    tmp.addRow(registro);
                }   tbl.setModel(tmp);
            }
        } catch (SQLException ex) {
            Logger.getLogger(CiudadesDAO.class.getName()).log(Level.SEVERE, null, ex);
        } 
    }

    @Override
    public boolean insert(Deduccion deduccion) {
        query = "{call RecursosHumanos.sp_addDeduction(?,?,?)}";
        try {
            try (CallableStatement st = con.prepareCall(query)) {
                st.setString(1, deduccion.getNombre());
                st.setString(2, deduccion.getDescripcion());
                st.setFloat(3, deduccion.getPorcentaje());
                
                if(st.executeUpdate() > 0) {
                    JOptionPane.showMessageDialog(null, "Deducción registrada", "Registro exitoso", 1);
                    return true;
                }
            }
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, 
                    "Ocurrió un error al insertar el registro\n" + ex.getMessage(), "Error de inserción", 0);
        }   return false;
    }

    @Override
    public boolean update(Deduccion deduccion) {
        query = "{call RecursosHumanos.sp_updateDeduction(?,?,?,?,?)}";
        try {
            try (CallableStatement st = con.prepareCall(query)) {
                st.setInt(1, deduccion.getIdDeduccion());
                st.setString(2, deduccion.getNombre());
                st.setString(3, deduccion.getDescripcion());
                st.setFloat(4, deduccion.getPorcentaje());
                st.setString(5, deduccion.getEstatus());
                
                st.executeUpdate();
                return true;
            }
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, "Ocurrió un error al actualizar los datos", "Error de actualización", 0);
            Logger.getLogger(CiudadesDAO.class.getName()).log(Level.SEVERE, null, ex);
        }   return false;
    }

    @Override
    public boolean delete(Integer id) {
        query = "{call RecursosHumanos.sp_killDeduction(?)}";
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
        this.query = "{call RecursosHumanos.sp_nextDeduction()}";
        
        try {
            try (CallableStatement st = con.prepareCall(this.query)) {
                rs = st.executeQuery();
                
                while (rs.next()) {
                    int idDeduccion = rs.getInt("siguienteDeduccion");
                    return " " + String.format("%03d", idDeduccion);
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(CiudadesDAO.class.getName()).log(Level.SEVERE, null, ex);
        } return null;
    }
    
    private String parseEstatus(String estatus) {
        return estatus.equals("A") ? "Activo" : "Inactivo";
    }
}