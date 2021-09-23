import java.io.*; 
public class Registro {
  private String usuario;
  private String password;

  public Registro(String usuario, String password) {
    this.usuario = usuario;
    this.password = password;
  }

  public String getUsuario() {
    return usuario;
  }

  public void setUsuario(String usuario) {
    this.usuario = usuario;
  }

  public String getPassword() {
    return password;
  }

  public void setPassword(String password) {
    this.password = password;
  }

  

  public boolean registrar() {
    String cadena;
    boolean valor= false;
    try {

      FileReader f = new FileReader(dataPath("Usuarios.txt"));
      BufferedReader b = new BufferedReader(f);

      while ((cadena = b.readLine())!=null) {
        String jugadortxt [] = new String[3];
        jugadortxt = cadena.split(",");

        if (usuario.equals(jugadortxt[0]) && password.equals(jugadortxt[1])) {
          valor = true;
          b.close();
          break;
        }
      }
    }
    catch  (Exception e) {
      e.printStackTrace();
    }

    if (!valor) {
      try {
        FileWriter f2 = new FileWriter(dataPath("Usuarios.txt"), true);
        PrintWriter pw = new PrintWriter(f2);
        pw.println(this.usuario+","+this.password+ ",0");
        pw.close();
      }
      catch (Exception e) {
        e.printStackTrace();
      }
    }
    return valor;
  }
  public void registrarNivel(int nivelUltimo){
    String cadena;
    String nivel  = String.valueOf(nivelUltimo);
    try {

      FileReader f = new FileReader(dataPath("Usuarios.txt"));
      BufferedReader b = new BufferedReader(f);
      StringBuffer usuarios = new StringBuffer();
      while ((cadena = b.readLine())!=null) {
        String jugadortxt [] = new String[3];
        jugadortxt = cadena.split(",");
        
        if (usuario.equals(jugadortxt[0]) && password.equals(jugadortxt[1])) {
          usuarios.append(jugadortxt[0]+","+jugadortxt[1]+","+nivel);
          usuarios.append("\n");
             
          
        }else{
        usuarios.append(cadena);
        usuarios.append("\n");
        }
      }
      b.close();
      FileWriter f2 = new FileWriter(dataPath("Usuarios.txt"));
      PrintWriter pw = new PrintWriter(f2);
      pw.print(usuarios);
      pw.close();
    }
    catch  (Exception e) {
      e.printStackTrace();
    }

    
  }

}
