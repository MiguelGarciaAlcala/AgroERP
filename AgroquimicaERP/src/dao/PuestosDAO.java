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
import javax.swing.JTable;

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

    }

    @Override
    public boolean insert(Puesto registro) {
        return true;
    }

    @Override
    public boolean update(Puesto registro) {
        return true;
    }

    @Override
    public boolean delete(Integer id) {
        return true;
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
            Logger.getLogger(PuestosDAO.class.getName()).log(Level.SEVERE, null, ex);
        }   return null;  
    }
}
