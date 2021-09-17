public class Teletransportador implements Elemento{  //CAMBIAR A TELETRANSPORTADOR
  PImage img;
  float posX, posY;
  float alto=50;
  float ancho=50;
  Colision colision;
  Teletransportador otroTeletransportador = this;
  
 
  public Teletransportador(float posX, float posY, Colision colision){
    //Imagen de clase (pueden ser png, jpg, tga)
    img = loadImage("teletransportador.png");    
    //Posiciones y colision
    this.posX = posX;
    this.posY = posY;
    this.colision = colision;
  }
  
  public void setOtroTeletransportador(Teletransportador teletransportador){
    this.otroTeletransportador = teletransportador;
  }

  public float[] obtenerPosicion(){
      float[] pos = {posX,posY};
      return pos;
  }
  
    //dibuja la imagen
    @Override
    public void dibujar() {
      image(img, posX, posY, ancho, alto);
    }
    
    //Portal no se mueve
    @Override
    public void mover() {}
    
    
  
    @Override
    public void interactuar() {
      //Detecta la colisión con cada personaje y elimina a cada personaje del mapa
      ArrayList<Elemento> colisionados = colision.colisionar(this);
      for(Elemento colisionado : colisionados){
        if(colisionado instanceof Personaje){
            float[] pos = otroTeletransportador.obtenerPosicion();
            if(((Personaje)colisionado).cambioX < 0){
               ((Personaje)colisionado).posX = pos[0]+50;
               ((Personaje)colisionado).posY = pos[1];
            }
            else{
               ((Personaje)colisionado).posX = pos[0]-50;
               ((Personaje)colisionado).posY = pos[1];
            }

        }
      }
    }
    
    
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
