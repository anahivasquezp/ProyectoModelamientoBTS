public class Caja implements Elemento{  

  PImage img;
  float posX, posY;
  float vX, vY;
  float alto=50;
  float ancho=50;
  Colision colision;
  boolean eliminado = false; // sirve para habilitar o deshabilitar el método interactuar y dibujar

 
public Caja(float posX, float posY, Colision colision){
    //Imagen de clase (pueden ser png, jpg, tga)
    img = loadImage("data/caja.png");    

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
    
    //La caja no se mueve, interactúa
    @Override
    public void mover() {}
    
    
    @Override
    public void interactuar() {
      float gravedad=0.6;
      vY += gravedad;
      this.posY += vY;
      
      ArrayList<Elemento> colisionados = this.colision.colisionar(this);
      
      for(Elemento colisionado: colisionados){
        
         if(colisionado instanceof Big){  
          this.vX = ((Big)colisionado).cambioX;
            if(vX == 0 && this.posY <= ((Big)colisionado).posY){
              if(this.posX < ((Big)colisionado).posX){
                this.posX = ((Big)colisionado).posX - 51;
              }else if (this.posX > ((Big)colisionado).posX){
                this.posX = ((Big)colisionado).posX + 51;
              }
              
            }
            if(vX < 0  && this.posY <= ((Big)colisionado).posY){
              this.posX = ((Big)colisionado).posX - 51;
              this.posX += vX;
            }else if (vX > 0 && this.posY <= ((Big)colisionado).posY){
              this.posX = ((Big)colisionado).posX + 51;
              this.posX += vX;
            }
          }else if(colisionado instanceof Pared ){
            if(vY > 0 && this.posY < ((Pared)colisionado).posY){
              this.vY = 0;
              this.posY =((Pared)colisionado).posY - 50;
            }else if(vY < 0 && this.posY > ((Pared)colisionado).posY){
              this.vY = 0;
              this.posY =((Pared)colisionado).posY + 50;
            }
          }else if(colisionado instanceof Personaje){
            if(vY > 0 && this.posY < ((Personaje)colisionado).posY){
              this.vY = 0;
              this.posY =((Personaje)colisionado).posY - 50;
            }
          }
      }
      
      colisionados = this.colision.colisionar(this);
      for(Elemento colisionado: colisionados){
        
         if(colisionado instanceof Pared && ((Pared)colisionado).posY == this.posY){
           if(vX == 0){
              if(this.posX < ((Pared)colisionado).posX){
                this.posX = ((Pared)colisionado).posX - 50;
              }else if (this.posX > ((Pared)colisionado).posX){
                this.posX = ((Pared)colisionado).posX + 50;
              }
              
            }else if(vX > 0){
              //System.out.println(vX);
              this.vX = 0;
              this.posX =((Pared)colisionado).posX - 50;
            }else if(vX < 0){
              //System.out.println(vX);
              this.vX = 0;
              this.posX =((Pared)colisionado).posX + 50;
            }
          }
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
