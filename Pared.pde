public class Pared implements Elemento{  
  PImage img;
  float posX, posY;
  float alto=50;
  float ancho=50;
  Colision colision;
  boolean eliminado = false; // sirve para habilitar o deshabilitar el método interactuar y dibujar

 
  public Pared(float posX, float posY, Colision colision){
    //Imagen de clase (pueden ser png, jpg, tga)
    img = loadImage("data/pared.png");    
    //Posiciones y colision
    this.posX = posX;
    this.posY = posY;
    this.colision = colision;
    
    
  }
  
     @Override
     boolean esMortal(){
        return false;
     };

    //dibuja la imagen
    @Override
    public void dibujar() {
      if(!eliminado){
        image(img, posX, posY, ancho, alto);
      }
    }
    
    //LLave no se mueve
    @Override
    public void mover() {}
    
    
    //llama a los métodos interactuar de cada parte del bloque (izquierda derecha arriba abajo)  
    @Override
    public void interactuar() {}
    
    
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
