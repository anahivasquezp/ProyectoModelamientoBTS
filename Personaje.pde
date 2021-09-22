public abstract class Personaje implements Elemento {
  PImage img;
  float posX, posY; // posiciones del centro del Elemento
  float alto = 50;
  float ancho = 50;
  Colision colision;
  int vida; // 0 vivo, 1 pasado, 2 muerto
  int estado; // 0 es activo, 1 es siguiente, 2 es siguiente del siguiente
  float cambioY=0, cambioX=0;
  int contadorLlaves;
  boolean saltable;


  //dibuja la imagen
  @Override
    public void dibujar() {
    if (vida==0) {
      image(img, posX, posY, ancho, alto);
    }
  }


  @Override
    public void mover() {
  }

  public void saltar() {
  }

  @Override
    boolean esMortal() {
    return false;
  };




  // posiciones y marcos
  @Override
    public float[] obtenerMargen() {
    float margenIzquierdo = posX - ancho/2;
    float margenDerecho = posX + ancho/2;
    float margenSuperior = posY - alto/2;
    float margenInferior = posY + alto/2;

    float[] margenes = {margenIzquierdo, margenDerecho, margenSuperior, margenInferior};
    return margenes;
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
        } else if (s.esMortal()) {
          vida=2;
        }else if (s instanceof Malo && this.estado == 0) { // verifica si es que se colisiona con el malo y esta en estado activo
          vida=2;
        }else if (s instanceof Portal) {
          vida=1;
        }
      }
    }
    this.posY+=cambioY;

    if (colisiones.size()>0) {
      for (Elemento s : colisiones) {
        if (s instanceof Pared && ((Pared)s).posY == this.posY) {
          if (cambioX>0) {
            this.posX = ((Pared)s).posX-52;
            this.cambioX = 0;
          } else if (cambioX<0) {
            this.posX = ((Pared)s).posX+52;
            this.cambioX=0;
          }
        } else if (s instanceof Caja && ((Caja)s).posY == this.posY) {
          if (cambioX>0) {
            this.posX = ((Caja)s).posX-52;
            this.cambioX = 0;
          } else if (cambioX<0) {
            this.cambioX=0;
            this.posX = ((Caja)s).posX+52;
          } else {
            if (this.posX < ((Caja)s).posX) {
              this.posX = ((Caja)s).posX - 52;
            } else if (this.posX > ((Caja)s).posX) {
              this.posX = ((Caja)s).posX + 52;
            }
          }
        }
        
        if (s instanceof Puerta) {
          if (cambioX>0) {
            this.posX = ((Puerta)s).posX-52;
            this.cambioX = 0;
          } else if (cambioX<0) {
            this.posX = ((Puerta)s).posX+52;
            this.cambioX=0;
          }
        }
        if (s instanceof BarreraColor) {
          if (cambioX>0) {
            this.posX = ((BarreraColor)s).posX-52;
            this.cambioX = 0;
          } else if (cambioX<0) {
            this.posX = ((BarreraColor)s).posX+52;
            this.cambioX=0;
          }
        }
      }
    }

    this.posX+=cambioX;
  }

  public void detener() {
    cambioY=0;
    cambioX=0;
  }

  public void cambiarEstado() {
    switch(estado) {
    case 0:
      estado=2;
      break;
    case 1:
      estado=0;
      break;
    case 2:
      estado=1;
      break;
    }
  }

  public int getVida() {
    return this.vida;
  }
  
}
