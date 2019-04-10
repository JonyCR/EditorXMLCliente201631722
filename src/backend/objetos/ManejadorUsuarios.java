/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package backend.objetos;

import backend.analizadores.Analisis_SintacticoUsuarios;
import backend.analizadores.Analizador_Lexico_Usuarios;
import backend.analizadores.ErrorJ;
import gui.ventanas.Login;
import java.io.StringReader;
import java.util.ArrayList;

/**
 *
 * @author jonyasus
 */
public class ManejadorUsuarios {
    
    ArrayList<Usuario> listaDeUsuarios = new ArrayList<>();
    Login ventanaLogin;
    
    public ManejadorUsuarios(Login vetanaLogin) {
        this.ventanaLogin = ventanaLogin;
    } 
    
    public void analizarTexto(String texto) {
        listaDeUsuarios.clear();
        Analizador_Lexico_Usuarios lexico = new Analizador_Lexico_Usuarios(new StringReader(texto));
        Analisis_SintacticoUsuarios sintactico = new Analisis_SintacticoUsuarios(lexico, this);
        try {
            sintactico.parse();
        } catch (Exception e) {
        }
    }
    
    public void capturarErrores(ErrorJ error){
    String errorStr = "";
    errorStr += "Error encontrado en: \nFila: "+error.getLinea()+"\nColumna: "+error.getColumna()+"\nDescripción: "+error.getDescripcion()+"\nVerifica que ----> "+error.getLexema()+" <---- sea correcto.";
    }
    
    public void capturarUsuario(String user, String pass){
        Usuario nuevoUsuario = new Usuario(user, pass);
        listaDeUsuarios.add(nuevoUsuario);
    }
    
    public Boolean verificarUsuario(String usuarioIngresado, String contraseñaIngresada){
        for (int i = 0; i < listaDeUsuarios.size(); i++) {
            if (usuarioIngresado.equals(listaDeUsuarios.get(i).getUsuario()) && contraseñaIngresada.equals(listaDeUsuarios.get(i).getContraseña())) {
                return true;
            } else {
            }
        }
        return false;
    }
    
    
}
