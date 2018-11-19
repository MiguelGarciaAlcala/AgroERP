package dao;
import beans.Nominas;
import java.sql.Connection;
import javax.swing.JTable;

public class NominasDAO extends CRUD<Nominas, Integer> {

    public NominasDAO(Connection con) {
        this.con = con;
    }
    
    @Override
    public void getAll(JTable tbl) {

    }

    @Override
    public boolean insert(Nominas registro) {
        return true;
    }

    @Override
    public boolean update(Nominas registro) {
        return true;
    }

    @Override
    public boolean delete(Integer id) {
        return true;
    }
}
