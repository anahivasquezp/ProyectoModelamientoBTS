public class Nivel {
  int nivelActual;
  int contadorPersonajes;
  Mapa mapa;
  boolean nivelCargado;
  GameManager gm;


  public  Nivel (GameManager gm) {
    mapa = new Mapa(this);
    this.gm = gm;
    this.nivelActual= 1;
    contadorPersonajes=0;
    nivelCargado = false;
  }

  //iniciar Nivel que el usuario escoje
  public void iniciarNivel() {
    if(!nivelCargado){
      this.contadorPersonajes=0;
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

  //es igual al get del nivelActual
  public int notificarProgreso() {
    return nivelActual;
  }

  public int getContadorPersonajes() {
    return contadorPersonajes;
  }

  public int getNivelActual() {
    return nivelActual;
  }

  public void setNivelActual(int nivel) {
    this.nivelActual = nivel;
  }
  
  
}
