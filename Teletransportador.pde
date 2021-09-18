public class Teletransportador implements Elemento{  //CAMBIAR A TELETRANSPORTADOR
  PImage img;
  float posX, posY;
  float alto=50;
  float ancho=50;
  Colision colision;
  Teletransportador otroTeletransportador = this;
  boolean activado;
 
  public Teletransportador(float posX, float posY, Colision colision){
    //Imagen de clase (pueden ser png, jpg, tga)
    img = loadImage("teletransportador.png");    
    //Posiciones y colision
    this.posX = posX;
    this.posY = posY;
    this.colision = colision;
  }
  
  public void desactivar(){
    this.activado = false;
  }
  
  public void setOtroTeletransportador(Teletransportador teletransportador){
    if(this.otroTeletransportador == this){
      this.otroTeletransportador = teletransportador;
      teletransportador.setOtroTeletransportador(this);
    }
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
      
      //Si el portal está activado, el personaje puede teletransportarse al otro portal
      if(activado){
          for(Elemento colisionado : colisionados){
            if(colisionado instanceof Personaje){
                float[] pos = otroTeletransportador.obtenerPosicion();
                if(((Personaje)colisionado).cambioX < 0){
                   ((Personaje)colisionado).posX = pos[0];
                   ((Personaje)colisionado).posY = pos[1];
                }
                else{
                   ((Personaje)colisionado).posX = pos[0];
                   ((Personaje)colisionado).posY = pos[1];
                }
                otroTeletransportador.desactivar();
            }
          }
      }
      //Si el portal esta desactivado, el personaje no puede teletransportarse al otro portal
      //El portal se activa de nuevo cuando el personaje salga del portal
      else{
         boolean sigueColisionandoConPersonaje = false;
         for(Elemento colisionado : colisionados){
            if(colisionado instanceof Personaje){
              sigueColisionandoConPersonaje = true;
            }
          }
          if(!sigueColisionandoConPersonaje) this.activado = true;
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
