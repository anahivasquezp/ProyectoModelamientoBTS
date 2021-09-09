package Source;

import java.util.ArrayList;
import java.io.*;
import java.util.Iterator;
import java.util.logging.Level;
import java.util.logging.Logger;

public class Usuario {

    String user;
    String contrasena;
    ArrayList<Integer> nivelesAprobados;

    public Usuario() {
        nivelesAprobados = new ArrayList<>();

    }

    public void guardarNivel(int nivel, String usuario, String password) {
        String cadena = "";
        File archivo;// Manipular archivo
        FileWriter fw;//Para escribir en el txt
        PrintWriter pw;
        archivo = new File("usuarios.txt");
        if (!archivo.exists()) {
            try {
                archivo.createNewFile();
                usuario = "USERTEST";// usuario = user;
                cadena += usuario + ", ";
                password = "123"; // password = contrasena;
                cadena += password + ", ";
                nivelesAprobados.add(nivel);
                fw = new FileWriter(archivo, true);
                pw = new PrintWriter(fw);
                Iterator<Integer> nivelesIterator = nivelesAprobados.iterator();
                while (nivelesIterator.hasNext()) {
                    cadena += String.valueOf(nivelesIterator.next()) + ", ";
                }
                pw.println(cadena + "\n");
                pw.close();
                fw.close();
            } catch (IOException ex) {
                Logger.getLogger(Usuario.class.getName()).log(Level.SEVERE, null, ex);
            }
        } else {
            try {
                usuario = "USERTEST";// usuario = user;
                cadena += usuario + ", ";
                password = "123"; // password = contrasena;
                cadena += password + ", ";
                nivelesAprobados.add(nivel);
                fw = new FileWriter(archivo, true);
                pw = new PrintWriter(fw);
                Iterator<Integer> nivelesIterator = nivelesAprobados.iterator();
                while (nivelesIterator.hasNext()) {
                    cadena += String.valueOf(nivelesIterator.next()) + ", ";
                }
                pw.println(cadena + "\n");
                pw.close();
                fw.close();
            } catch (IOException ex) {
                Logger.getLogger(Usuario.class.getName()).log(Level.SEVERE, null, ex);
            }
        }

    }

}
