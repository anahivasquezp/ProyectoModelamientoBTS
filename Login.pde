import java.io.*; 
  public class Login {
  private String usuario;
  private String password;
  private int ultimoNivelAprobadoLogin;

  public Login(String usuario, String password) {
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
  
  public void setUltimoNivelAprobadoLogin(int nivel) {
    this.ultimoNivelAprobadoLogin =nivel;
  }
  public int getUltimoNivelAprobadoLogin() {
    return ultimoNivelAprobadoLogin;
  }

  public boolean verificarUsuario() {
    String cadena;
    boolean valor = false;
    try {
       FileReader f = new FileReader(dataPath("Usuarios.txt"));
      BufferedReader b = new BufferedReader(f);

      while ((cadena = b.readLine())!=null) {
        String jugadortxt [] = new String[3];
        jugadortxt = cadena.split(",");
        if (usuario.equalsIgnoreCase(jugadortxt[0]) && password.equals(jugadortxt[1])) {
          this.ultimoNivelAprobadoLogin = Integer.parseInt(jugadortxt[2]);
          valor = true;
          
          break;
        }
      }

      b.close();
    }
    catch  (Exception e) {
      e.printStackTrace();
    }

    return valor;
  }
  
}
