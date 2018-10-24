/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package vistas;
import beans.Deduccion;
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
public class Actualizar_Deduccion extends javax.swing.JFrame {
    IOTools txtFormat = new IOTools();
    Deduccion ded;
    JTable deducciones;
    ConexionSQL con;
    DAO dao;
    
    /**
     * Creates new form Insertar_Deduccion
     */
    public Actualizar_Deduccion(JTable tbl, Deduccion d) throws SQLException, IOException {
        initComponents();
        this.setLocationRelativeTo(null);
        
        con = ConexionSQL.getInstance();
        dao = new DAO(con.getConnection());
        deducciones = tbl;
        ded = d;
        
        txtFormat.limitar_texto(txtNombre, 30);
        txtFormat.limitar_texto(jTextArea1, 80);
        jTextArea1.setLineWrap(true);
        jTextArea1.setWrapStyleWord(true);
        
        txtIdDeduccion.setText(" " + String.format("%03d", ded.getIdDeduccion()));
        txtNombre.setText(ded.getNombre());
        jTextArea1.setText(ded.getDescripcion());
        jSpinnerPorcentaje.setValue(ded.getPorcentaje());
    }

    /**
     * This method is called from within the constructor to initialize the form.
     * WARNING: Do NOT modify this code. The content of this method is always
     * regenerated by the Form Editor.
     */
    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        jLabel1 = new javax.swing.JLabel();
        jLabel2 = new javax.swing.JLabel();
        jLabel3 = new javax.swing.JLabel();
        jLabel4 = new javax.swing.JLabel();
        jSpinnerPorcentaje = new javax.swing.JSpinner();
        txtIdDeduccion = new javax.swing.JTextField();
        txtNombre = new javax.swing.JTextField();
        btnGuardar = new javax.swing.JButton();
        jLabel5 = new javax.swing.JLabel();
        jScrollPane1 = new javax.swing.JScrollPane();
        jTextArea1 = new javax.swing.JTextArea();
        jLabel6 = new javax.swing.JLabel();

        setDefaultCloseOperation(javax.swing.WindowConstants.DISPOSE_ON_CLOSE);
        setTitle("Actualizar Deducción");
        getContentPane().setLayout(new org.netbeans.lib.awtextra.AbsoluteLayout());

        jLabel1.setFont(new java.awt.Font("Candara", 1, 14)); // NOI18N
        jLabel1.setText("ID Deducción:");
        getContentPane().add(jLabel1, new org.netbeans.lib.awtextra.AbsoluteConstraints(50, 70, 90, 30));

        jLabel2.setFont(new java.awt.Font("Candara", 1, 14)); // NOI18N
        jLabel2.setText("Nombre:");
        getContentPane().add(jLabel2, new org.netbeans.lib.awtextra.AbsoluteConstraints(50, 110, 90, 30));

        jLabel3.setFont(new java.awt.Font("Candara", 1, 14)); // NOI18N
        jLabel3.setText("Descripción:");
        getContentPane().add(jLabel3, new org.netbeans.lib.awtextra.AbsoluteConstraints(50, 160, 90, -1));

        jLabel4.setFont(new java.awt.Font("Candara", 1, 14)); // NOI18N
        jLabel4.setText("Porcentaje:");
        getContentPane().add(jLabel4, new org.netbeans.lib.awtextra.AbsoluteConstraints(50, 260, 90, 27));

        jSpinnerPorcentaje.setFont(new java.awt.Font("Tahoma", 0, 12)); // NOI18N
        jSpinnerPorcentaje.setModel(new javax.swing.SpinnerNumberModel(Float.valueOf(10.0f), Float.valueOf(0.1f), Float.valueOf(100.0f), Float.valueOf(1.0f)));
        getContentPane().add(jSpinnerPorcentaje, new org.netbeans.lib.awtextra.AbsoluteConstraints(150, 260, 60, 30));

        txtIdDeduccion.setEditable(false);
        txtIdDeduccion.setFont(new java.awt.Font("Tahoma", 0, 13)); // NOI18N
        getContentPane().add(txtIdDeduccion, new org.netbeans.lib.awtextra.AbsoluteConstraints(150, 70, 250, 30));

        txtNombre.setFont(new java.awt.Font("Tahoma", 0, 13)); // NOI18N
        getContentPane().add(txtNombre, new org.netbeans.lib.awtextra.AbsoluteConstraints(150, 110, 250, 30));

        btnGuardar.setIcon(new javax.swing.ImageIcon(getClass().getResource("/Iconos/save.png"))); // NOI18N
        btnGuardar.setToolTipText("Guardar");
        btnGuardar.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnGuardarActionPerformed(evt);
            }
        });
        getContentPane().add(btnGuardar, new org.netbeans.lib.awtextra.AbsoluteConstraints(330, 310, 70, 60));

        jLabel5.setFont(new java.awt.Font("Candara", 1, 36)); // NOI18N
        jLabel5.setHorizontalAlignment(javax.swing.SwingConstants.CENTER);
        jLabel5.setText("Actualizar Deducción");
        getContentPane().add(jLabel5, new org.netbeans.lib.awtextra.AbsoluteConstraints(0, 10, 440, 50));

        jTextArea1.setColumns(20);
        jTextArea1.setRows(5);
        jScrollPane1.setViewportView(jTextArea1);

        getContentPane().add(jScrollPane1, new org.netbeans.lib.awtextra.AbsoluteConstraints(150, 150, 250, 100));

        jLabel6.setForeground(new java.awt.Color(255, 255, 255));
        jLabel6.setIcon(new javax.swing.ImageIcon(getClass().getResource("/Iconos/telescope-science-discover-world.jpg"))); // NOI18N
        getContentPane().add(jLabel6, new org.netbeans.lib.awtextra.AbsoluteConstraints(-150, 0, 590, 400));

        pack();
    }// </editor-fold>//GEN-END:initComponents

    private void btnGuardarActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnGuardarActionPerformed
        String nombre = txtNombre.getText();
        String descripcion = jTextArea1.getText();
        String porcentaje = String.valueOf(jSpinnerPorcentaje.getValue());
        
        if(!nombre.equals("") && !descripcion.equals("")) {
            int ans = JOptionPane.showConfirmDialog(null, 
                "Se actualizará la deducción\n¿Deseas continuar?", "Advertencia", 2);

            if(ans == JOptionPane.YES_OPTION) {
                float porc = Float.valueOf(porcentaje);
                if(dao.deducciones.update(new Deduccion(ded.getIdDeduccion(), nombre, descripcion, porc, "A"))) {
                    txtFormat.borrar_tabla(deducciones);
                    dao.deducciones.getAll(deducciones);
                }
            }
        } else
            JOptionPane.showMessageDialog(null, "Se deben informar todos los campos", "Faltan datos", 2);
    }//GEN-LAST:event_btnGuardarActionPerformed

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
            java.util.logging.Logger.getLogger(Actualizar_Deduccion.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (InstantiationException ex) {
            java.util.logging.Logger.getLogger(Actualizar_Deduccion.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (IllegalAccessException ex) {
            java.util.logging.Logger.getLogger(Actualizar_Deduccion.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (javax.swing.UnsupportedLookAndFeelException ex) {
            java.util.logging.Logger.getLogger(Actualizar_Deduccion.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        }
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>

        /* Create and display the form */
        java.awt.EventQueue.invokeLater(new Runnable() {
            public void run() {
                try {
                    new Actualizar_Deduccion(null, null).setVisible(true);
                } catch (SQLException ex) {
                    Logger.getLogger(Actualizar_Deduccion.class.getName()).log(Level.SEVERE, null, ex);
                } catch (IOException ex) {
                    Logger.getLogger(Actualizar_Deduccion.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        });
    }

    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JButton btnGuardar;
    private javax.swing.JLabel jLabel1;
    private javax.swing.JLabel jLabel2;
    private javax.swing.JLabel jLabel3;
    private javax.swing.JLabel jLabel4;
    private javax.swing.JLabel jLabel5;
    private javax.swing.JLabel jLabel6;
    private javax.swing.JScrollPane jScrollPane1;
    private javax.swing.JSpinner jSpinnerPorcentaje;
    private javax.swing.JTextArea jTextArea1;
    private javax.swing.JTextField txtIdDeduccion;
    private javax.swing.JTextField txtNombre;
    // End of variables declaration//GEN-END:variables
}
