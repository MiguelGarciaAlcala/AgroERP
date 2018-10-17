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
import java.util.HashMap;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.swing.DefaultComboBoxModel;
import javax.swing.JComboBox;
import javax.swing.JTable;

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
        
    }

    @Override
    public boolean insert(Departamento registro) {
        return true;
    }

    @Override
    public boolean update(Departamento registro) {
        return true;
    }

    @Override
    public boolean delete(Integer id) {
        return true;
    }
    
    public HashMap list(JComboBox cmb) {
        DefaultComboBoxModel tmp = (DefaultComboBoxModel) cmb.getModel();
        query = "{call RecursosHumanos.sp_listDep}";
        HashMap<Integer, Integer> deptos = new HashMap<>();
        
        try {
            try (CallableStatement st = con.prepareCall(query)) {
                rs = st.executeQuery();
                
                int i = 0;
                while (rs.next()) {
                    int clave = rs.getInt("idDepartamento");
                    String nombre = rs.getString("nombre");
                    
                    deptos.put(i++, clave);
                    tmp.addElement(nombre);
                }   cmb.setModel(tmp);
                    return deptos;
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
}
