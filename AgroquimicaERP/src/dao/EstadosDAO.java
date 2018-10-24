/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;
import beans.Estado;
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
public class EstadosDAO extends CRUD <Estado, Integer> {

    public EstadosDAO(Connection con) {
        this.con = con;
    }

    @Override
    public void getAll(JTable tbl) {
        DefaultTableModel tmp = (DefaultTableModel) tbl.getModel();
        query = "{call RecursosHumanos.sp_getStates()}";
        
        try {
            try (CallableStatement st = con.prepareCall(query)) {
                rs = st.executeQuery();
                
                while (rs.next()) {
                    int idEstado = rs.getInt("idEstado");
                    String nombre = rs.getString("nombre");
                    String siglas = rs.getString("siglas");
                    String estatus = rs.getString("estatus");
                    
                    Object registro[] = 
                        {idEstado, nombre, siglas, estatus, parseEstatus(estatus)};
                    
                    tmp.addRow(registro);
                }   tbl.setModel(tmp);
            }
        } catch (SQLException ex) {
            Logger.getLogger(CiudadesDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    public boolean insert(Estado estado) {
        query = "{call RecursosHumanos.sp_addState(?,?)}";
        try {
            try (CallableStatement st = con.prepareCall(query)) {
                st.setString(1, estado.getNombre());
                st.setString(2, estado.getSiglas());
                
                if(st.executeUpdate() > 0) {
                    JOptionPane.showMessageDialog(null, "Estado registrado", "Registro exitoso", 1);
                    return true;
                }
            }
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, "Ocurrió un error al ingresar el Estado", "Error de inserción", 0);
        }   return false;
    }

    @Override
    public boolean update(Estado estado) {
        query = "{call RecursosHumanos.sp_updateState(?,?,?,?)}";
        try {
            try (CallableStatement st = con.prepareCall(query)) {
                st.setInt(1, estado.getIdEstado());
                st.setString(2, estado.getNombre());
                st.setString(3, estado.getSiglas());
                st.setString(4, estado.getEstatus());
                
                st.executeUpdate();
//                JOptionPane.showMessageDialog(null, 
//                        estado.getNombre() + " se actualizó correctamente", "Actualización exitosa", 1);
                return true;
            }
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, "Ocurrió un error al actualizar los datos", "Error de actualización", 0);
            Logger.getLogger(EstadosDAO.class.getName()).log(Level.SEVERE, null, ex);
        }   return false;
    }

    @Override
    public boolean delete(Integer id) {
        query = "{call RecursosHumanos.sp_killState(?)}";
        try {
            try (CallableStatement st = con.prepareCall(query)) {
                st.setInt(1, id);
                
                st.executeUpdate();
                //JOptionPane.showMessageDialog(null, "El Estado se dió de baja", "Baja exitosa", 1);
                return true;
            }
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, "Ocurrió un error al eliminar el Estado", "Error de eliminación", 0);
            Logger.getLogger(EstadosDAO.class.getName()).log(Level.SEVERE, null, ex);
        }   return false;
    }
    
    public String next() {
        this.query = "{call RecursosHumanos.sp_nextState()}";
        
        try {
            try (CallableStatement st = con.prepareCall(this.query)) {
                rs = st.executeQuery();
                
                while (rs.next()) {
                    int idEstado = rs.getInt("siguienteEstado");
                    return " " + String.format("%03d", idEstado);
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(CiudadesDAO.class.getName()).log(Level.SEVERE, null, ex);
        } return null;
    }
    
    public HashMap list(JComboBox cmb) {
        DefaultComboBoxModel tmp = (DefaultComboBoxModel) cmb.getModel();
        query = "{call RecursosHumanos.sp_listStates}";
        HashMap<Integer, Integer> estados = new HashMap<>();
        
        try {
            try (CallableStatement st = con.prepareCall(query)) {
                rs = st.executeQuery();
                
                int i = 0;
                while (rs.next()) {
                    int clave = rs.getInt("idEstado");
                    String nombre = rs.getString("nombre");
                    
                    estados.put(i++, clave);
                    tmp.addElement(nombre);
                }   cmb.setModel(tmp);
                    return estados;
            }
        } catch (SQLException ex) {
            Logger.getLogger(EstadosDAO.class.getName()).log(Level.SEVERE, null, ex);
        }   return null;  
    }
    
    private String parseEstatus(String estatus) {
        // A: Activo, B: Inactivo
        return estatus.equals("A") ? "Activo" : "Inactivo";
    }
}