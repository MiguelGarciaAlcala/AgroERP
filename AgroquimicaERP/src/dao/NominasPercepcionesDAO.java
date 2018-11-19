package dao;
import beans.NominasPercepciones;
import java.sql.Connection;
import javax.swing.JTable;

public class NominasPercepcionesDAO extends CRUD<NominasPercepciones, int[]> {

    public NominasPercepcionesDAO(Connection con) {
        this.con = con;
    }
    
    @Override
    public void getAll(JTable tbl) {

    }

    @Override
    public boolean insert(NominasPercepciones registro) {
        return true;
    }

    @Override
    public boolean update(NominasPercepciones registro) {
        return true;
    }

    @Override
    public boolean delete(int[] id) {
        return true;
    }
    
}
