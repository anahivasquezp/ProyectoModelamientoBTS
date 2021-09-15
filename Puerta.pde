public class Puerta implements Elemento{

  PImage img;
  float posX, posY;
  float alto=100;
  float ancho=50;
  Colision colision;
  boolean eliminado = false;
  
  public Puerta(float posX, float posY, Colision colision){
    //Imagen de la clase
    img = loadImage("data/puerta.png");
    //pos y colision
    this.posX = posX;
    this.posY = posY;
    this.colision = colision;
  }
  
    @Override
    public boolean esMortal(){
      return false;
    }
    
    @Override
    public void dibujar() {
      if(!eliminado){
        image(img, posX, posY, ancho, alto);
      }
    }
   //PuertaColor no se mueve
    @Override
    public void mover() {}
    
   public void interactuar(){
    /*
     if(!eliminado){
        //Verifica si el personaje Que entra a la puerta es del mismo color que la puerta
        ArrayList<Elemento> colisionados = colision.colisionar(this);
        for(Elemento colisionado : colisionados){
          if(colisionado instanceof Personaje){
             if( ((Personaje)colisionado).tieneLlave()){
                ((Personaje)colisionado).quitarLlave();
                this.posX = -1;
                this.posY = -1;
                this.ancho = 0;
                this.alto = 0;
                this.eliminado = true;
             }
          }
        }
        */
        
   };
   
   
   
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
