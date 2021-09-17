public class Llave implements Elemento{
  
  PImage img;
  float posX, posY; // posiciones del centro del Elemento
  float alto = 37;
  float ancho = 100;
  Colision colision;
  boolean eliminado = false; // sirve para habilitar o deshabilitar el método interactuar y dibujar
  
  public Llave(float posX, float posY, Colision colision){
    //Imagen de clase (pueden ser png, jpg, tga)
    this.img = loadImage("data/llave.png");
    
    //Posiciones y colision
    this.posX = posX;
    this.posY = posY;
    this.colision = colision;
  }
    
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
    
    
     @Override
     boolean esMortal(){
        return false;
     };
  
    @Override
    public void interactuar() {
      if(!eliminado){
        //Agrega la llave al personaje y elimina la llave del mapa, mandandola a una esquina, también deshabilita el método interactuar;
        ArrayList<Elemento> colisionados = colision.colisionar(this);
        for(Elemento colisionado : colisionados){
          if(colisionado instanceof Personaje){
              ((Personaje)colisionado).contadorLlaves++;
              this.posX = -1;
              this.posY = -1;
              this.ancho = 0;
              this.alto = 0;
              this.eliminado = true;
              System.out.println(((Personaje)colisionado).contadorLlaves);
          }

        }
      }
    }
    
    
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
