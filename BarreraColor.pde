public class BarreraColor implements Elemento {
  PImage img;
  float posX, posY;
  float alto=100;

  float ancho=50;
  Colision colision;
  boolean abierto = false;
  //Para verificar el color
  //Suponiendo 
  //1=Rojo
  //2=Azul
  //3=Amarillo
  Color colorPuerta;

  public BarreraColor(float posX, float posY, Colision colision, Color colorPuerta) {
    //Imagen de la clase
    switch(colorPuerta) {
    case ROJO: 
      img = loadImage("data/PuertaColorRojo.png");
      break;
    case AZUL: 
      img = loadImage("data/PuertaColorAzul.png");
      break;
    case AMARILLO:
      img = loadImage("data/PuertaColorAmarillo.png");
      break;
    }
    //pos y colision
    this.colorPuerta = colorPuerta;
    this.posX = posX;
    this.posY = posY;
    this.colision = colision;
  }

  @Override
    public void dibujar() {
    if (!abierto) {
      image(img, posX, posY, ancho, alto);
    }
  }
  //PuertaColor no se mueve
  @Override
    public void mover() {
  }

  public void interactuar() {
    if (!abierto) {
      //Verifica si el personaje Que entra a la puerta es del mismo color que la puerta
      ArrayList<Elemento> colisionados = colision.colisionar(this);
      for (Elemento colisionado : colisionados) {
        Color colorPersonaje;
        if (colisionado instanceof Tall) colorPersonaje = Color.AZUL;
        if (colisionado instanceof Big) colorPersonaje = Color.ROJO;
        else colorPersonaje = Color.AMARILLO;
        if (colisionado instanceof Personaje) {
          if ( colorPersonaje == this.colorPuerta) {               
            // elimina la puerta (la manda a una esquinna)
            this.posX = -1;
            this.posY = -1;
            this.ancho = 0;
            this.alto = 0;
            // desactiva el método interactuar y dibujar
            this.abierto=true;
          }
        }
      }
    }
  }


  @Override
    public boolean esMortal() {
    return false;
  }
  @Override
    public float[] obtenerMargen() {
    float margenIzquierdo = posX - ancho/2;
    float margenDerecho = posX + ancho/2;
    float margenSuperior = posY - alto/2;
    float margenInferior = posY + alto/2;

    float[] margenes = {margenIzquierdo, margenDerecho, margenSuperior, margenInferior};
    return margenes;
  }
}
