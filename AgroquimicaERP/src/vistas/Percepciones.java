/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package vistas;

import com.placeholder.PlaceHolder;
import conexion_bd.ConexionSQL;
import dao.DAO;
import java.awt.Color;
import java.io.IOException;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.swing.JOptionPane;
import javax.swing.table.DefaultTableModel;
import javax.swing.table.TableRowSorter;
import tools.IOTools;
import beans.Percepcion;
import java.awt.event.WindowAdapter;
import java.awt.event.WindowEvent;

/**
 *
 * @author omar_
 */
public class Percepciones extends javax.swing.JFrame {
    IOTools txtFormat = new IOTools();
    TableRowSorter trs;
    PlaceHolder holder;
    ConexionSQL con;
    Menu menu;
    DAO dao;
    
    public Percepciones(Menu menu) throws SQLException, IOException {
        initComponents();
        this.setLocationRelativeTo(null);
        
        con = ConexionSQL.getInstance();
        dao = new DAO(con.getConnection());
        
        holder =new PlaceHolder(txtBuscar, " Filtrar por nombre..."); 
        txtFormat.limitar_texto(txtBuscar, 30);
        btnActualizar.requestFocus();
        
        Color color = new Color(245, 245, 245);
        jScrollPane3.getViewport().setBackground(color);
        
        dao.percepciones.getAll(tblPercepciones);
        this.menu = menu;
        
        this.addWindowListener(new WindowAdapter() {
            public void windowClosing(WindowEvent e) {
                menu.setVisible(true);
            }
        });
    }

    /**
     * This method is called from within the constructor to initialize the form.
     * WARNING: Do NOT modify this code. The content of this method is always
     * regenerated by the Form Editor.
     */
    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        btnInsertar = new javax.swing.JButton();
        btnBorrar = new javax.swing.JButton();
        jButton1 = new javax.swing.JButton();
        jButton2 = new javax.swing.JButton();
        btnActualizar = new javax.swing.JButton();
        jScrollPane3 = new javax.swing.JScrollPane();
        tblPercepciones = new javax.swing.JTable();
        txtBuscar = new javax.swing.JTextField();
        jLabel1 = new javax.swing.JLabel();
        jLabel2 = new javax.swing.JLabel();
        jLabel3 = new javax.swing.JLabel();

        setDefaultCloseOperation(javax.swing.WindowConstants.DISPOSE_ON_CLOSE);
        setTitle("Gestión de Percepciones");
        getContentPane().setLayout(new org.netbeans.lib.awtextra.AbsoluteLayout());

        btnInsertar.setBackground(new java.awt.Color(245, 245, 245));
        btnInsertar.setFont(new java.awt.Font("Perpetua", 0, 18)); // NOI18N
        btnInsertar.setIcon(new javax.swing.ImageIcon(getClass().getResource("/Iconos/new2.png"))); // NOI18N
        btnInsertar.setToolTipText("Nueva Percepción");
        btnInsertar.setHorizontalTextPosition(javax.swing.SwingConstants.CENTER);
        btnInsertar.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnInsertarActionPerformed(evt);
            }
        });
        getContentPane().add(btnInsertar, new org.netbeans.lib.awtextra.AbsoluteConstraints(500, 70, 40, 40));

        btnBorrar.setBackground(new java.awt.Color(245, 245, 245));
        btnBorrar.setFont(new java.awt.Font("Perpetua", 0, 18)); // NOI18N
        btnBorrar.setIcon(new javax.swing.ImageIcon(getClass().getResource("/Iconos/delete2.png"))); // NOI18N
        btnBorrar.setToolTipText("Eliminar Percepción");
        btnBorrar.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnBorrarActionPerformed(evt);
            }
        });
        getContentPane().add(btnBorrar, new org.netbeans.lib.awtextra.AbsoluteConstraints(540, 70, 40, 40));

        jButton1.setBackground(new java.awt.Color(243, 243, 243));
        jButton1.setIcon(new javax.swing.ImageIcon(getClass().getResource("/iconos/return2.png"))); // NOI18N
        jButton1.setToolTipText("Regresar al menú de inicio");
        jButton1.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jButton1ActionPerformed(evt);
            }
        });
        getContentPane().add(jButton1, new org.netbeans.lib.awtextra.AbsoluteConstraints(550, 380, 70, 40));

        jButton2.setBackground(new java.awt.Color(243, 243, 243));
        jButton2.setFont(new java.awt.Font("Candara", 1, 12)); // NOI18N
        jButton2.setIcon(new javax.swing.ImageIcon(getClass().getResource("/iconos/srch.png"))); // NOI18N
        jButton2.setToolTipText("Consulta individual");
        jButton2.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jButton2ActionPerformed(evt);
            }
        });
        getContentPane().add(jButton2, new org.netbeans.lib.awtextra.AbsoluteConstraints(500, 380, 50, 40));

        btnActualizar.setBackground(new java.awt.Color(245, 245, 245));
        btnActualizar.setFont(new java.awt.Font("Perpetua", 0, 18)); // NOI18N
        btnActualizar.setIcon(new javax.swing.ImageIcon(getClass().getResource("/Iconos/edit.png"))); // NOI18N
        btnActualizar.setToolTipText("Actualizar Percepción");
        btnActualizar.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnActualizarActionPerformed(evt);
            }
        });
        getContentPane().add(btnActualizar, new org.netbeans.lib.awtextra.AbsoluteConstraints(580, 70, 40, 40));

        tblPercepciones.setModel(new javax.swing.table.DefaultTableModel(
            new Object [][] {

            },
            new String [] {
                "Clave", "Nombre", "Descripción", "Dias Pagar", "Estatus", "stat"
            }
        ) {
            boolean[] canEdit = new boolean [] {
                false, false, false, false, false, false
            };

            public boolean isCellEditable(int rowIndex, int columnIndex) {
                return canEdit [columnIndex];
            }
        });
        tblPercepciones.setGridColor(new java.awt.Color(153, 204, 255));
        tblPercepciones.getTableHeader().setReorderingAllowed(false);
        jScrollPane3.setViewportView(tblPercepciones);
        if (tblPercepciones.getColumnModel().getColumnCount() > 0) {
            tblPercepciones.getColumnModel().getColumn(0).setPreferredWidth(60);
            tblPercepciones.getColumnModel().getColumn(1).setPreferredWidth(150);
            tblPercepciones.getColumnModel().getColumn(2).setPreferredWidth(240);
            tblPercepciones.getColumnModel().getColumn(3).setPreferredWidth(80);
            tblPercepciones.getColumnModel().getColumn(4).setPreferredWidth(70);
            tblPercepciones.getColumnModel().getColumn(5).setMinWidth(0);
            tblPercepciones.getColumnModel().getColumn(5).setPreferredWidth(0);
            tblPercepciones.getColumnModel().getColumn(5).setMaxWidth(0);
        }

        getContentPane().add(jScrollPane3, new org.netbeans.lib.awtextra.AbsoluteConstraints(20, 120, 600, 260));

        txtBuscar.addKeyListener(new java.awt.event.KeyAdapter() {
            public void keyTyped(java.awt.event.KeyEvent evt) {
                txtBuscarKeyTyped(evt);
            }
        });
        getContentPane().add(txtBuscar, new org.netbeans.lib.awtextra.AbsoluteConstraints(60, 70, 380, 40));

        jLabel1.setFont(new java.awt.Font("Candara", 1, 36)); // NOI18N
        jLabel1.setText("Percepciones");
        getContentPane().add(jLabel1, new org.netbeans.lib.awtextra.AbsoluteConstraints(30, 10, 220, 50));

        jLabel2.setHorizontalAlignment(javax.swing.SwingConstants.CENTER);
        jLabel2.setIcon(new javax.swing.ImageIcon(getClass().getResource("/Iconos/buscar2.png"))); // NOI18N
        getContentPane().add(jLabel2, new org.netbeans.lib.awtextra.AbsoluteConstraints(10, 70, 50, 40));

        jLabel3.setIcon(new javax.swing.ImageIcon(getClass().getResource("/Iconos/money-gold-coins-finance.jpg"))); // NOI18N
        getContentPane().add(jLabel3, new org.netbeans.lib.awtextra.AbsoluteConstraints(0, 0, 640, 430));

        pack();
    }// </editor-fold>//GEN-END:initComponents

    private void btnInsertarActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnInsertarActionPerformed
        Insertar_Percepcion ins;
        try {
            ins = new Insertar_Percepcion(tblPercepciones);
            ins.setVisible(true);
        } catch (SQLException ex) {
            Logger.getLogger(Percepciones.class.getName()).log(Level.SEVERE, null, ex);
        } catch (IOException ex) {
            Logger.getLogger(Percepciones.class.getName()).log(Level.SEVERE, null, ex);
        }
    }//GEN-LAST:event_btnInsertarActionPerformed

    private void btnBorrarActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnBorrarActionPerformed
        DefaultTableModel dm = (DefaultTableModel) tblPercepciones.getModel();

        if(dm.getRowCount() > 0)
        {
            int r = tblPercepciones.getSelectedRow();
            if(r >= 0)
            {
                int ans = JOptionPane.showConfirmDialog(null, 
                "Se eliminará la percepción\n¿Deseas continuar?", "Advertencia", 2);

                if(ans == JOptionPane.YES_OPTION) {
                    int idPercepcion = Integer.valueOf(String.valueOf(dm.getValueAt(r, 0)));
                    if(dao.percepciones.delete(idPercepcion)) {
                        txtFormat.borrar_tabla(tblPercepciones);
                        dao.percepciones.getAll(tblPercepciones);
                    } else
                        JOptionPane.showMessageDialog(null, "Ocurrió un error al eliminar la percepcións", "Error", 0);
                }
            } else
                JOptionPane.showMessageDialog(null, "Seleccione el registro a eliminar", "No hay registros seleccionados", 2);
        } else
            JOptionPane.showMessageDialog(null, "No hay registros para eliminar", "Error", 0);
    }//GEN-LAST:event_btnBorrarActionPerformed

    private void txtBuscarKeyTyped(java.awt.event.KeyEvent evt) {//GEN-FIRST:event_txtBuscarKeyTyped
        txtFormat.filter(tblPercepciones, txtBuscar, 1);
    }//GEN-LAST:event_txtBuscarKeyTyped

    private void btnActualizarActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnActualizarActionPerformed
        DefaultTableModel dm = (DefaultTableModel) tblPercepciones.getModel();

        if(dm.getRowCount() > 0)
        {
            int r = tblPercepciones.getSelectedRow();
            if(r >= 0)
            {
                int idPercepcion = Integer.valueOf(String.valueOf(dm.getValueAt(r, 0)));
                String nombre = String.valueOf(dm.getValueAt(r, 1));
                String descripcion = String.valueOf(dm.getValueAt(r, 2));
                int diasPagar = Integer.valueOf(String.valueOf(dm.getValueAt(r, 3)));
                
                Percepcion d = new Percepcion(idPercepcion, nombre, descripcion, diasPagar, "A");
                
                 Actualizar_Percepcion act;
                try {
                    act = new Actualizar_Percepcion(tblPercepciones, d);
                    act.setVisible(true);
                } catch (SQLException ex) {
                    Logger.getLogger(Deducciones.class.getName()).log(Level.SEVERE, null, ex);
                } catch (IOException ex) {
                    Logger.getLogger(Deducciones.class.getName()).log(Level.SEVERE, null, ex);
                }
            } else
                JOptionPane.showMessageDialog(null, "Seleccione el registro a actualizar", "No hay registros seleccionados", 2);
        } else
            JOptionPane.showMessageDialog(null, "No hay registros para actualizar", "Advertencia", 2);
    }//GEN-LAST:event_btnActualizarActionPerformed

    private void jButton1ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jButton1ActionPerformed
        this.dispose();
        menu.setVisible(true);
    }//GEN-LAST:event_jButton1ActionPerformed

    private void jButton2ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jButton2ActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_jButton2ActionPerformed

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
            java.util.logging.Logger.getLogger(Percepciones.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (InstantiationException ex) {
            java.util.logging.Logger.getLogger(Percepciones.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (IllegalAccessException ex) {
            java.util.logging.Logger.getLogger(Percepciones.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (javax.swing.UnsupportedLookAndFeelException ex) {
            java.util.logging.Logger.getLogger(Percepciones.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        }
        //</editor-fold>
        //</editor-fold>

        /* Create and display the form */
        java.awt.EventQueue.invokeLater(new Runnable() {
            public void run() {
                try {
                    new Percepciones(null).setVisible(true);
                } catch (SQLException ex) {
                    Logger.getLogger(Percepciones.class.getName()).log(Level.SEVERE, null, ex);
                } catch (IOException ex) {
                    Logger.getLogger(Percepciones.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        });
    }

    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JButton btnActualizar;
    private javax.swing.JButton btnBorrar;
    private javax.swing.JButton btnInsertar;
    private javax.swing.JButton jButton1;
    private javax.swing.JButton jButton2;
    private javax.swing.JLabel jLabel1;
    private javax.swing.JLabel jLabel2;
    private javax.swing.JLabel jLabel3;
    private javax.swing.JScrollPane jScrollPane3;
    private javax.swing.JTable tblPercepciones;
    private javax.swing.JTextField txtBuscar;
    // End of variables declaration//GEN-END:variables
}
