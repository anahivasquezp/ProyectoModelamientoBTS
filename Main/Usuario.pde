import java.util.ArrayList;
import java.io.*;
import java.util.Iterator;
import java.util.logging.Level;
import java.util.logging.Logger;

public class Usuario {

    String user = "";
    String contrasena  = "", sketchPath  = "";
    ArrayList<Integer> nivelesAprobados;
    PrintWriter archivo;  //Permite la creacion de archivos
    String path= sketchPath;  //Variable para guardar ruta de archivo 
    String fileName  = "";  //Variable para el nombre del archivo
    int id=1;  //id del archivo, se usa para renombrar

    public Usuario(String usuario) {
        nivelesAprobados = new ArrayList<>();//Guardar los niveles aprob
        this.fileName=usuario;  //Asigamos nombre del archivo
        if (exist(this.fileName)) {  //comprobamos si ya existe el nombre del archivo con la funcion exist()
          rename();  //Si es verdadero se llama a la funcion rename()
          archivo= createWriter(this.fileName);  //Se crea el archivo con el nombre nuevo
        }else {
        archivo= createWriter(this.fileName); //Si no existe, se crea sin renombrar
     }
    }
    
   String getUser() {
        return user;
    }

    void setUser(String user) {
        this.user = user;
    }

    String getContrasena() {
        return contrasena;
    }

    void setContrasena(String contrasena) {
        this.contrasena = contrasena;
    }
    
    //Crea una lista de los archivos existentes en el directorio actual
    String[] listFileNames(String dir) {  //recibe como parametro la ruta actual
    File file = new File(dir);  //Crea un objeto de la clase File
    if (file.isDirectory()) {  //Comprobamos que sea un directorio y no un archivo
      String names[] = file.list();  //Cargamos la lista de archivos en el vector names[]
      return names;  //regresamos names[]
    } 
    else {
      return null;  //En caso de que sea un archivo se regresa null
    }
  }

    //Comprueba si el archivo ya existe
    boolean exist(String fileName) {  //recibe como parametro el nombre del archivo
      try{
        String[] filenames = new String[3]; 
        filenames = listFileNames(path);  //llama a la funcion listFileNames para obtener la lista de archivos
        for (int x=0; x<=filenames.length-1;x++) {  //Se comprueba por medio de un for la existencia del archivo, recorre todo el vector *
          if (fileName.equals(filenames[x])) {  //Si el nombre de un archivo existente coincide con el que se propuso
        return true;  //Regresa verdadero
         }
       }
      } catch (Exception e) {
          e.printStackTrace();
      }
        return false;  //Regresa falso
     }
    
    //Renombra el archivo para no sobreescribir
    void rename() {
    String newName=(split(fileName, ".")[0]+"_"+str(id)+"."+split(fileName, ".")[1]); //Al nombre original se le asigna un indicador haciendo uso del id
    if (exist(newName)) {  //Se comprueba si archivo con el nuevo nombre existe
      id++;  //Se incrementa id hasta que se encuentra un archivo inexistente
      rename();  //Es recursiva en caso de que siga exisitiendo el nombre
    }
    else {
      fileName=newName;  //Se regresa el nuevo nombre
      return;
    }
    }

    public void guardarNivel(int nivel, String usuario, String password) {
        String cadena = "";
        nivelesAprobados.add(nivel);
        cadena = usuario + ",";
        cadena += password + ",";
        Iterator<Integer> nivelesIterator = nivelesAprobados.iterator();
        while (nivelesIterator.hasNext()) {
          cadena += String.valueOf(nivelesIterator.next()) + ",";
        }
        archivo.println(cadena);
        close();
    }
    
    //Cierra el archivo, para que sea utilizable
    void close() {
    archivo.flush();  //Vaciamos buffer de escritura
    archivo.close();  //Cerramos el archivo
    }
}
