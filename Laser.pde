public class Laser implements Elemento{  
  PImage imagenEncendido;
  PImage imagenApagado;
  float posX, posY;
  float alto=50;
  float ancho=50;
  Colision colision;
  boolean encendido = true; // sirve para habilitar o deshabilitar el método interactuar y dibujar
  
 
    public Laser(float posX, float posY, Colision colision){
      //Imagen de clase (pueden ser png, jpg, tga)
      imagenEncendido = loadImage("data/laser-activado.png");    
      imagenApagado = loadImage("data/laser-desactivado.png");   
      
      //Posiciones y colision
      this.posX = posX;
      this.posY = posY;
      this.colision = colision;
    }
   
   
   boolean esMortal(){
      if(encendido){
        return true;
      }
      else{
        return false;
      }
   };
   
   
   public void apagar(){
     this.encendido = false;
   }
   public void encender(){
     this.encendido = true;
   }

    //dibuja la imagen
    @Override
    public void dibujar() {
      if(encendido){
        image(imagenEncendido, posX, posY, ancho, alto);
      }
      else{
        image(imagenApagado, posX, posY, ancho, alto);
      }
    }
    
    //LLave no se mueve
    @Override
    public void mover() {}
    
    
  
    @Override
    public void interactuar() {}
    
    
    // posiciones y marcos
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
