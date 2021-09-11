public class GameManager {

  ArrayList<Nivel> niveles;
  Usuario usuario;

  public GameManager() {
    niveles = new ArrayList<Nivel>();
    usuario=new Usuario();
  }

  //public void verificarFinJuego(){} 

  public void dibujarGameManager(){ //click en botones
  
  
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
