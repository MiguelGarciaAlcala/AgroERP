/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;
import beans.Percepcion;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.swing.JOptionPane;
import javax.swing.JTable;
import javax.swing.table.DefaultTableModel;

/**
 *
 * @author Miguel-sama
 */
public class PercepcionesDAO extends CRUD <Percepcion, Integer> {
    
    public PercepcionesDAO(Connection con) {
        this.con = con;
    }

    @Override
    public void getAll(JTable tbl) {
        DefaultTableModel tmp = (DefaultTableModel) tbl.getModel();
        this.query = "{call RecursosHumanos.sp_getPerceptions()}";
        
        try {
            try (CallableStatement st = con.prepareCall(this.query)) {
                rs = st.executeQuery();
                
                while (rs.next()) {
                    int idPercepcion = rs.getInt("idPercepcion");
                    String nombre = rs.getString("nombre");
                    String descripcion = rs.getString("descripcion");
                    int diasPagar = rs.getInt("diasPagar");
                    String estatus = rs.getString("estatus");
                    
                    Object registro[] = 
                        {idPercepcion, nombre, descripcion, diasPagar, parseEstatus(estatus), estatus};
                    
                    tmp.addRow(registro);
                }   tbl.setModel(tmp);
            }
        } catch (SQLException ex) {
            Logger.getLogger(CiudadesDAO.class.getName()).log(Level.SEVERE, null, ex);
        } 
    }

    @Override
    public boolean insert(Percepcion percepcion) {
        query = "{call RecursosHumanos.sp_addPerception(?,?,?)}";
        try {
            try (CallableStatement st = con.prepareCall(query)) {
                st.setString(1, percepcion.getNombre());
                st.setString(2, percepcion.getDescripcion());
                st.setFloat(3, percepcion.getDiasPagar());
                
                if(st.executeUpdate() > 0) {
                    JOptionPane.showMessageDialog(null, "Percepción registrada", "Registro exitoso", 1);
                    return true;
                }
            }
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, 
                    "Ocurrió un error al insertar el registro\n" + ex.getMessage(), "Error de inserción", 0);
        }   return false;
    }

    @Override
    public boolean update(Percepcion percepcion) {
        query = "{call RecursosHumanos.sp_updatePerception(?,?,?,?,?)}";
        try {
            try (CallableStatement st = con.prepareCall(query)) {
                st.setInt(1, percepcion.getIdPercepcion());
                st.setString(2, percepcion.getNombre());
                st.setString(3, percepcion.getDescripcion());
                st.setFloat(4, percepcion.getDiasPagar());
                st.setString(5, percepcion.getEstatus());
                
                st.executeUpdate();
                return true;
            }
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, "Ocurrió un error al actualizar los datos", "Error de actualización", 0);
            Logger.getLogger(PercepcionesDAO.class.getName()).log(Level.SEVERE, null, ex);
        }   return false;
    }

    @Override
    public boolean delete(Integer id) {
        query = "{call RecursosHumanos.sp_killPerception(?)}";
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
        this.query = "{call RecursosHumanos.sp_nextPerception()}";
        
        try {
            try (CallableStatement st = con.prepareCall(this.query)) {
                rs = st.executeQuery();
                
                while (rs.next()) {
                    int idDeduccion = rs.getInt("siguientePercepcion");
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
