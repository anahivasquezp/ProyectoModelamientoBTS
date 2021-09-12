public class Nivel {
int nivelActual;
int contadorPersonajes;

Mapa mapa;


  public  Nivel (){
    mapa = new Mapa();
   this.nivelActual= 1;
   contadorPersonajes=0;
  }
  
  //iniciar Nivel
  public void iniciarNivel(){
    this.contadorPersonajes=0;
    mapa.dibujarMapa(nivelActual);
  }
  
  
  
  public void reiniciarNivel(){
    //this.nivelActual=nivelActual;
    this.contadorPersonajes=0;
    mapa.dibujarMapa(nivelActual);
  }
  
  
  
  //HACEN LO MISMO
  public void pasarNivel(){
    if(contadorPersonajes==3){
      this.nivelActual++;      
      this.contadorPersonajes=0;
    }
  }
  
  //HACEN LO MISMO
  public int notificarProgreso(){
    return nivelActual;
  }
  
  
  public int getNivelActual(){
    return nivelActual;
  }
  
  public int getContadorPersonajes(){
    return contadorPersonajes;
  }
  
  //set nivel actual
  
  public void setNivelActual(int nivel){
    this.nivelActual = nivel;
  }
  
  
  
}
