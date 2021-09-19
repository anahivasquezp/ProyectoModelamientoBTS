
public class Portal implements Elemento{  

  PImage img;
  float posX, posY;
  float alto=100;
  float ancho=100;
  Colision colision;

 
public Portal(float posX, float posY, Colision colision){
    //Imagen de clase (pueden ser png, jpg, tga)
    img = loadImage("data/portal.png");    

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
