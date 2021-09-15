public abstract class Personaje implements Elemento{
  PImage img;
  float posX, posY; // posiciones del centro del Elemento
  float alto = 50;
  float ancho = 50;
  Colision colision;
  boolean eliminado = false; // sirve para habilitar o deshabilitar el método interactuar y dibujar
  boolean estado;
  float cambioY=0,cambioX=0;
  int contadorLlaves;
  
      
    //dibuja la imagen
    @Override
    public void dibujar() {
      if(!eliminado){
        image(img, posX, posY, ancho, alto);
      }
    }
    
    
    @Override
    public void mover() {}
    
    public void saltar(){
    }
    
     @Override
     boolean esMortal(){
        return false;
     };
  
    
    
    
    
    
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
    
    public void cambiarEstado(String personaje){
      if(estado){
        estado = false;
        //this.siguiente = true;
      }
    }
    
    @Override
    public void interactuar(){
      
      float gravedad=0.6;
      cambioY += gravedad;
      
      
      ArrayList<Elemento> colisiones = this.colision.colisionar(this);
      
      if(colisiones.size()>0){
        
        for(Elemento s: colisiones){
          if (s instanceof Pared){
          if(cambioY>0 && posY<((Pared)s).posY){
            this.cambioY=0;
            this.posY=((Pared)s).posY-50;
            
          }
          else if(cambioY<0&& posY>((Pared)s).posY){
            this.cambioY=0;
            this.posY=((Pared)s).posY+50;
            
          }
          
          }
          
          } 
          
      }
      this.posY+=cambioY;
      
      colisiones=this.colision.colisionar(this);
      
      if(colisiones.size()>0){
        for(Elemento s: colisiones){
          if (s instanceof Pared && ((Pared)s).posY==this.posY){
          if(cambioX>0){
            this.posX=((Pared)s).posX-52;
            this.cambioX=0;
          }
          else if(cambioX<0){
            this.posX=((Pared)s).posX+52;
            this.cambioX=0;
         
          }
          }
          
          } 
          
      }
           
      this.posX+=cambioX;
      
      
      
    }
    
    public void detener(){
      cambioY=0;
      cambioX=0;
    }
    
  
  
  
}
