/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package vistas;
import com.sun.xml.internal.messaging.saaj.util.ByteOutputStream;
import java.awt.Graphics;
import java.awt.Image;
import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.imageio.ImageIO;
import javax.swing.ImageIcon;
import javax.swing.JLabel;
import javax.swing.JOptionPane;
import org.opencv.core.Core;
import org.opencv.core.Mat;
import org.opencv.core.MatOfByte;
import org.opencv.imgcodecs.Imgcodecs;
import org.opencv.videoio.VideoCapture;

/**
 *
 * @author Miguel
 */
public class SnapshotAct extends javax.swing.JFrame {
    
    boolean played = false;
    boolean foto = false;
    
    // definitions
    private DaemonThread myThread = null;
    int count = 0;
    VideoCapture webSource = null;

    Mat frame = new Mat();
    MatOfByte mem = new MatOfByte();
    
    class DaemonThread implements Runnable
    {
        protected volatile boolean runnable = false;

        @Override
        public  void run()
        {
            synchronized(this)
            {
                while(runnable)
                {
                    if(webSource.grab())
                    {
                            try
                            {
                                webSource.retrieve(frame);
                                Imgcodecs.imencode(".bmp", frame, mem);
                                Image im = ImageIO.read(new ByteArrayInputStream(mem.toArray()));

                                BufferedImage buff = (BufferedImage) im;
                                Graphics g = panFoto.getGraphics();

                                if (g.drawImage(buff, 0, 0, getWidth(), getHeight(), 0, 0, buff.getWidth(), buff.getHeight(), null))
                                    if(!runnable)
                                    {
                                        this.wait();
                                    }
                             }
                             catch(Exception ex)
                             {
                                myThread.runnable = false;
                                webSource.release();
                             }
                    }
                }
            }
         }
    }
    
    JLabel lbl;

    /**
     * Creates new form Snapshot
     */
    public SnapshotAct(JLabel lbl) {
        initComponents();
        this.setLocationRelativeTo(null);
        this.lbl = lbl;
    }

    /**
     * This method is called from within the constructor to initialize the form. WARNING: Do NOT modify this code. The content of this method is always regenerated by the Form Editor.
     */
    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        fcGuardar = new javax.swing.JFileChooser();
        panFondo = new javax.swing.JPanel();
        btnInicio = new javax.swing.JButton();
        btnPausa = new javax.swing.JButton();
        btnGuardar = new javax.swing.JButton();
        btnCancelar = new javax.swing.JButton();
        panFoto = new javax.swing.JPanel();

        setDefaultCloseOperation(javax.swing.WindowConstants.DISPOSE_ON_CLOSE);
        setTitle("Tomar fotografía");

        panFondo.setBackground(new java.awt.Color(247, 247, 247));

        btnInicio.setIcon(new javax.swing.ImageIcon(getClass().getResource("/iconos/play.png"))); // NOI18N
        btnInicio.setToolTipText("Iniciar captura");
        btnInicio.setHorizontalTextPosition(javax.swing.SwingConstants.CENTER);
        btnInicio.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnInicioActionPerformed(evt);
            }
        });

        btnPausa.setIcon(new javax.swing.ImageIcon(getClass().getResource("/iconos/pause.png"))); // NOI18N
        btnPausa.setToolTipText("Vista previa");
        btnPausa.setHorizontalTextPosition(javax.swing.SwingConstants.CENTER);
        btnPausa.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnPausaActionPerformed(evt);
            }
        });

        btnGuardar.setIcon(new javax.swing.ImageIcon(getClass().getResource("/iconos/save_1.png"))); // NOI18N
        btnGuardar.setToolTipText("Guardar foto");
        btnGuardar.setHorizontalTextPosition(javax.swing.SwingConstants.CENTER);
        btnGuardar.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnGuardarActionPerformed(evt);
            }
        });

        btnCancelar.setIcon(new javax.swing.ImageIcon(getClass().getResource("/iconos/return2.png"))); // NOI18N
        btnCancelar.setToolTipText("Regresar");
        btnCancelar.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnCancelarActionPerformed(evt);
            }
        });

        panFoto.setBackground(new java.awt.Color(242, 242, 242));
        panFoto.setBorder(javax.swing.BorderFactory.createEtchedBorder());

        javax.swing.GroupLayout panFotoLayout = new javax.swing.GroupLayout(panFoto);
        panFoto.setLayout(panFotoLayout);
        panFotoLayout.setHorizontalGroup(
            panFotoLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGap(0, 0, Short.MAX_VALUE)
        );
        panFotoLayout.setVerticalGroup(
            panFotoLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGap(0, 390, Short.MAX_VALUE)
        );

        javax.swing.GroupLayout panFondoLayout = new javax.swing.GroupLayout(panFondo);
        panFondo.setLayout(panFondoLayout);
        panFondoLayout.setHorizontalGroup(
            panFondoLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(panFondoLayout.createSequentialGroup()
                .addContainerGap()
                .addGroup(panFondoLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(panFoto, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                    .addGroup(panFondoLayout.createSequentialGroup()
                        .addComponent(btnInicio, javax.swing.GroupLayout.PREFERRED_SIZE, 40, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                        .addComponent(btnPausa, javax.swing.GroupLayout.PREFERRED_SIZE, 40, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                        .addComponent(btnGuardar, javax.swing.GroupLayout.PREFERRED_SIZE, 40, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, 467, Short.MAX_VALUE)
                        .addComponent(btnCancelar)))
                .addContainerGap())
        );
        panFondoLayout.setVerticalGroup(
            panFondoLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, panFondoLayout.createSequentialGroup()
                .addContainerGap()
                .addComponent(panFoto, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addGroup(panFondoLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(btnCancelar, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                    .addGroup(panFondoLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                        .addComponent(btnInicio)
                        .addComponent(btnPausa)
                        .addComponent(btnGuardar)))
                .addContainerGap())
        );

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addComponent(panFondo, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addComponent(panFondo, javax.swing.GroupLayout.Alignment.TRAILING, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
        );

        pack();
    }// </editor-fold>//GEN-END:initComponents

    private void btnInicioActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnInicioActionPerformed
        webSource =new VideoCapture(0);
        myThread = new DaemonThread();
        Thread t = new Thread(myThread);
        t.setDaemon(true);
        myThread.runnable = true;
        t.start();
        btnInicio.setEnabled(false);  //start button
        btnPausa.setEnabled(true);
        played = true;
        foto = true;
    }//GEN-LAST:event_btnInicioActionPerformed

    private void btnPausaActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnPausaActionPerformed
        if(played) {
            myThread.runnable = false;
            btnPausa.setEnabled(false);   
            btnInicio.setEnabled(true);
            webSource.release();
            played = false;
        } else
            JOptionPane.showMessageDialog(null, "Inicie la captura", "Advertencia", 2);
    }//GEN-LAST:event_btnPausaActionPerformed

    private void btnGuardarActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnGuardarActionPerformed
        if(foto) {
            Imgcodecs.imencode(".jpg", frame, mem);
            Image im;
            try {
                BufferedImage bif = ImageIO.read(new ByteArrayInputStream(mem.toArray()));
                
                im = ImageIO.read(new ByteArrayInputStream(mem.toArray()));
                im = im.getScaledInstance(lbl.getWidth(), lbl.getHeight(), Image.SCALE_SMOOTH);
                get_logo(lbl, im);
                
                ByteOutputStream bos = new ByteOutputStream();
                ImageIO.write(bif, "jpg", bos);
                Actualizar_Empleado.bytes = bos.getBytes();
                Actualizar_Empleado.cambioFoto = true;
                Actualizar_Empleado.file = false;
                //g.drawImage(im, 0, 0, buff.getWidth(), buff.getHeight(), null);
            } catch (IOException ex) {
                Logger.getLogger(SnapshotAct.class.getName()).log(Level.SEVERE, null, ex);
            }

            this.dispose();
        } else
            JOptionPane.showMessageDialog(null, "Tome una fotografía primero", "Advertencia", 2);
    }//GEN-LAST:event_btnGuardarActionPerformed

    public void get_logo(JLabel lbl, Image img){
        try {
            ImageIcon icon = new ImageIcon(img);
            lbl.setIcon(icon);
        } catch (Exception e) {
            lbl.setIcon(null);
        }
    }
    
    private void btnCancelarActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnCancelarActionPerformed
        try {
            myThread.runnable = false;
            webSource.release();
            this.dispose();
        } catch(Exception e) {
            this.dispose();
        }
    }//GEN-LAST:event_btnCancelarActionPerformed

    /**
     * @param args the command line arguments
     */
    public static void main(String args[]) {
        System.loadLibrary(Core.NATIVE_LIBRARY_NAME);
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
            java.util.logging.Logger.getLogger(SnapshotAct.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (InstantiationException ex) {
            java.util.logging.Logger.getLogger(SnapshotAct.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (IllegalAccessException ex) {
            java.util.logging.Logger.getLogger(SnapshotAct.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (javax.swing.UnsupportedLookAndFeelException ex) {
            java.util.logging.Logger.getLogger(SnapshotAct.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        }
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>

        /* Create and display the form */
        java.awt.EventQueue.invokeLater(new Runnable() {
            public void run() {
                new SnapshotAct(null).setVisible(true);
            }
        });
    }

    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JButton btnCancelar;
    private javax.swing.JButton btnGuardar;
    private javax.swing.JButton btnInicio;
    private javax.swing.JButton btnPausa;
    private javax.swing.JFileChooser fcGuardar;
    private javax.swing.JPanel panFondo;
    private javax.swing.JPanel panFoto;
    // End of variables declaration//GEN-END:variables
}