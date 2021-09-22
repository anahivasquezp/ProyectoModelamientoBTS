public class Malo extends Personaje{
  float posX0, posY0;

    public Malo(float posX, float posY, Colision colision){
      temporizador.start();
      this.img = loadImage("data/Malo.png");
      this.posX = posX;
      this.posX0 = posX;
      this.posY = posY;
      this.posY0 = posY;
      this.colision = colision;
      this.estado=0;
    }
  
  @Override
   public void mover(){
     if (this.estado == 0){
       if (key == 'd' || key == 'D'){
         cambioX = 3;
       }
       if(key == 'a' || key == 'A'){
         cambioX = -3;
       }
     }
   }
   
  
  
  @Override
   public void saltar(){
     if (this.estado == 0 && saltable == true){
       if (key == 'w' || key == 'W'){
         cambioY=-15;
         this.saltable=false;
       }
       }
     }
  
  @Override
    public void interactuar() {
    float gravedad=0.6;
    cambioY += gravedad;


    ArrayList<Elemento> colisiones = this.colision.colisionar(this);

    if (colisiones.size()>0) {

      for (Elemento s : colisiones) {
        if (s instanceof Pared) {
          if (cambioY>0 && posY < ((Pared)s).posY) {
            this.cambioY = 0;
            this.posY=((Pared)s).posY - 50;
            this.saltable=true;
            
          } else if (cambioY<0&& posY>((Pared)s).posY) {
            this.cambioY = 0;
            this.posY=((Pared)s).posY + 50;
          }
          
        } else if (s instanceof Caja) {
          if (cambioY > 0 && posY < ((Caja)s).posY) {
            this.cambioY = 0;
            ((Caja)s).vY = 0;
            this.posY = ((Caja)s).posY - 50;
            this.saltable=true;
          } else if (cambioY < 0 && posY > ((Caja)s).posY) {
            this.cambioY = 0;
            ((Caja)s).vY = 0;
            this.posY = ((Caja)s).posY +50;
          }
        }else if (s instanceof Portal) {
          this.regresar();
        }
      }
    }
    this.posY+=cambioY;

    if (colisiones.size()>0) {
      for (Elemento s : colisiones) {
        if (s instanceof Pared && ((Pared)s).posY == this.posY) {
          if (cambioX>0) {
            this.posX = ((Pared)s).posX-54;
            this.cambioX = 0;
          } else if (cambioX<0) {
            this.posX = ((Pared)s).posX+54;
            this.cambioX=0;
          }
        } else if (s instanceof Caja && ((Caja)s).posY == this.posY) {
          if (cambioX>0) {
            this.posX = ((Caja)s).posX-54;
            this.cambioX = 0;
          } else if (cambioX<0) {
            this.cambioX=0;
            this.posX = ((Caja)s).posX+54;
          } else {
            if (this.posX < ((Caja)s).posX) {
              this.posX = ((Caja)s).posX - 54;
            } else if (this.posX > ((Caja)s).posX) {
              this.posX = ((Caja)s).posX + 54;
            }
          }
        }        
      }
    }
    this.posX+=cambioX;
    
    if(temporizador.second() >= 15){
      temporizador.restart();
      this.regresar();
    }
    
  }
  
  //No implementa el cambiar estado solo hay un malo
  public void cambiarEstado() {

  }
  
  private void regresar(){
    this.posX = posX0;
    this.posY = posY0;
  }
  
  
}
