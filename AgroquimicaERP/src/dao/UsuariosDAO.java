package dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.swing.JOptionPane;
import javax.swing.JTable;

/**
 *
 * @author Miguel-sama
 */
public class UsuariosDAO extends CRUD {

    public UsuariosDAO(Connection con) {
        this.con = con;
    }
    
    public String exists(String username, String password) {
        query = "{call Usuarios.sp_existsUser(?,?)}";
        try {      
            try (CallableStatement st = con.prepareCall(query)) {
                st.setString(1, username);
                st.setString(2, password);
                rs = st.executeQuery();
                
                if(rs.next()) {
                    if(rs.getString("estatus").equals("A")) {
                        String nombre = rs.getString("nombre");
                        String apaterno = rs.getString("apaterno");
                        String amaterno = rs.getString("amaterno");
                        
                        return nombre + " " + apaterno + " " + amaterno;
                    }
                    else
                        JOptionPane.showMessageDialog(null, "No es posible iniciar sesión", "Usuario bloqueado", 2);
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(UsuariosDAO.class.getName()).log(Level.SEVERE, null, ex);
        }   return null;   
    }

    @Override
    public void getAll(JTable tbl) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean insert(Object registro) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean update(Object registro) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean delete(Object id) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }    
}
