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
        File archivo = null;// Manipular archivo
        FileWriter fw = null;//Para escribir en el txt
        PrintWriter pw = null;
        BufferedReader br = null;// lectura 
        archivo = new File("usuarios.txt");
        try {
            if (!archivo.exists()) {
                archivo.createNewFile();
                fw = new FileWriter(archivo, true);
                pw = new PrintWriter(fw);
                nivelesAprobados.add(nivel);
                cadena = usuario + ",";
                cadena += password + ",";
                Iterator<Integer> nivelesIterator = nivelesAprobados.iterator();
                while (nivelesIterator.hasNext()) {
                    cadena += String.valueOf(nivelesIterator.next()) + ",";
                }
                //cadena += "\n";
                String cadena2 = cadena;
                pw.println(cadena2);
            } else {
                fw = new FileWriter(archivo, true);
                pw = new PrintWriter(fw);
                nivelesAprobados.add(nivel);
                cadena = usuario + ", ";
                cadena += password + ", ";
                Iterator<Integer> nivelesIterator = nivelesAprobados.iterator();
                while (nivelesIterator.hasNext()) {
                    cadena += String.valueOf(nivelesIterator.next()) + ",";
                }
                //cadena += "\n";
                pw.println(cadena);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (fw != null) {
                    fw.close();
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

    }
}
