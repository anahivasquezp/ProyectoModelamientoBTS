public class Small extends Personaje{

    public Small(float posX, float posY, Colision colision){
      this.img = loadImage("data/Small.png");
      this.posX = posX;
      this.posY = posY;
      this.colision = colision;
      this.estado=false;
    }
  
  @Override
   public void mover(){
     if (this.estado){
       if (keyCode==RIGHT){
         cambioX=10;
       }
       if(keyCode==LEFT){
         cambioX=-10;
       }
     }
   }
   
   @Override
   public void cambiarEstado(String tipo){
     if (tipo=="Small"){
       this.estado=false;
    }
    if (tipo=="Tall"){
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
