package backend.objetos;

import backend.*;
import backend.analizadores.*;
import gui.ventanas.*;
import java.io.StringReader;
import java.util.ArrayList;
import javax.swing.JTextArea;

/**
 *
 * @author jonyasus
 */
public class ManejadorCliente {

    ArrayList<String> mensajesServidor = new ArrayList<>();
    ArrayList<Obligatorio> obligatoriosNuevoSitioWeb = new ArrayList<>();
    ArrayList<Obligatorio> obligatoriosNuevaPaginaWeb = new ArrayList<>();
    ArrayList<ErrorJ> erroresEncontrados = new ArrayList<>();
    JTextArea textAreaAnalizador;
    JTextArea textAreaErrores;
    JTextArea textAreaServidor;
    Principal ventanaPrincipal;

    public ManejadorCliente(JTextArea textAreaA, JTextArea textAreaE, JTextArea textAreaS, Principal ventanaPrincipal) {
        this.textAreaAnalizador = textAreaA;
        this.textAreaErrores = textAreaE;
        this.textAreaServidor = textAreaS;
        this.ventanaPrincipal = ventanaPrincipal;
    }

    public void analizarTexto(String texto) {
        erroresEncontrados.clear();
        Analizador_Lexico_XML lexico = new Analizador_Lexico_XML(new StringReader(texto));
        Analisis_Sintactico sintactico = new Analisis_Sintactico(lexico, this);
        try {
            sintactico.parse();
        } catch (Exception e) {
        }
        imprimirMensajes(mensajesServidor);
        mensajesServidor.clear();
    }

    public void capturarErrores(ErrorJ error) {
        erroresEncontrados.add(error);
        for (int i = 0; i < erroresEncontrados.size(); i++) {
            String errorStr = "";
        errorStr += "Error encontrado en: \nFila: " + erroresEncontrados.get(i).getLinea() + "\nColumna: " + erroresEncontrados.get(i).getColumna() + "\nDescripción: " + erroresEncontrados.get(i).getDescripcion() + "\nVerifica que ----> " + erroresEncontrados.get(i).getLexema() + " <---- sea correcto. \n\n";
        textAreaErrores.append(errorStr);
        }
//        String errorStr = "";
//        errorStr += "Error encontrado en: \nFila: " + error.getLinea() + "\nColumna: " + error.getColumna() + "\nDescripción: " + error.getDescripcion() + "\nVerifica que ----> " + error.getLexema() + " <---- sea correcto.";
//        textAreaErrores.setText(errorStr);
    }


    public void imprimirMensajes(ArrayList<String> mensajesGuardados) {
        for (int i = 0; i < mensajesGuardados.size(); i++) {
            textAreaServidor.append(mensajesGuardados.get(i) + "\n");
        }
    }

    public void enviarObligatorioNSW(String infoID) {
        if (obligatoriosNuevoSitioWeb.get(0).getTipo().equals(infoID)) {
            obligatoriosNuevoSitioWeb.get(0).setIngresado(true);
        }
    }

    public void enviarObligatorioNPW(String infoTipo) {
        for (int i = 0; i < obligatoriosNuevaPaginaWeb.size(); i++) {
            if (obligatoriosNuevaPaginaWeb.get(i).getTipo().equals(infoTipo)) {
                obligatoriosNuevaPaginaWeb.get(i).setIngresado(true);
            }
        }
    }

    public void inicializarObligatoriosNPW() {
        obligatoriosNuevaPaginaWeb.clear();
        Obligatorio id = new Obligatorio("ID", false);
        obligatoriosNuevaPaginaWeb.add(id);
        Obligatorio sitio = new Obligatorio("SITIO", false);
        obligatoriosNuevaPaginaWeb.add(sitio);
        Obligatorio padre = new Obligatorio("PADRE", false);
        obligatoriosNuevaPaginaWeb.add(padre);
        System.out.println("Se inicializo la lista de los obligatorios NSW =========================================");
    }

    public void inicializarObligatoriosNSW() {
        obligatoriosNuevoSitioWeb.clear();
        Obligatorio id = new Obligatorio("ID", false);
        obligatoriosNuevoSitioWeb.add(id);
        System.out.println("Se inicializo la lista de los obligatorios NSW =========================================");
    }

    public void verificarObligatorioNSW() {
        if (obligatoriosNuevoSitioWeb.isEmpty()) {
             System.out.println("no hay ninguna estructura Nuevo Sitio  Web en su XML ------------------------");
        } else {
        if (obligatoriosNuevoSitioWeb.get(0).getIngresado().equals(true)) {
            System.out.println("Si ha llenado los campos obligatorios de Nuevo Sitio Web ------------------- ");
        } else {
            System.out.println("Falta dato obligatorio =========================================");
            ErrorJ nuevoError = new ErrorJ("ID", "Falta ID en Nuevo Sitio Web.", 0, 0);
            capturarErrores(nuevoError);
        }
        }
    }

    public void verificarObligatorioNPW() {
        if (obligatoriosNuevaPaginaWeb.isEmpty()) {
            System.out.println("no hay ninguna estructura Nueva Pagina Web en su XML ------------------------");
        } else {
            if (obligatoriosNuevaPaginaWeb.get(0).getIngresado().equals(true) && obligatoriosNuevaPaginaWeb.get(1).getIngresado().equals(true) && obligatoriosNuevaPaginaWeb.get(2).getIngresado().equals(true)) {
                System.out.println("Si ha llenado los campos obligatorios de Nueva Pagina Web ------------------- ");
            } else {
                if(obligatoriosNuevaPaginaWeb.get(0).getIngresado().equals(false)){
                System.out.println("Falta ID En Nueva Pagina Web =========================================");
                ErrorJ nuevoError = new ErrorJ("ID", "Falta ID en Nueva Pagina Web.", 0, 0);
                capturarErrores(nuevoError);
                }
                if(obligatoriosNuevaPaginaWeb.get(1).getIngresado().equals(false)){
                System.out.println("Falta SITIO En Nueva Pagina Web =========================================");
                ErrorJ nuevoError = new ErrorJ("SITIO", "Falta SITIO en Nueva Pagina Web.", 0, 0);
                capturarErrores(nuevoError);
                }
                if(obligatoriosNuevaPaginaWeb.get(2).getIngresado().equals(false)){
                System.out.println("Falta PADRE En Nueva Pagina Web =========================================");
                ErrorJ nuevoError = new ErrorJ("PADRE", "Falta PADRE en Nueva Pagina Web.", 0, 0);
                capturarErrores(nuevoError);
                }
                
            }
        }
    }

}
