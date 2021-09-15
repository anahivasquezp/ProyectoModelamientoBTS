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

      FileReader f = new FileReader("C:/Usuarios.txt");
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
        FileWriter f2 = new FileWriter("C:/Usuarios.txt", true);
        PrintWriter pw = new PrintWriter(f2);
        pw.println(this.usuario+","+this.password+ ",1");
        pw.close();
      }
      catch (Exception e) {
        e.printStackTrace();
      }
    }
    return valor;
  }
}
