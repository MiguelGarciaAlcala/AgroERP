/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package conexion_bd;

import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;

/**
 *
 * @author Miguel
 */
public class Credenciales {
    
    private String ruta = "credenciales\\";
    private String usuario;
    private String password;
    
    public Credenciales(String nombreArchivo) throws IOException {
        this.ruta = ruta + nombreArchivo + ".txt";
    }
    
    private void getCredenciales() throws FileNotFoundException, IOException {
        FileReader fileReader = new FileReader(this.ruta);
        
        try (BufferedReader bufferReader = new BufferedReader(fileReader)) {
            this.usuario = bufferReader.readLine();
            this.password = bufferReader.readLine();
        }
    }
    
    public String getUser() throws IOException {
        this.getCredenciales();
        return this.usuario;
    }
    
    public String getPassword() throws IOException {
        this.getCredenciales();
        return this.password;
    }
}
