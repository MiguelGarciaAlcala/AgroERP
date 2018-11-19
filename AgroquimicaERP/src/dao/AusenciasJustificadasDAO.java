package dao;
import beans.AusenciasJustificadas;
import java.sql.Connection;
import javax.swing.JTable;

public class AusenciasJustificadasDAO extends CRUD<AusenciasJustificadas, Integer> {

    public AusenciasJustificadasDAO(Connection con) {
        this.con = con;
    }

    @Override
    public void getAll(JTable tbl) {
        
    }

    @Override
    public boolean insert(AusenciasJustificadas registro) {
        return true;
    }

    @Override
    public boolean update(AusenciasJustificadas registro) {
        return true;
    }

    @Override
    public boolean delete(Integer id) {
        return true;
    }
    
}
