/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.sql.Connection;
import javax.swing.JTable;
import beans.Empleado;
import java.sql.CallableStatement;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.swing.DefaultComboBoxModel;
import javax.swing.JComboBox;
import javax.swing.JOptionPane;
import javax.swing.table.DefaultTableModel;

/**
 *
 * @author Miguel
 */
public class EmpleadosDAO extends CRUD <Empleado, Integer> {

    public EmpleadosDAO(Connection con) {
        this.con = con;
    }

    @Override
    public void getAll(JTable tbl) {
        DefaultTableModel tmp = (DefaultTableModel) tbl.getModel();
        this.query = "{call RecursosHumanos.sp_getEmployees()}";
        
        try {
            try (CallableStatement st = con.prepareCall(this.query)) {
                rs = st.executeQuery();
                
                while (rs.next()) {                    
                    int idEmpleado = rs.getInt("idEmpleado");
                    String nombreP = rs.getString("nombreP");
                    String nombreD = rs.getString("nombreD");
                    String nombreS = rs.getString("nombreS");
                    String nombreComp = rs.getString("nombreComp");
                    String dir = rs.getString("dir");
                    
                    Object registro[] = {idEmpleado, nombreComp, dir, nombreD, nombreP, nombreS};
                    
                    tmp.addRow(registro);
                }   tbl.setModel(tmp);
            }
        } catch (SQLException ex) {
            Logger.getLogger(EmpleadosDAO.class.getName()).log(Level.SEVERE, null, ex);
        } 
    }

    @Override
    public boolean insert(Empleado emp) {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        this.query = "{call RecursosHumanos.sp_addEmployee(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)}";
        try {
            try (CallableStatement st = con.prepareCall(query)) {
                st.setString(1, emp.getNombre());
                st.setString(2, emp.getApaterno());
                st.setString(3, emp.getAmaterno());
                st.setString(4, emp.getSexo());
                st.setDate(5, java.sql.Date.valueOf(sdf.format(emp.getFechaContratacion())));
                st.setDate(6, java.sql.Date.valueOf(sdf.format(emp.getFechaNacimiento())));
                st.setFloat(7, emp.getSalario());
                st.setString(8, emp.getNSS());
                st.setString(9, emp.getEstadoCivil());
                st.setInt(10, emp.getDiasVacacionales());
                st.setInt(11, emp.getDiasPermiso());
                
                byte []foto = emp.getFotografia();
                if(foto != null)
                    st.setBytes(12, foto);
                else
                    st.setNull(12, java.sql.Types.VARBINARY);
                
                st.setString(13, emp.getDireccion());
                st.setString(14, emp.getColonia());
                st.setString(15, emp.getCodigoPostal());
                st.setString(16, emp.getEscolaridad());
                st.setFloat(17, emp.getPorcentajeComision());
                st.setInt(18, emp.getIdDepartamento());
                st.setInt(19, emp.getIdPuesto());
                st.setInt(20, emp.getIdCiudad());
                st.setInt(21, emp.getIdSucursal());
                
                if(st.executeUpdate() > 0) {
                    JOptionPane.showMessageDialog(null, "Empleado registrado", "Registro exitoso", 1);
                    return true;
                }
            }
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, "Ocurrió un error al ingresar los datos ", "Error", 0);
        }   return false;
    }

    @Override
    public boolean update(Empleado emp) {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        query = "{call RecursosHumanos.sp_updateEmployee(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)}";
        try {
            try (CallableStatement st = con.prepareCall(query)) {
                st.setInt(1, emp.getIdEmpleado());
                st.setString(2, emp.getNombre());
                st.setString(3, emp.getApaterno());
                st.setString(4, emp.getAmaterno());
                st.setString(5, emp.getSexo());
                st.setDate(6, java.sql.Date.valueOf(sdf.format(emp.getFechaContratacion())));
                st.setDate(7, java.sql.Date.valueOf(sdf.format(emp.getFechaNacimiento())));
                st.setFloat(8, emp.getSalario());
                st.setString(9, emp.getNSS());
                st.setString(10, emp.getEstadoCivil());
                st.setInt(11, emp.getDiasVacacionales());
                st.setInt(12, emp.getDiasPermiso());
                
                byte []foto = emp.getFotografia();
                if(foto != null)
                    st.setBytes(13, foto);
                else
                    st.setNull(13, java.sql.Types.VARBINARY);
                
                st.setString(14, emp.getDireccion());
                st.setString(15, emp.getColonia());
                st.setString(16, emp.getCodigoPostal());
                st.setString(17, emp.getEscolaridad());
                st.setFloat(18, emp.getPorcentajeComision());
                st.setInt(19, emp.getIdDepartamento());
                st.setInt(20, emp.getIdPuesto());
                st.setInt(21, emp.getIdCiudad());
                st.setInt(22, emp.getIdSucursal());
                
                st.executeUpdate();
                return true;
            }
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, "Ocurrió un error al actualizar los datos", "Error de actualización", 0);
            Logger.getLogger(CiudadesDAO.class.getName()).log(Level.SEVERE, null, ex);
        }   return false;
    }

    @Override
    public boolean delete(Integer id) {
        query = "{call RecursosHumanos.sp_killEmployee(?)}";
        try {
            try (CallableStatement st = con.prepareCall(query)) {
                st.setInt(1, id);
                
                st.executeUpdate();
                return true;
            }
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, "Ocurrió un error al eliminar la Ciudad", "Error de eliminación", 0);
            Logger.getLogger(CiudadesDAO.class.getName()).log(Level.SEVERE, null, ex);
        }   return false;
    }
    
    public Object[] get(int id) {
        this.query = "{call RecursosHumanos.sp_getEmployee(?)}";
        Object emp[];
        
        try {
            try (CallableStatement st = con.prepareCall(this.query)) {
                st.setInt(1, id);
                rs = st.executeQuery();
                
                if (rs.next()) {
                    String nombre = rs.getString("nombre");
                    String apaterno = rs.getString("apaterno");
                    String amaterno = rs.getString("amaterno");
                    String sexo = rs.getString("sexo");
                    String fechaC = rs.getString("fechaContratacion");
                    String fechaN = rs.getString("fechaNacimiento");
                    float salario = rs.getFloat("salario");
                    String NSS = rs.getString("nss");
                    String estadoC = rs.getString("estadoCivil");
                    int diasV = rs.getInt("diasVacacionales");
                    int diasP = rs.getInt("diasPermiso");
                    byte foto[] = rs.getBytes("fotografia");
                    String direccion = rs.getString("direccion");
                    String colonia = rs.getString("colonia");
                    String cp = rs.getString("codigoPostal");
                    String escolaridad = rs.getString("escolaridad");
                    float porc = rs.getFloat("porcentajeComision");
                    String nombreP = rs.getString("nombreP");
                    String nombreD = rs.getString("nombreD");
                    String nombreS = rs.getString("nombreS");
                    String nombreC = rs.getString("nombreC");
                    
                    emp = new Object[] {nombre, apaterno, amaterno, sexo, fechaC, fechaN, salario, NSS, estadoC,
                        diasV, diasP, foto, direccion, colonia, cp, escolaridad, porc, nombreP, nombreD, nombreS, nombreC};
                    
                    return emp;
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(EmpleadosDAO.class.getName()).log(Level.SEVERE, null, ex);
        } return null;
    }
    
    public String next() {
        this.query = "{call RecursosHumanos.sp_nextEmployee()}";
        
        try {
            try (CallableStatement st = con.prepareCall(this.query)) {
                rs = st.executeQuery();
                
                while (rs.next()) {
                    int idEmp = rs.getInt("siguienteEmp");
                    return " " + String.format("%03d", idEmp);
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(CiudadesDAO.class.getName()).log(Level.SEVERE, null, ex);
        } return null;
    }
    
    public HashMap list(JComboBox cmb) {
        DefaultComboBoxModel tmp = (DefaultComboBoxModel) cmb.getModel();
        query = "{call RecursosHumanos.sp_listEmployees}";
        HashMap<Integer, Integer> emp = new HashMap<>();
        
        try {
            try (CallableStatement st = con.prepareCall(query)) {
                rs = st.executeQuery();
                
                int i = 0;
                while (rs.next()) {
                    int clave = rs.getInt("idEmpleado");
                    String nombre = rs.getString("nombreComp");
                    
                    emp.put(i++, clave);
                    tmp.addElement(nombre);
                }   cmb.setModel(tmp);
                    return emp;
            }
        } catch (SQLException ex) {
            Logger.getLogger(CiudadesDAO.class.getName()).log(Level.SEVERE, null, ex);
        }   return null;  
    }
}
