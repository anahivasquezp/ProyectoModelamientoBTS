public class Tall extends Personaje{

    public Tall(float posX, float posY, Colision colision){
      this.img = loadImage("data/Tall.png");
      this.posX = posX;
      this.posY = posY;
      this.colision = colision;
      this.estado=false;
    }
  
  @Override
   public void mover(){
     if (this.estado){
       if (keyCode==RIGHT){
         cambioX=8;
       }
       if(keyCode==LEFT){
         cambioX=-8;
       }
     }
   }
   
   @Override
   public void cambiarEstado(String tipo){
     if (tipo=="Tall"){
       this.estado=false;
    }
    if (tipo=="Big"){
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
