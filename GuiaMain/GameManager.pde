public class GameManager {

  Nivel nivel;
  Usuario usuario;

  public GameManager() {
    nivel = new Nivel();
    usuario=new Usuario();
  }

  //public void verificarFinJuego(){} 

  public void dibujarGameManager(){ //click en botones
  //nivel que el usuario elija en el menú
    nivel.setNivelActual(2);
    nivel.iniciarNivel();
  } 

  //carga los niveles dependiendo el usuario
  public int cargarProgreso() {
    return usuario.getUltimoNiveleAprobado();
  }


  //guarda el nivel enel usuario
  public void guardarProgreso() {
    usuario.guardarNivel();  //pilas que se hace
  }


}
