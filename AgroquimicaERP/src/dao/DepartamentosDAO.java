/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.sql.Connection;
import beans.Departamento;
import java.sql.CallableStatement;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.swing.JOptionPane;
import javax.swing.JTable;
import javax.swing.table.DefaultTableModel;

/**
 *
 * @author Miguel
 */
public class DepartamentosDAO extends CRUD<Departamento, Integer> {

    public DepartamentosDAO(Connection con) {
        this.con = con;
    }

    @Override
    public void getAll(JTable tbl) {
        DefaultTableModel tmp = (DefaultTableModel) tbl.getModel();
        this.query = "{call RecursosHumanos.sp_chekDepto()}";

        try {
            try (CallableStatement st = con.prepareCall(this.query)) {
                rs = st.executeQuery();

                while (rs.next()) {
                    int idDepartamento = rs.getInt("idDepartamento");
                    String nombre = rs.getString("nombre");
                    String estatus = rs.getString("estatus");

                    Object registro[]
                            = {idDepartamento, nombre, parseEstatus(estatus)};

                    tmp.addRow(registro);
                }
                tbl.setModel(tmp);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DepartamentosDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    public boolean insert(Departamento departamentos) {
        query = "{call RecursosHumanos.sp_addDepartament(?)}";
        try {
            try (CallableStatement st = con.prepareCall(query)) {
                st.setString(1, departamentos.getNombre());

                if (st.executeUpdate() > 0) {
                    JOptionPane.showMessageDialog(null,
                            departamentos.getNombre() + " se registró en la lista de Deparatmentos", "Departamento agregado", 1);
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
    public boolean update(Departamento departamentos) {
        query = "{call RecursosHumanos.sp_changeDept(?,?)}";
        try {
            try (CallableStatement st = con.prepareCall(query)) {
                st.setInt(1, departamentos.getIdDepartamento());
                st.setString(2, departamentos.getNombre());

                st.executeUpdate();
                JOptionPane.showMessageDialog(null,
                        departamentos.getNombre() + " se actualizó correctamente", "Actualización exitosa", 1);
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
        query = "{call RecursosHumanos.sp_deleteDep(?)}";
        try {
            try (CallableStatement st = con.prepareCall(query)) {
                st.setInt(1, id);

                st.executeUpdate();
                JOptionPane.showMessageDialog(null, "El Departamento se dió de baja", "Baja exitosa", 1);
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
                
                while (rs.next()) {
                    int idDepartamento = rs.getInt("siguienteDepartamento");
                    return " " + String.format("%03d", idDepartamento);
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
