/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tools;

/**
 *
 * @author charg
 */
public class PruebaInput {

    public static void main(String[] args) {
        String prueba = "h";
        int n = 1;
        InputTools tools = new InputTools();
        if (tools.SiCumpleTipoDato(n, prueba)) {
            System.out.println("si");
        } else {
            System.out.println("no");
        }
    }
}
