public class Usuario {
  private String nombre;
  private String password;
  private Login login;
  private Registro registro;
  private int ultimoNivelAprobado;

  public Usuario(String user, String password) {
    this.nombre = user;
    this.password = password;
    this.ultimoNivelAprobado = 0;
  }

  public String getNombre() {

    return nombre;
  }

  public void setNombre(String nombre) {
    this.nombre = nombre;
  }

  public String getPassword() {
    return password;
  }

  public void setPassword(String password) {
    this.password = password;
  }

  
  public int getUltimoNivelAprobado() {
    return ultimoNivelAprobado;
  }
  
  public void  setUltimoNivelAprobado(int nivel) {
    this.ultimoNivelAprobado = nivel;
  }


  public void registrar() {
    registro = new Registro(this.nombre, this.password);
    if (registro.registrar()) {
      label1.setText("Ya existe el usuario");
      registro.setUsuario("");
      //this.limpiarDatos();
    } else {
      label1.setText("Usuario creado");
      //this.limpiarDatos();
    }
  }
  public void verificar(){
    login = new Login(this.nombre, this.password);
    if (login.verificarUsuario()) {
      this.ultimoNivelAprobado = login.getUltimoNivelAprobadoLogin();
      label1.setText("Ingresando");
      state = stateGameManager;
      borrarGUI();      
    } else {
      label1.setText("Datos Incorrectos");
    }
  }

  public void guardarNivel(int nivelUsuario) {
    this.ultimoNivelAprobado = nivelUsuario;
    // guardartxt
      }
    
 
}
