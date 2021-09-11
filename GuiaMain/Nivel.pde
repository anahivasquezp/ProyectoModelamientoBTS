public class Nivel {
int nivelActual;
int contadorPersonajes;

Mapa mapa;
GameManager gameManager;


  public  Nivel (){
   //this.nivelActual= gameManager.cargarProgreso();
    this.nivelActual=1;
    contadorPersonajes=0;
  }
  
  
  public void reiniciarNivel(){
    //this.nivelActual=nivelActual;
    this.contadorPersonajes=0;
    mapa.dibujarMapa();
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
  
  //agregar Set nivel Actual
  /*
  public void setNivelActual(){
    this.nivelActual = nivelActual;
  }
  */
  
  public int getContadorPersonajes(){
    return contadorPersonajes;
  }
  
  
  
  
  
}
