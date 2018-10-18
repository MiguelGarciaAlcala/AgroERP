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
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.swing.JOptionPane;
import javax.swing.JTable;
import javax.swing.table.DefaultTableModel;

/**
 *
 * @author Miguel
 */
public class PuestosDAO extends CRUD<Puesto, Integer> {

    public PuestosDAO(Connection con) {
        this.con = con;
    }

    @Override
    public void getAll(JTable tbl) {
        DefaultTableModel tmp = (DefaultTableModel) tbl.getModel();
        this.query = "{call RecursosHumanos.sp_chekPuesto()}";

        try {
            try (CallableStatement st = con.prepareCall(this.query)) {
                rs = st.executeQuery();

                while (rs.next()) {
                    int idPuesto = rs.getInt("idPuesto");
                    String nombre = rs.getString("nombre");
                    double salarioMin = rs.getDouble("salarioMinimo");
                    double salarioMax = rs.getDouble("salarioMaximo");
                    String estatus = rs.getString("estatus");

                    Object registro[]
                            = {idPuesto, nombre, salarioMin, salarioMax, parseEstatus(estatus)};

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
        query = "{call RecursosHumanos.sp_changePuesto(?,?,?,?)}";
        try {
            try (CallableStatement st = con.prepareCall(query)) {
                st.setInt(1, puestos.getIdPuesto());
                st.setString(2, puestos.getNombre());
                st.setDouble(3, puestos.getSalarioMinimo());
                st.setDouble(4, puestos.getSalarioMaximo());

                st.executeUpdate();
                JOptionPane.showMessageDialog(null,
                        puestos.getNombre() + " se actualizó correctamente", "Actualización exitosa", 1);
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
                JOptionPane.showMessageDialog(null, "El Puesto se dió de baja", "Baja exitosa", 1);
                return true;
            }
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, "Ocurrió un error al eliminar el puesto", "Error de eliminación", 0);
            Logger.getLogger(PuestosDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    private String parseEstatus(String estatus) {
        return estatus.equals("A") ? "Activo" : "Inactivo";
    }
}
