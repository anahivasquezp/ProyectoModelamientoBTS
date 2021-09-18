public class Nivel {
  int nivelActual;
  Mapa mapa;
  boolean nivelCargado;
  GameManager gm;


  public  Nivel (GameManager gm) {
    mapa = new Mapa(this);
    this.gm = gm;
    this.nivelActual= 1;
    nivelCargado = false;
  }

  //iniciar Nivel que el usuario escoje
  public void iniciarNivel() {
    if(!nivelCargado){
      mapa.inicializarMapa(nivelActual);
      nivelCargado = true;
    }else{
      mapa.dibujarMapa();
    }    
  }


  public void reiniciarNivel() {
    mapa = new Mapa(this);
    mapa.inicializarMapa(nivelActual);
  }

  public void pasarNivel() {
      this.nivelActual++;
      mapa = new Mapa(this);      
      mapa.inicializarMapa(nivelActual);
      gm.nivelElegido = nivelActual;
      gm.guardarProgreso();
  }

  public int getNivelActual() {
    return nivelActual;
  }

  public void setNivelActual(int nivel) {
    this.nivelActual = nivel;
  }
  
  
}
