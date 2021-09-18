public class Big extends Personaje{

    public Big(float posX, float posY, Colision colision){
      this.img = loadImage("data/Big.png");
      this.posX = posX;
      this.posY = posY;
      this.colision = colision;
      this.estado=0;
    }
  
  @Override
   public void mover(){
     if (this.estado==0){
       if (keyCode==RIGHT){
         cambioX=3;
       }
       if(keyCode==LEFT){
         cambioX=-3;
       }
     }
   }
   
  
  
  @Override
   public void saltar(){
     if (this.estado==0&&saltable==true){
       if (keyCode==UP){
         cambioY=-15;
         this.saltable=false;
       }
       }
     }
  
  
  
  
}
