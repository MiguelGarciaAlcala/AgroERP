/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tools;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 *
 * @author charg
 */
public class InputTools {

    boolean Cumple;
    String patron = ("([a-zA-Z]+)|([0-9]+)|([<|>|_|-|.|,|:|;|{|}|+| ]+)");

    Pattern p = Pattern.compile(patron);

    public InputTools() {

    }

    /**
     * 
     * @param n = tipo de restricción (1 -> numeros, 2 -> cadneas)
     * @param cadena = datos que recibe desde un JtextField
     * @return 
     */
    public boolean SiCumpleTipoDato(int n, String cadena) {
        Cumple = true;
        Matcher m = p.matcher(cadena);
        switch (n) {
            case 1:
                while (m.find()) {
                    if (m.group(1) == null & m.group(3) == null) {
                        Cumple = false;
                        break;
                    }
                }
                break;
            case 2:
                while (m.find()) {
                    if (m.group(2) == null) {
                        Cumple = false;
                        break;
                    }
                }
                break;
        }
        return Cumple;
    }

    /**
     * 
     * @param tam = longitud de la cadena final
     * @param cadena = datos que rescibe desde un JtextField
     * @return 
     */
    public boolean SiCumpleTamanioCadena(int tam, String cadena) {
        return (cadena.length() <= tam);
    }

    public void setCumple(boolean Cumple) {
        this.Cumple = Cumple;
    }

}
