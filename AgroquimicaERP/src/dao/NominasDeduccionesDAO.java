package dao;
import beans.NominasDeducciones;
import java.sql.Connection;
import javax.swing.JTable;

public class NominasDeduccionesDAO extends CRUD<NominasDeducciones, int[]> {

    public NominasDeduccionesDAO(Connection con) {
        this.con = con;
    }
    
    @Override
    public void getAll(JTable tbl) {
        
    }

    @Override
    public boolean insert(NominasDeducciones registro) {
        return true;
    }

    @Override
    public boolean update(NominasDeducciones registro) {
        return true;
    }

    @Override
    public boolean delete(int[] id) {
        return true;
    }
    
}
