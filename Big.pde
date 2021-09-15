public class Big extends Personaje{

    public Big(float posX, float posY, Colision colision){
      this.img = loadImage("data/Big.png");
      this.posX = posX;
      this.posY = posY;
      this.colision = colision;
      this.estado=true;
    }
  
  @Override
   public void mover(){
     if (this.estado){
       if (keyCode==RIGHT){
         cambioX=15;
       }
       if(keyCode==LEFT){
         cambioX=-15;
       }
     }
   }
   
   @Override
   public void cambiarEstado(String tipo){
     if (tipo=="Big"){
       this.estado=false;
    }
    if (tipo=="Small"){
      this.estado=true;
    }
  }
  
  @Override
   public void saltar(){
     if (this.estado){
       if (keyCode==UP){
         cambioY=-15;
       }
       }
     }
  
  
  
  
}
