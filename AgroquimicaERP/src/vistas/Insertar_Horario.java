/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package vistas;

import beans.Horario;
import conexion_bd.ConexionSQL;
import dao.DAO;
import java.io.IOException;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.swing.JOptionPane;
import javax.swing.JSpinner;
import javax.swing.JTable;
import javax.swing.SpinnerDateModel;
import tools.IOTools;

/**
 *
 * @author alt-j
 */
public class Insertar_Horario extends javax.swing.JFrame {
    HashMap<Integer, Integer> emp;
    IOTools txtFormat = new IOTools();
    JTable horarios;
    ConexionSQL con;
    DAO dao;
    
    public Insertar_Horario(JTable tbl) throws SQLException, IOException {
        initComponents();
        this.setLocationRelativeTo(null);
        
        spHI.setValue(new Date(-18*60*60*1000));
        spHF.setValue(new Date(-18*60*60*1000));
        
        con = ConexionSQL.getInstance();
        dao = new DAO(con.getConnection());
        horarios = tbl;
        
        txtIdHorario.setText(dao.horarios.next());
        emp = dao.empleados.list(cmbEmp);
    }

    /**
     * This method is called from within the constructor to initialize the form.
     * WARNING: Do NOT modify this code. The content of this method is always
     * regenerated by the Form Editor.
     */
    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        jLabel5 = new javax.swing.JLabel();
        jLabel1 = new javax.swing.JLabel();
        txtIdHorario = new javax.swing.JTextField();
        jLabel2 = new javax.swing.JLabel();
        jLabel3 = new javax.swing.JLabel();
        btnGuardar = new javax.swing.JButton();
        jLabel4 = new javax.swing.JLabel();
        jLabel7 = new javax.swing.JLabel();
        cmbEmp = new javax.swing.JComboBox<>();
        Date date = new Date();
        SpinnerDateModel sm =
        new SpinnerDateModel(date, null, null, Calendar.HOUR_OF_DAY);
        spHI = new javax.swing.JSpinner(sm);
        Date date1 = new Date();
        SpinnerDateModel sm1 =
        new SpinnerDateModel(date1, null, null, Calendar.HOUR_OF_DAY);
        spHF = new javax.swing.JSpinner(sm1);
        jPanel1 = new javax.swing.JPanel();
        chbLun = new javax.swing.JCheckBox();
        chbVie = new javax.swing.JCheckBox();
        chbJue = new javax.swing.JCheckBox();
        chbMar = new javax.swing.JCheckBox();
        chbSab = new javax.swing.JCheckBox();
        chbMie = new javax.swing.JCheckBox();
        chbDom = new javax.swing.JCheckBox();
        jLabel6 = new javax.swing.JLabel();

        setDefaultCloseOperation(javax.swing.WindowConstants.DISPOSE_ON_CLOSE);
        setTitle("Registrar horario");
        getContentPane().setLayout(new org.netbeans.lib.awtextra.AbsoluteLayout());

        jLabel5.setFont(new java.awt.Font("Candara", 1, 36)); // NOI18N
        jLabel5.setHorizontalAlignment(javax.swing.SwingConstants.CENTER);
        jLabel5.setText("Registrar Horario");
        getContentPane().add(jLabel5, new org.netbeans.lib.awtextra.AbsoluteConstraints(-50, 10, 430, 50));

        jLabel1.setFont(new java.awt.Font("Candara", 1, 14)); // NOI18N
        jLabel1.setText("ID Horario:");
        getContentPane().add(jLabel1, new org.netbeans.lib.awtextra.AbsoluteConstraints(50, 70, 80, 30));

        txtIdHorario.setEditable(false);
        txtIdHorario.setFont(new java.awt.Font("Tahoma", 0, 13)); // NOI18N
        getContentPane().add(txtIdHorario, new org.netbeans.lib.awtextra.AbsoluteConstraints(140, 70, 120, 30));

        jLabel2.setFont(new java.awt.Font("Candara", 1, 14)); // NOI18N
        jLabel2.setText("Hora Inicio:");
        getContentPane().add(jLabel2, new org.netbeans.lib.awtextra.AbsoluteConstraints(50, 110, 80, 30));

        jLabel3.setFont(new java.awt.Font("Candara", 1, 14)); // NOI18N
        jLabel3.setText("Empleado:");
        getContentPane().add(jLabel3, new org.netbeans.lib.awtextra.AbsoluteConstraints(50, 270, 80, 30));

        btnGuardar.setIcon(new javax.swing.ImageIcon(getClass().getResource("/Iconos/save.png"))); // NOI18N
        btnGuardar.setToolTipText("Guardar");
        btnGuardar.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnGuardarActionPerformed(evt);
            }
        });
        getContentPane().add(btnGuardar, new org.netbeans.lib.awtextra.AbsoluteConstraints(320, 330, 70, 60));

        jLabel4.setFont(new java.awt.Font("Candara", 1, 14)); // NOI18N
        jLabel4.setText("Hora Fin:");
        getContentPane().add(jLabel4, new org.netbeans.lib.awtextra.AbsoluteConstraints(50, 150, 80, 30));

        jLabel7.setFont(new java.awt.Font("Candara", 1, 14)); // NOI18N
        jLabel7.setText("Días:");
        getContentPane().add(jLabel7, new org.netbeans.lib.awtextra.AbsoluteConstraints(50, 200, 80, 30));

        cmbEmp.setBackground(new java.awt.Color(243, 243, 243));
        getContentPane().add(cmbEmp, new org.netbeans.lib.awtextra.AbsoluteConstraints(140, 270, 250, 30));

        JSpinner.DateEditor de = new JSpinner.DateEditor(spHI, "HH:mm");
        spHI.setEditor(de);
        getContentPane().add(spHI, new org.netbeans.lib.awtextra.AbsoluteConstraints(140, 110, 120, 30));

        JSpinner.DateEditor de1 = new JSpinner.DateEditor(spHF, "HH:mm");
        spHF.setEditor(de1);
        getContentPane().add(spHF, new org.netbeans.lib.awtextra.AbsoluteConstraints(140, 150, 120, 30));

        jPanel1.setBackground(new java.awt.Color(243, 243, 243));
        jPanel1.setBorder(javax.swing.BorderFactory.createEtchedBorder());

        chbLun.setBackground(new java.awt.Color(243, 243, 243));
        chbLun.setText("LUN");

        chbVie.setBackground(new java.awt.Color(243, 243, 243));
        chbVie.setText("VIE");

        chbJue.setBackground(new java.awt.Color(243, 243, 243));
        chbJue.setText("JUE");

        chbMar.setBackground(new java.awt.Color(243, 243, 243));
        chbMar.setText("MAR");

        chbSab.setBackground(new java.awt.Color(243, 243, 243));
        chbSab.setText("SÁB");

        chbMie.setBackground(new java.awt.Color(243, 243, 243));
        chbMie.setText("MIE");

        chbDom.setBackground(new java.awt.Color(243, 243, 243));
        chbDom.setText("DOM");

        javax.swing.GroupLayout jPanel1Layout = new javax.swing.GroupLayout(jPanel1);
        jPanel1.setLayout(jPanel1Layout);
        jPanel1Layout.setHorizontalGroup(
            jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel1Layout.createSequentialGroup()
                .addContainerGap()
                .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(chbLun)
                    .addComponent(chbVie))
                .addGap(12, 12, 12)
                .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(chbSab)
                    .addComponent(chbMar))
                .addGap(12, 12, 12)
                .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(jPanel1Layout.createSequentialGroup()
                        .addComponent(chbMie)
                        .addGap(12, 12, 12)
                        .addComponent(chbJue))
                    .addComponent(chbDom))
                .addContainerGap(26, Short.MAX_VALUE))
        );
        jPanel1Layout.setVerticalGroup(
            jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel1Layout.createSequentialGroup()
                .addContainerGap()
                .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(chbLun)
                    .addComponent(chbMar)
                    .addComponent(chbMie)
                    .addComponent(chbJue))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(chbVie)
                    .addComponent(chbDom)
                    .addComponent(chbSab))
                .addContainerGap(10, Short.MAX_VALUE))
        );

        getContentPane().add(jPanel1, new org.netbeans.lib.awtextra.AbsoluteConstraints(140, 190, 250, 70));

        jLabel6.setForeground(new java.awt.Color(255, 255, 255));
        jLabel6.setIcon(new javax.swing.ImageIcon(getClass().getResource("/Iconos/pexels-photo-1179476.jpeg"))); // NOI18N
        getContentPane().add(jLabel6, new org.netbeans.lib.awtextra.AbsoluteConstraints(-300, -60, 730, 470));

        pack();
    }// </editor-fold>//GEN-END:initComponents

    private void btnGuardarActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnGuardarActionPerformed
        SimpleDateFormat sdf = new SimpleDateFormat("HH:mm");
        
        if(cmbEmp.getItemCount() > 0) {
            String hi = sdf.format((Date) spHI.getValue());
            String hf = sdf.format((Date) spHF.getValue());
            
            String arr[] = {chbLun.isSelected() ? "Lun" : "",
                            chbMar.isSelected() ? "Mar" : "",
                            chbMie.isSelected() ? "Mie" : "",
                            chbJue.isSelected() ? "Jue" : "",
                            chbVie.isSelected() ? "Vie" : "",
                            chbSab.isSelected() ? "Sab" : "",
                            chbDom.isSelected() ? "Dom" : ""};
            
            ArrayList <String> dias = new ArrayList<>();
            
            for(int i=0; i<7; ++i)
                if(!arr[i].equals(""))
                    dias.add(arr[i]);
            
            if(compare(hi, hf) < 0) {
                if(!dias.isEmpty()) {
                    if((hi != null) && (hf != null)) {
                        int idEmp = emp.get(cmbEmp.getSelectedIndex());
                        ArrayList <String[]> hrs = dao.horarios.get(idEmp);
                        String day_arr = day_string(dias);
                        
                        ArrayList <String> rep = new ArrayList<>();
                        boolean repeat = false;
                        
                        if(!hrs.isEmpty()) {
                            for(String[] d : hrs) {
                                for(int k=0; k<d.length; k++) {
                                    for(String dia : dias)
                                        if(dia.equals(d[k])) {
                                            if(!rep.contains(dia))
                                                rep.add(dia);
                                            repeat = true;
                                        }
                                }
                            }
                        }
                        
                        if(!repeat) {
                            if(dao.horarios.insert(new Horario(hi, hf, day_arr, idEmp))) {
                                txtFormat.borrar_tabla(horarios);
                                dao.horarios.getAll(horarios);
                                nuevo();
                            }
                        } else
                            JOptionPane.showMessageDialog(null, "Los días " + day_string(rep) +" ya están asignados.\n"
                                    + "Para actualizarlos ingrese a Horarios > Actualizar o ingrese un horario nuevo.", "Horario existente", 2);
                    } else
                        JOptionPane.showMessageDialog(null, "El formato de hora es incorrecto", "Formato incorrecto", 2);
                } else
                    JOptionPane.showMessageDialog(null, "Seleccione al menos un día", "Datos incompletos", 2);
            } else
                JOptionPane.showMessageDialog(null, "Ingrese un horario válido", "Horario no válido", 2);
        } else
            JOptionPane.showMessageDialog(null, "No hay empleados registrados", "Advertencia", 0);
    }//GEN-LAST:event_btnGuardarActionPerformed
    
    public void nuevo() {
        txtIdHorario.setText(dao.horarios.next());
        spHI.setValue(new Date(-18*60*60*1000));
        spHF.setValue(new Date(-18*60*60*1000));
        chbDom.setSelected(false);
        chbLun.setSelected(false);
        chbMar.setSelected(false);
        chbMie.setSelected(false);
        chbJue.setSelected(false);
        chbVie.setSelected(false);
        chbSab.setSelected(false);
        try {cmbEmp.setSelectedIndex(0);} catch(Exception e) {};
    }
    
    public String day_string(ArrayList<String> days) {
        String hr = "";
        int len = days.size() - 1, i=0;

        for(String dia : days) {
            if(i == len)
                hr += dia;
            else
                hr += (dia + ",");
            ++i;
        }
        return hr;
    }
    
    public int compare(String h1, String h2) {
        String ha[] = h1.split(":");
        String hb[] = h2.split(":");
        
        int hai[] = {Integer.valueOf(ha[0]), Integer.valueOf(ha[1])}; 
        int hbi[] = {Integer.valueOf(hb[0]), Integer.valueOf(hb[1])};
        
        if(hai[0] == hbi[0]) {
            if(hai[1] == hbi[1])
                return 0;
            else if(hai[1] < hbi[1])
                return -1;
            else
                return 1;
        }
        else if(hai[0] < hbi[0])
            return -1;
        else
            return 1;
    }
    
    /**
     * @param args the command line arguments
     */
    public static void main(String args[]) {
        /* Set the Nimbus look and feel */
        //<editor-fold defaultstate="collapsed" desc=" Look and feel setting code (optional) ">
        /* If Nimbus (introduced in Java SE 6) is not available, stay with the default look and feel.
         * For details see http://download.oracle.com/javase/tutorial/uiswing/lookandfeel/plaf.html 
         */
        try {
            for (javax.swing.UIManager.LookAndFeelInfo info : javax.swing.UIManager.getInstalledLookAndFeels()) {
                if ("Nimbus".equals(info.getName())) {
                    javax.swing.UIManager.setLookAndFeel(info.getClassName());
                    break;
                }
            }
        } catch (ClassNotFoundException ex) {
            java.util.logging.Logger.getLogger(Insertar_Horario.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (InstantiationException ex) {
            java.util.logging.Logger.getLogger(Insertar_Horario.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (IllegalAccessException ex) {
            java.util.logging.Logger.getLogger(Insertar_Horario.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (javax.swing.UnsupportedLookAndFeelException ex) {
            java.util.logging.Logger.getLogger(Insertar_Horario.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        }
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>

        /* Create and display the form */
        java.awt.EventQueue.invokeLater(new Runnable() {
            public void run() {
                try {
                    new Insertar_Horario(null).setVisible(true);
                } catch (SQLException ex) {
                    Logger.getLogger(Insertar_Horario.class.getName()).log(Level.SEVERE, null, ex);
                } catch (IOException ex) {
                    Logger.getLogger(Insertar_Horario.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        });
    }

    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JButton btnGuardar;
    private javax.swing.JCheckBox chbDom;
    private javax.swing.JCheckBox chbJue;
    private javax.swing.JCheckBox chbLun;
    private javax.swing.JCheckBox chbMar;
    private javax.swing.JCheckBox chbMie;
    private javax.swing.JCheckBox chbSab;
    private javax.swing.JCheckBox chbVie;
    private javax.swing.JComboBox<String> cmbEmp;
    private javax.swing.JLabel jLabel1;
    private javax.swing.JLabel jLabel2;
    private javax.swing.JLabel jLabel3;
    private javax.swing.JLabel jLabel4;
    private javax.swing.JLabel jLabel5;
    private javax.swing.JLabel jLabel6;
    private javax.swing.JLabel jLabel7;
    private javax.swing.JPanel jPanel1;
    private javax.swing.JSpinner spHF;
    private javax.swing.JSpinner spHI;
    private javax.swing.JTextField txtIdHorario;
    // End of variables declaration//GEN-END:variables
}
