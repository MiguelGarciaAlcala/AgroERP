package tools;

import java.awt.event.KeyAdapter;
import java.awt.event.KeyEvent;
import java.awt.event.KeyListener;
import javax.swing.JTable;
import javax.swing.JTextArea;
import javax.swing.JTextField;
import javax.swing.RowFilter;
import javax.swing.table.DefaultTableModel;
import javax.swing.table.TableRowSorter;

/**
 *
 * @author Miguel-sama
 */
public class IOTools {
    
    TableRowSorter trs;
    
     /**
     * Limita el número de caracteres que se pueden ingresar en un JTextField.
     * @param txt Objeto JTextField.
     * @param lim Límite de caracteres.
     */
    public void limitar_texto(JTextField txt, int lim){
        txt.addKeyListener(new KeyListener() {
            @Override
            public void keyTyped(KeyEvent e) {
                if(txt.getText().length() >= lim) e.consume();
            }

            @Override
            public void keyPressed(KeyEvent e) {}

            @Override
            public void keyReleased(KeyEvent e) {}
        });
    }
    
    public void limitar_texto(JTextArea txt, int lim){
        txt.addKeyListener(new KeyListener() {
            @Override
            public void keyTyped(KeyEvent e) {
                if(txt.getText().length() >= lim) e.consume();
            }

            @Override
            public void keyPressed(KeyEvent e) {}

            @Override
            public void keyReleased(KeyEvent e) {}
        });
    }
    
     /**
     * Verifica que los datos ingresados en un JTextField son de tipo numérico.
     * @param txt Objeto JTextField a validar.
     */
    public void formato_numero(JTextField txt){
        txt.addKeyListener(new KeyListener() {
            @Override
            public void keyTyped(KeyEvent e) {
                if(!es_numerico(String.valueOf(e.getKeyChar()))) e.consume();
            }

            @Override
            public void keyPressed(KeyEvent e) {}

            @Override
            public void keyReleased(KeyEvent e) {}
        });
    }
    
     /**
     * Verifica si un String es un entero mayor o igual que cero.
     * @param s Objeto String a validar.
     * @return Retorna verdadero si el String s es un numéro n >= 0.
     */
    public boolean es_numerico(String s){
        try{
            int n = Integer.valueOf(s);
            return n >= 0;
        } catch(NumberFormatException e){ }
        
        return false;
    }
    
    /**
     * Borra todos los renglones en una tabla.
     * @param tbl Objeto JTable a limpiar.
     */
    public void borrar_tabla(JTable tbl){
        DefaultTableModel tmp = (DefaultTableModel) tbl.getModel();
        int r = tmp.getRowCount();
        
        for (int i=(r-1); i>=0; i--)
            tmp.removeRow(i);
    }
    
    public void filter(JTable tbl, JTextField txt, int index) {
        DefaultTableModel dtm = (DefaultTableModel) tbl.getModel();
        
        txt.addKeyListener(new KeyAdapter() {
            @Override
            public void keyReleased(KeyEvent ke) {
                trs.setRowFilter(RowFilter.regexFilter("(?i)"+txt.getText(), index));
            }
        });
        
        trs = new TableRowSorter(dtm);
        tbl.setRowSorter(trs);
    }
}
