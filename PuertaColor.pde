public class PuertaColor implements Elemento{
  PImage img;
  float posX, posY;
  float alto=100;
  float ancho=50;
  Colision colision;
  boolean abierto = false;
  //Para verificar el color
  //Suponiendo 
  //1=Rojo
  //2=Azul
  //3=Amarillo
  int colorPuerta;

  public PuertaColor(float posX, float posY, Colision colision, int colorPuerta){
    //Imagen de la clase
    switch(colorPuerta){
      case 1: 
        img = loadImage("data/PuertaColorRojo.png");
        break;
      case 2: 
        img = loadImage("data/PuertaColorAzul.png");
        break;
      case 3:
        img = loadImage("data/PuertaColorAmarillo.png");
        break;
    }
    //pos y colision
    this.colorPuerta = colorPuerta;
    this.posX = posX;
    this.posY = posY;
    this.colision = colision;
  }
  
     @Override
    public void dibujar() {
      if(!abierto){
        image(img, posX, posY, ancho, alto);
      }
    }
   //PuertaColor no se mueve
    @Override
    public void mover() {}
    
   public void interactuar(){
    /*
     if(!abierto){
        //Verifica si el personaje Que entra a la puerta es del mismo color que la puerta
        ArrayList<Elemento> colisionados = colision.colisionar(this);
        for(Elemento colisionado : colisionados){
          if(colisionado instanceof Personaje){
             if( ((Personaje)colisionado).getColor = this.colorPuerta){               
               this.posX = -1;
               this.posY = -1;
               this.ancho = 0;
               this.alto = 0;
               this.eliminado = true;
               this.abierto=true;
             }
          }
        }
        */
        
   };
   
   
   @Override
   public boolean esMortal(){
     return false;
   }
     @Override
    public float[] obtenerMargen(){
      float margenIzquierdo = posX - ancho/2;
      float margenDerecho = posX + ancho/2;
      float margenSuperior = posY - alto/2;
      float margenInferior = posY + alto/2;
      
      float[] margenes = {margenIzquierdo,margenDerecho, margenSuperior, margenInferior};
      return margenes;
    }
}
