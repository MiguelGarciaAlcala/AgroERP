/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;
import beans.Ciudad;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.swing.DefaultComboBoxModel;
import javax.swing.JComboBox;
import javax.swing.JOptionPane;
import javax.swing.JTable;
import javax.swing.table.DefaultTableModel;

/**
 *
 * @author Miguel-sama
 */
public class CiudadesDAO extends CRUD <Ciudad, Integer> {

    public CiudadesDAO(Connection con) {
        this.con = con;
    }

    @Override
    public void getAll(JTable tbl) {
        DefaultTableModel tmp = (DefaultTableModel) tbl.getModel();
        this.query = "{call RecursosHumanos.sp_getCities()}";
        
        try {
            try (CallableStatement st = con.prepareCall(this.query)) {
                rs = st.executeQuery();
                
                while (rs.next()) {
                    int idCiudad = rs.getInt("idCiudad");
                    String nombre = rs.getString("nombre");
                    int idEstado = rs.getInt("idEstado");
                    String estado = rs.getString("edo");
                    String estatus = rs.getString("estatus");
                    
                    Object registro[] = 
                        {idCiudad, nombre, estado, parseEstatus(estatus), estatus, idEstado};
                    
                    tmp.addRow(registro);
                }   tbl.setModel(tmp);
            }
        } catch (SQLException ex) {
            Logger.getLogger(CiudadesDAO.class.getName()).log(Level.SEVERE, null, ex);
        } 
    }

    @Override
    public boolean insert(Ciudad ciudad) {
        query = "{call RecursosHumanos.sp_addCity(?,?)}";
        try {
            try (CallableStatement st = con.prepareCall(query)) {
                st.setString(1, ciudad.getNombre());
                st.setInt(2, ciudad.getIdEstado());
                
                if(st.executeUpdate() > 0) {
                    JOptionPane.showMessageDialog(null, "Ciudad registrada", "Registro exitoso", 1);
                    return true;
                }
            }
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, "Ocurrió un error al ingresar la Ciudad", "Error de inserción", 0);
        }   return false;
    }

    @Override
    public boolean update(Ciudad ciudad) {
        query = "{call RecursosHumanos.sp_updateCity(?,?,?,?)}";
        try {
            try (CallableStatement st = con.prepareCall(query)) {
                st.setInt(1, ciudad.getIdCiudad());
                st.setString(2, ciudad.getNombre());
                st.setInt(3, ciudad.getIdEstado());
                st.setString(4, ciudad.getEstatus());
                
                st.executeUpdate();
                //JOptionPane.showMessageDialog(null, 
                        //ciudad.getNombre() + " se actualizó correctamente", "Actualización exitosa", 1);
                return true;
            }
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, "Ocurrió un error al actualizar los datos", "Error de actualización", 0);
            Logger.getLogger(CiudadesDAO.class.getName()).log(Level.SEVERE, null, ex);
        }   return false;
    }

    @Override
    public boolean delete(Integer id) {
        query = "{call RecursosHumanos.sp_killCity(?)}";
        try {
            try (CallableStatement st = con.prepareCall(query)) {
                st.setInt(1, id);
                
                st.executeUpdate();
                //JOptionPane.showMessageDialog(null, "La Ciudad se dió de baja", "Baja exitosa", 1);
                return true;
            }
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, "Ocurrió un error al eliminar la Ciudad", "Error de eliminación", 0);
            Logger.getLogger(CiudadesDAO.class.getName()).log(Level.SEVERE, null, ex);
        }   return false;
    }
    
    public String next() {
        this.query = "{call RecursosHumanos.sp_nextCity()}";
        
        try {
            try (CallableStatement st = con.prepareCall(this.query)) {
                rs = st.executeQuery();
                
                while (rs.next()) {
                    int idDeduccion = rs.getInt("siguienteCiudad");
                    return " " + String.format("%03d", idDeduccion);
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(CiudadesDAO.class.getName()).log(Level.SEVERE, null, ex);
        } return null;
    }
    
    public HashMap list(JComboBox cmb) {
        DefaultComboBoxModel tmp = (DefaultComboBoxModel) cmb.getModel();
        query = "{call RecursosHumanos.sp_listCities}";
        HashMap<Integer, Integer> ciudades = new HashMap<>();
        
        try {
            try (CallableStatement st = con.prepareCall(query)) {
                rs = st.executeQuery();
                
                int i = 0;
                while (rs.next()) {
                    int clave = rs.getInt("idCiudad");
                    String nombre = rs.getString("nombre");
                    
                    ciudades.put(i++, clave);
                    tmp.addElement(nombre);
                }   cmb.setModel(tmp);
                    return ciudades;
            }
        } catch (SQLException ex) {
            Logger.getLogger(CiudadesDAO.class.getName()).log(Level.SEVERE, null, ex);
        }   return null;  
    }
    
    private String parseEstatus(String estatus) {
        return estatus.equals("A") ? "Activo" : "Inactivo";
    }
}
