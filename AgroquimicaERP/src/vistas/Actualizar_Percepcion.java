/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package vistas;

import beans.Percepcion;
import conexion_bd.ConexionSQL;
import dao.DAO;
import java.io.IOException;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.swing.JOptionPane;
import javax.swing.JTable;
import tools.IOTools;

/**
 *
 * @author omar_
 */
public class Actualizar_Percepcion extends javax.swing.JFrame {
    IOTools txtFormat = new IOTools();
    JTable percepciones;
    Percepcion percp;
    ConexionSQL con;
    DAO dao;
    
    public Actualizar_Percepcion(JTable tbl, Percepcion p) throws SQLException, IOException {
        initComponents();
        this.setLocationRelativeTo(null);
        
        con = ConexionSQL.getInstance();
        dao = new DAO(con.getConnection());
        percepciones = tbl;
        percp = p;
        
        txtFormat.limitar_texto(txtNombre, 30);
        txtFormat.limitar_texto(jTextArea1, 80);
        jTextArea1.setLineWrap(true);
        jTextArea1.setWrapStyleWord(true);
        
        txtIdPercepcion.setText(" " + String.format("%03d", p.getIdPercepcion()));
        txtNombre.setText(p.getNombre());
        jTextArea1.setText(p.getDescripcion());
        spDias.setValue(p.getDiasPagar());
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
        txtIdPercepcion = new javax.swing.JTextField();
        jLabel2 = new javax.swing.JLabel();
        txtNombre = new javax.swing.JTextField();
        jLabel3 = new javax.swing.JLabel();
        spDias = new javax.swing.JSpinner();
        jLabel4 = new javax.swing.JLabel();
        btnSave = new javax.swing.JButton();
        jScrollPane1 = new javax.swing.JScrollPane();
        jTextArea1 = new javax.swing.JTextArea();
        jLabel6 = new javax.swing.JLabel();

        setDefaultCloseOperation(javax.swing.WindowConstants.DISPOSE_ON_CLOSE);
        setTitle("Actualizar Percepción");
        getContentPane().setLayout(new org.netbeans.lib.awtextra.AbsoluteLayout());

        jLabel5.setFont(new java.awt.Font("Candara", 1, 36)); // NOI18N
        jLabel5.setForeground(new java.awt.Color(255, 255, 255));
        jLabel5.setHorizontalAlignment(javax.swing.SwingConstants.CENTER);
        jLabel5.setText("Actualizar Percepción");
        getContentPane().add(jLabel5, new org.netbeans.lib.awtextra.AbsoluteConstraints(6, 11, 410, 50));

        jLabel1.setFont(new java.awt.Font("Candara", 1, 14)); // NOI18N
        jLabel1.setForeground(new java.awt.Color(255, 255, 255));
        jLabel1.setText("ID Percepción:");
        getContentPane().add(jLabel1, new org.netbeans.lib.awtextra.AbsoluteConstraints(39, 84, 90, -1));

        txtIdPercepcion.setEditable(false);
        txtIdPercepcion.setFont(new java.awt.Font("Tahoma", 0, 13)); // NOI18N
        getContentPane().add(txtIdPercepcion, new org.netbeans.lib.awtextra.AbsoluteConstraints(140, 80, 240, 30));

        jLabel2.setFont(new java.awt.Font("Candara", 1, 14)); // NOI18N
        jLabel2.setForeground(new java.awt.Color(255, 255, 255));
        jLabel2.setText("Nombre:");
        getContentPane().add(jLabel2, new org.netbeans.lib.awtextra.AbsoluteConstraints(40, 130, 90, -1));

        txtNombre.setFont(new java.awt.Font("Tahoma", 0, 13)); // NOI18N
        getContentPane().add(txtNombre, new org.netbeans.lib.awtextra.AbsoluteConstraints(140, 120, 240, 30));

        jLabel3.setFont(new java.awt.Font("Candara", 1, 14)); // NOI18N
        jLabel3.setForeground(new java.awt.Color(255, 255, 255));
        jLabel3.setText("Descripción:");
        getContentPane().add(jLabel3, new org.netbeans.lib.awtextra.AbsoluteConstraints(40, 170, -1, -1));

        spDias.setFont(new java.awt.Font("Tahoma", 0, 12)); // NOI18N
        spDias.setModel(new javax.swing.SpinnerNumberModel(5, 1, 1000, 2));
        getContentPane().add(spDias, new org.netbeans.lib.awtextra.AbsoluteConstraints(140, 270, 60, 30));

        jLabel4.setFont(new java.awt.Font("Candara", 1, 14)); // NOI18N
        jLabel4.setForeground(new java.awt.Color(255, 255, 255));
        jLabel4.setText("Días a Pagar:");
        getContentPane().add(jLabel4, new org.netbeans.lib.awtextra.AbsoluteConstraints(40, 270, 90, 20));

        btnSave.setIcon(new javax.swing.ImageIcon(getClass().getResource("/Iconos/save.png"))); // NOI18N
        btnSave.setToolTipText("Guardar ");
        btnSave.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnSaveActionPerformed(evt);
            }
        });
        getContentPane().add(btnSave, new org.netbeans.lib.awtextra.AbsoluteConstraints(320, 310, 60, 60));

        jTextArea1.setColumns(20);
        jTextArea1.setRows(5);
        jScrollPane1.setViewportView(jTextArea1);

        getContentPane().add(jScrollPane1, new org.netbeans.lib.awtextra.AbsoluteConstraints(140, 160, 240, -1));

        jLabel6.setForeground(new java.awt.Color(255, 255, 255));
        jLabel6.setIcon(new javax.swing.ImageIcon(getClass().getResource("/Iconos/pexels-photo-169789.jpg"))); // NOI18N
        getContentPane().add(jLabel6, new org.netbeans.lib.awtextra.AbsoluteConstraints(-140, -110, 560, 510));

        pack();
    }// </editor-fold>//GEN-END:initComponents

    private void btnSaveActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnSaveActionPerformed
        String nombre = txtNombre.getText();
        String descripcion = jTextArea1.getText();
        String dias = String.valueOf(spDias.getValue());
        
        if(!nombre.equals("") && !descripcion.equals("")) {
            int ans = JOptionPane.showConfirmDialog(null, 
                "Se actualizará la percepción\n¿Deseas continuar?", "Advertencia", 2);

            if(ans == JOptionPane.YES_OPTION) {
                if(es_numerico(dias)) {
                    int d = Integer.valueOf(dias);
                    if(dao.percepciones.update(new Percepcion(percp.getIdPercepcion(), nombre, descripcion, d, "A"))) {
                        txtFormat.borrar_tabla(percepciones);
                        dao.percepciones.getAll(percepciones);
                    }
                } else
                    JOptionPane.showMessageDialog(null, "Verifique los datos ingresados", "Error", 0);
            }
        } else
            JOptionPane.showMessageDialog(null, "Se deben informar todos los campos", "Faltan datos", 2);
    }//GEN-LAST:event_btnSaveActionPerformed

     /**
     * Verifica si un String es un entero mayor o igual que cero.
     * @param s Objeto String a validar.
     * @return Retorna verdadero si el String s es un numéro n >= 0.
     */
    public boolean es_numerico(String s){
        try{
            int n = Integer.valueOf(s);
            return n >= 0;
        } catch(Exception e){ }
          return false;
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
            java.util.logging.Logger.getLogger(Actualizar_Percepcion.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (InstantiationException ex) {
            java.util.logging.Logger.getLogger(Actualizar_Percepcion.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (IllegalAccessException ex) {
            java.util.logging.Logger.getLogger(Actualizar_Percepcion.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (javax.swing.UnsupportedLookAndFeelException ex) {
            java.util.logging.Logger.getLogger(Actualizar_Percepcion.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        }
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>

        /* Create and display the form */
        java.awt.EventQueue.invokeLater(new Runnable() {
            public void run() {
                try {
                    new Actualizar_Percepcion(null, null).setVisible(true);
                } catch (SQLException ex) {
                    Logger.getLogger(Actualizar_Percepcion.class.getName()).log(Level.SEVERE, null, ex);
                } catch (IOException ex) {
                    Logger.getLogger(Actualizar_Percepcion.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        });
    }

    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JButton btnSave;
    private javax.swing.JLabel jLabel1;
    private javax.swing.JLabel jLabel2;
    private javax.swing.JLabel jLabel3;
    private javax.swing.JLabel jLabel4;
    private javax.swing.JLabel jLabel5;
    private javax.swing.JLabel jLabel6;
    private javax.swing.JScrollPane jScrollPane1;
    private javax.swing.JTextArea jTextArea1;
    private javax.swing.JSpinner spDias;
    private javax.swing.JTextField txtIdPercepcion;
    private javax.swing.JTextField txtNombre;
    // End of variables declaration//GEN-END:variables
}