public class Tall extends Personaje {

  public Tall(float posX, float posY, Colision colision) {
    this.img = loadImage("data/Tall.png");
    this.posX = posX;
    this.posY = posY;
    this.colision = colision;
    this.estado=1;
  }

  @Override
    public void mover() {
    if (this.estado==0) {
      if (keyCode==RIGHT) {
        cambioX=6;
      }
      if (keyCode==LEFT) {
        cambioX=-6;
      }
    }
  }



  @Override
    public void saltar() {
    if (this.estado==0&&saltable==true) {
      if (keyCode==UP) {
        cambioY=-20;
        saltable=false;
      }
    }
  }
}
