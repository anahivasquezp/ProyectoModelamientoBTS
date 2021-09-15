public class Nivel {
  int nivelActual;
  int contadorPersonajes;
  Mapa mapa;
  boolean nivelCargado;


  public  Nivel () {
    mapa = new Mapa();
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
    //this.nivelActual=nivelActual;
    this.contadorPersonajes=0;
    mapa.inicializarMapa(nivelActual);
  }



  //HACEN LO MISMO
  /*public void pasarNivel(){
   if(contadorPersonajes==3){
   this.nivelActual++;
   this.contadorPersonajes=0;
   }
   }*/

  public boolean pasarNivel() {
    if (contadorPersonajes==3) {
      this.nivelActual++;
      this.contadorPersonajes=0;
      return true;
    }
    return true;
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
