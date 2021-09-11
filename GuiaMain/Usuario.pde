public class Usuario {
  String user;
  String contrasena;
  int ultimoNiveleAprobado;

//String usuario, String contrasena, int nivel
  public Usuario() {
    this.user="Pedrito";
    //this.contrasena=contrasena;
  this.ultimoNiveleAprobado=2;
  }

  public void guardarNivel() {
    this.ultimoNiveleAprobado++;
  }

  public String getUser(){
  return user;
  }
  
  public int getUltimoNiveleAprobado(){
  return ultimoNiveleAprobado;
  }
  
  
}
