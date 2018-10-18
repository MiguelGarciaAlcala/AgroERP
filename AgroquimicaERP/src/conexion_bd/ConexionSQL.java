/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package conexion_bd;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author Miguel-sama
 */
public class ConexionSQL {
    
    private final String url = "jdbc:sqlserver://LENOVOPC\\localhost:1433;databaseName=AgroSe";
    private static ConexionSQL ins;
    private Credenciales id;
    private Connection con;

    private ConexionSQL() throws SQLException, IOException {
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            this.id = new Credenciales("agro_erp");
            
            this.con = DriverManager.getConnection(url, id.getUser(), id.getPassword());
            System.out.println(!this.con.isClosed());
        } catch (ClassNotFoundException ex) {
            System.out.println("Error al establecer conexión con la BD: " + ex.getMessage());
        }
    }

    public Connection getConnection() {
        return this.con;
    }

    public static ConexionSQL getInstance() throws SQLException, IOException {
        if (ins == null)
            ins = new ConexionSQL();
        else if (ins.getConnection().isClosed())
            ins = new ConexionSQL();

        return ins;
    }
}
