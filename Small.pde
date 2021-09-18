public class Small extends Personaje {

  public Small(float posX, float posY, Colision colision) {
    this.img = loadImage("data/Small.png");
    this.posX = posX;
    this.posY = posY;
    this.colision = colision;
    this.estado=2;
  }

  @Override
    public void mover() {
    if (this.estado==0) {
      if (keyCode==RIGHT) {
        cambioX=9;
      }
      if (keyCode==LEFT) {
        cambioX=-9;
      }
    }
  }


  @Override
    public void saltar() {
    if (this.estado==0&&saltable==true) {
      if (keyCode==UP) {
        cambioY=-17;
        saltable=false;
      }
    }
  }
}
