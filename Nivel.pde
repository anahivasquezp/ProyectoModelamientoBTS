public class Nivel {
  int nivelActual;
  Mapa mapa; //bidireccionalidad con mapa
  boolean nivelCargado; //variable para evitar cargar un mapa que ya fue inicializado
  GameManager gm; //bidireccionalidad con gm


  public  Nivel (GameManager gm) {
    mapa = new Mapa(this);
    this.gm = gm; // para el método pasar nivel y cargar el progreso en el gm
    this.nivelActual= 1;
    nivelCargado = false;
  }

  //iniciar Nivel que el usuario escoje
  public void iniciarNivel() {
    if (!nivelCargado) {
      mapa.inicializarMapa(nivelActual);
      nivelCargado = true;
    } else {
      mapa.dibujar();
    }
  }

  //se llama desde interactuar de mapa (muere un personaje)
  public void reiniciarNivel() {
    mapa = new Mapa(this); //necesita una nueva instancia de mapa
    mapa.inicializarMapa(nivelActual);
  }

  //se llama desde interactuar de mapa (pasan los 3 personajes el portal)
  public void pasarNivel() {
    this.nivelActual++;
    mapa = new Mapa(this); //necesita una nueva instancia de mapa     
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
