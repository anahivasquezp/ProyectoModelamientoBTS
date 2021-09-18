
public class Pincho implements Elemento{  

  PImage img;
  float posX, posY;
  float alto=15;
  float ancho=50;
  Colision colision;
  boolean eliminado = false; // sirve para habilitar o deshabilitar el método interactuar y dibujar

 
public Pincho(float posX, float posY, Colision colision){
    //Imagen de clase (pueden ser png, jpg, tga)
    img = loadImage("pincho.png");    

    //Posiciones y colision
    this.posX = posX;
    this.posY = posY+35;
    this.colision = colision;
    
    
  }
  
     @Override
     boolean esMortal(){
        return true;
     };

    //dibuja la imagen
    @Override
    public void dibujar() {
       image(img, posX, posY, ancho, alto);
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
