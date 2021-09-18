public class Boton implements Elemento{  
  // Botón requiere asociarse con un laser con el método setLaser(Laser laser)
  PImage imgagenBoton;
  PImage imgagenBotonPresionado;
  float posX, posY;
  float alto=50;
  float ancho=50;
  Colision colision;
  boolean presionado = false; // sirve para habilitar o deshabilitar el método interactuar y dibujar
  
  Laser laser;
 
  public Boton(float posX, float posY, Colision colision){
    //Imagen de clase (pueden ser png, jpg, tga)
    imgagenBoton = loadImage("data/boton.png");    
    imgagenBotonPresionado = loadImage("data/boton-presionado.png");
    //Posiciones y colision
    this.posX = posX;
    this.posY = posY;
    this.colision = colision;
  }
  
  
  public void setLaser(Laser laser){
      this.laser = laser;
  }
     @Override
     boolean esMortal(){
        return false;
     };

    //dibuja la imagen
    @Override
    public void dibujar() {
      if(presionado){
        image(imgagenBotonPresionado, posX, posY, ancho, alto);
      }
      else{
        image(imgagenBoton, posX, posY, ancho, alto);
      }
    }
    
    //LLave no se mueve
    @Override
    public void mover() {}
    
    
  
    @Override
    public void interactuar() {
      try{
        ArrayList<Elemento> colisionados = colision.colisionar(this);
        for(Elemento colisionado : colisionados){
          if(colisionado instanceof Personaje || colisionado instanceof Caja){ 
            laser.apagar();
            presionado = true;
          }
          else{
            laser.encender();
            presionado = false;
          } 
        }
        if(colisionados.isEmpty()){
            laser.encender();
            presionado = false;
        }
      }
      catch(Exception e){
        System.out.println("El botón no se vinculó con un Laser");
        System.out.println(e);
      }
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
