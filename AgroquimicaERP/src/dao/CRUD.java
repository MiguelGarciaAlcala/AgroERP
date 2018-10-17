/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import javax.swing.JTable;

/**
 *
 * @author Miguel
 * @param <T1>
 * @param <T2>
 */

public abstract class CRUD <T1, T2> {
    public String query;
    public Connection con;
    public Statement stn;
    public ResultSet rs;
    
    public abstract void getAll(JTable tbl);
    public abstract boolean insert(T1 registro);
    public abstract boolean update(T1 registro);
    public abstract boolean delete(T2 id);
}
