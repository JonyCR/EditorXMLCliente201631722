/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package backend.analizadores;

/**
 *
 * @author jonyasus
 */
public class Obligatorio {
    
    String tipo;
    Boolean ingresado;

    public Obligatorio(String tipo, Boolean ingresado) {
        this.tipo = tipo;
        this.ingresado = ingresado;
    }

    public String getTipo() {
        return tipo;
    }

    public void setTipo(String tipo) {
        this.tipo = tipo;
    }

    public Boolean getIngresado() {
        return ingresado;
    }

    public void setIngresado(Boolean ingresado) {
        this.ingresado = ingresado;
    }
    
////    
    
}
