/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.sql.Connection;
import beans.Departamento;
import beans.Departamento;
import java.sql.CallableStatement;
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
 * @author Miguel
 */
public class DepartamentosDAO extends CRUD <Departamento, Integer> {

    public DepartamentosDAO(Connection con) {
        this.con = con;
    }

    @Override
    public void getAll(JTable tbl) {
        DefaultTableModel tmp = (DefaultTableModel) tbl.getModel();
        this.query = "{call RecursosHumanos.sp_getDeptos()}";

        try {
            try (CallableStatement st = con.prepareCall(this.query)) {
                rs = st.executeQuery();

                while (rs.next()) {
                    int idDepartamento = rs.getInt("idDepartamento");
                    String nombre = rs.getString("nombre");

                    Object registro[] = {idDepartamento, nombre};
                    tmp.addRow(registro);
                }
                tbl.setModel(tmp);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DepartamentosDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    public boolean insert(Departamento dep) {
        query = "{call RecursosHumanos.sp_addDep(?)}";
        try {
            try (CallableStatement st = con.prepareCall(query)) {
                st.setString(1, dep.getNombre());

                if (st.executeUpdate() > 0) {
                    JOptionPane.showMessageDialog(null,
                            dep.getNombre() + " se registró en la lista de Deparatmentos", "Departamento agregado", 1);
                    return true;
                }
            }
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, "Ocurrió un error al ingresar el Departamento", "Error de inserción", 0);
            Logger.getLogger(DepartamentosDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    @Override
    public boolean update(Departamento dep) {
        query = "{call RecursosHumanos.sp_updateDep(?,?)}";
        try {
            try (CallableStatement st = con.prepareCall(query)) {
                st.setInt(1, dep.getIdDepartamento());
                st.setString(2, dep.getNombre());

                st.executeUpdate();
                return true;
            }
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, "Ocurrió un error al actualizar los datos", "Error de actualización", 0);
            Logger.getLogger(DepartamentosDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    @Override
    public boolean delete(Integer id) {
        query = "{call RecursosHumanos.sp_killDep(?)}";
        try {
            try (CallableStatement st = con.prepareCall(query)) {
                st.setInt(1, id);

                st.executeUpdate();
                return true;
            }
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, "Ocurrió un error al eliminar el departamento", "Error de eliminación", 0);
            Logger.getLogger(DepartamentosDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }
    
    public String next() {
        this.query = "{call RecursosHumanos.sp_nextDepto()}";
        
        try {
            try (CallableStatement st = con.prepareCall(this.query)) {
                rs = st.executeQuery();
                
                if (rs.next()) {
                    int idDepartamento = rs.getInt("sigDepto");
                    return " " + String.format("%03d", idDepartamento);
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(CiudadesDAO.class.getName()).log(Level.SEVERE, null, ex);
        } return null;
    }
    
    public String get(int idD) {
        this.query = "{call RecursosHumanos.sp_getDep(?)}";
        
        try {
            try (CallableStatement st = con.prepareCall(this.query)) {
                st.setInt(1, idD);
                rs = st.executeQuery();
                
                if (rs.next())
                    return rs.getString("nombre");
            }
        } catch (SQLException ex) {
            Logger.getLogger(CiudadesDAO.class.getName()).log(Level.SEVERE, null, ex);
        } return null;
    }
    
    public String[] get(String nombre) {
        this.query = "{call RecursosHumanos.sp_getDeptN(?)}";
        String []p = null;
        
        try {
            try (CallableStatement st = con.prepareCall(this.query)) {
                st.setString(1, nombre);
                rs = st.executeQuery();
                
                int cont = 0;
                while (rs.next()) {
                    cont += 1;
                    if(cont > 1) {
                        JOptionPane.showMessageDialog(null,
                                "Se encontró más de una coincidencia:\n"
                                + "el término de búsqueda " + nombre + " es demasiado ambigüo.",
                                "Búsqueda ambigüa", 2);
                        break;
                    }
                    
                    p = new String[]{String.valueOf(rs.getInt("idDepartamento")), rs.getString("nombre"), 
                                    parseEstatus(rs.getString("estatus"))};
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(CiudadesDAO.class.getName()).log(Level.SEVERE, null, ex);
        } return p;
    }
    
    public HashMap list(JComboBox cmb) {
        DefaultComboBoxModel tmp = (DefaultComboBoxModel) cmb.getModel();
        query = "{call RecursosHumanos.sp_listDep}";
        HashMap<Integer, Integer> dep = new HashMap<>();
        
        try {
            try (CallableStatement st = con.prepareCall(query)) {
                rs = st.executeQuery();
                
                int i = 0;
                while (rs.next()) {
                    int clave = rs.getInt("idDepartamento");
                    String nombre = rs.getString("nombre");
                    
                    dep.put(i++, clave);
                    tmp.addElement(nombre);
                }   cmb.setModel(tmp);
                    return dep;
            }
        } catch (SQLException ex) {
            Logger.getLogger(DepartamentosDAO.class.getName()).log(Level.SEVERE, null, ex);
        }   return null;  
    }
    
    public HashMap listSuc(JComboBox cmb) {
        DefaultComboBoxModel tmp = (DefaultComboBoxModel) cmb.getModel();
        query = "{call RecursosHumanos.sp_listSuc}";
        HashMap<Integer, Integer> suc = new HashMap<>();
        
        try {
            try (CallableStatement st = con.prepareCall(query)) {
                rs = st.executeQuery();
                
                int i = 0;
                while (rs.next()) {
                    int clave = rs.getInt("idSucursal");
                    String nombre = rs.getString("nombre");
                    
                    suc.put(i++, clave);
                    tmp.addElement(nombre);
                }   cmb.setModel(tmp);
                    return suc;
            }
        } catch (SQLException ex) {
            Logger.getLogger(DepartamentosDAO.class.getName()).log(Level.SEVERE, null, ex);
        }   return null;  
    }
    
    public boolean exists(String nombre) {
        this.query = "{call RecursosHumanos.sp_existsDepto(?)}";

        try {
            try (CallableStatement st = con.prepareCall(this.query)) {
                st.setString(1, nombre);
                rs = st.executeQuery();

                return rs.next();
            }
        } catch (SQLException ex) {
            Logger.getLogger(PuestosDAO.class.getName()).log(Level.SEVERE, null, ex);
        } return false;
    }

    private String parseEstatus(String estatus) {
        return estatus.equals("A") ? "Activo" : "Inactivo";
    }
}