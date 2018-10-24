/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.sql.Connection;
import beans.Puesto;
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
public class PuestosDAO extends CRUD <Puesto, Integer> {

    public PuestosDAO(Connection con) {
        this.con = con;
    }

    @Override
    public void getAll(JTable tbl) {
        DefaultTableModel tmp = (DefaultTableModel) tbl.getModel();
        this.query = "{call RecursosHumanos.sp_getPuestos()}";

        try {
            try (CallableStatement st = con.prepareCall(this.query)) {
                rs = st.executeQuery();

                while (rs.next()) {
                    int idPuesto = rs.getInt("idPuesto");
                    String nombre = rs.getString("nombre");
                    float salarioMin = rs.getFloat("salarioMinimo");
                    float salarioMax = rs.getFloat("salarioMaximo");

                    Object registro[]
                            = {idPuesto, nombre, salarioMin, salarioMax};

                    tmp.addRow(registro);
                }
                tbl.setModel(tmp);
            }
        } catch (SQLException ex) {
            Logger.getLogger(PuestosDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    public boolean insert(Puesto puestos) {
        query = "{call RecursosHumanos.sp_addPuesto(?,?,?)}";
        try {
            try (CallableStatement st = con.prepareCall(query)) {
                st.setString(1, puestos.getNombre());
                st.setDouble(2, puestos.getSalarioMinimo());
                st.setDouble(3, puestos.getSalarioMaximo());

                if (st.executeUpdate() > 0) {
                    JOptionPane.showMessageDialog(null,
                            puestos.getNombre() + " se registró en la lista de Puestos", "Puesto agregado", 1);
                    return true;
                }
            }
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, "Ocurrió un error al ingresar el Departamento", "Error de inserción", 0);
            Logger.getLogger(PuestosDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    @Override
    public boolean update(Puesto puestos) {
        query = "{call RecursosHumanos.sp_updatePuesto(?,?,?,?)}";
        try {
            try (CallableStatement st = con.prepareCall(query)) {
                st.setInt(1, puestos.getIdPuesto());
                st.setString(2, puestos.getNombre());
                st.setDouble(3, puestos.getSalarioMinimo());
                st.setDouble(4, puestos.getSalarioMaximo());

                st.executeUpdate();
                return true;
            }
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, "Ocurrió un error al actualizar los datos", "Error de actualización", 0);
            Logger.getLogger(PuestosDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    @Override
    public boolean delete(Integer id) {
        query = "{call RecursosHumanos.sp_deletePuestos(?)}";
        try {
            try (CallableStatement st = con.prepareCall(query)) {
                st.setInt(1, id);

                st.executeUpdate();
                return true;
            }
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, "Ocurrió un error al eliminar el puesto", "Error de eliminación", 0);
            Logger.getLogger(PuestosDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }
    
    public HashMap list(JComboBox cmb) {
        DefaultComboBoxModel tmp = (DefaultComboBoxModel) cmb.getModel();
        query = "{call RecursosHumanos.sp_listPos}";
        HashMap<Integer, Integer> p = new HashMap<>();
        
        try {
            try (CallableStatement st = con.prepareCall(query)) {
                rs = st.executeQuery();
                
                int i = 0;
                while (rs.next()) {
                    int clave = rs.getInt("idPuesto");
                    String nombre = rs.getString("nombre");
                    
                    p.put(i++, clave);
                    tmp.addElement(nombre);
                }   cmb.setModel(tmp);
                    return p;
            }
        } catch (SQLException ex) {
            Logger.getLogger(CiudadesDAO.class.getName()).log(Level.SEVERE, null, ex);
        }   return null;  
    }
    
    public String next() {
        this.query = "{call RecursosHumanos.sp_nextPuesto()}";
        
        try {
            try (CallableStatement st = con.prepareCall(this.query)) {
                rs = st.executeQuery();
                
                if (rs.next()) {
                    int idP = rs.getInt("sigPuesto");
                    return " " + String.format("%03d", idP);
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(PuestosDAO.class.getName()).log(Level.SEVERE, null, ex);
        } return null;
    }
    
    public float[] salaryRank(int idPuesto) {
        this.query = "{call RecursosHumanos.sp_salaryRank(?)}";
        float salarios[]= null;
        try {
            try (CallableStatement st = con.prepareCall(this.query)) {
                st.setInt(1, idPuesto);
                rs = st.executeQuery();
                
                if (rs.next()) {
                    float salMin = rs.getFloat("salarioMinimo");
                    float salMax = rs.getFloat("salarioMaximo");
                    salarios = new float[]{salMin, salMax};
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(PuestosDAO.class.getName()).log(Level.SEVERE, null, ex);
        } return salarios;
    }
    
    public String[] get(int idP) {
        this.query = "{call RecursosHumanos.sp_getPuesto(?)}";
        String []p = null;
        
        try {
            try (CallableStatement st = con.prepareCall(this.query)) {
                st.setInt(1, idP);
                rs = st.executeQuery();
                
                if (rs.next()) {
                    p = new String[]{rs.getString("nombre"), String.valueOf(rs.getFloat("salarioMinimo")),
                                    String.valueOf(rs.getFloat("salarioMaximo"))};
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(CiudadesDAO.class.getName()).log(Level.SEVERE, null, ex);
        } return p;
    }
    
    public String[] get(String nombre) {
        this.query = "{call RecursosHumanos.sp_getPuestoN(?)}";
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
                    
                    p = new String[]{String.valueOf(rs.getInt("idPuesto")), rs.getString("nombre"), 
                                    String.valueOf(rs.getFloat("salarioMinimo")), String.valueOf(rs.getFloat("salarioMaximo")),
                                    parseEstatus(rs.getString("estatus"))};
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(CiudadesDAO.class.getName()).log(Level.SEVERE, null, ex);
        } return p;
    }
    
    public boolean exists(String nombre) {
        this.query = "{call RecursosHumanos.sp_existsPuesto(?)}";

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
