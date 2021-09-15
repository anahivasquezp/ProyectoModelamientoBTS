public class GameManager {
  Nivel nivel;
  Usuario usuario;
  boolean pantallaNivel=true;
  int nivelElegido = 0;

  //imagen cargada para la interfaz principal
  PImage candado;

  public GameManager(Usuario user) {
    nivel = new Nivel();
    usuario = user;
    candado = loadImage("Candado.png");
  }

  //funcionalidad ?
  public void verificarFinJuego() {
  }

  public void dibujarGameManager() { //click en botones
    boolean button = false;
    //Variables para el botón
    int x= 20; //ejex
    int w= 200;  //ancho cuadrado
    int y= 120; //eje y
    int h= 200;   //altura cuadrado
    PFont font1;

    background(255);

    //si se encuentra en la pantalla de niveles    
    int ultimoNivel=usuario.getUltimoNivelAprobado();
    //int ultimoNivel=2;

    if (pantallaNivel==true) {
      //Si esta dentro y presiona el botón

      for (int cn = 0; cn < 5; cn++) {
        if ((mouseX > x) && (mouseX <x+w)&&(mouseY >y)&&(mouseY<y+h) && (mousePressed)) {
          if (ultimoNivel<cn) {
            button=false;
          } else {
            button = true;
            nivelElegido=cn+1;
            cn=5;
          }
        } else {
          button = false;
        }
        x=x+240;
      }

      x=20;

      //Botón Presionado

      if (button) {

        pantallaNivel=false; //No está en la pantalla de Niveles
      } else {

        background(255);
        for (int cx = 0; cx < 5; cx++) {
          if (ultimoNivel < cx) {
            stroke(255);
            fill(164, 54, 42);
            rect(x, y, w, h);
            candado.loadPixels();
            image(candado, x+40, y+40);
          } else {
            stroke(255);
            fill(205, 67, 52);
            rect(x, y, w, h);
          }
          fill(0, 0, 0);
          font1 = loadFont("LucidaFax-Demi-48.vlw");
          textFont(font1, 50);
          String s = str(cx+1);
          text(s, x+80, y+120);
          x=x+240;
        }
      }
    } else { //Si no se encuentra en la pantalla de niveles
      //nivel que el usuario elija en el menú
      nivel.setNivelActual(nivelElegido);
      nivel.iniciarNivel();
    }
  }



  //carga los niveles dependiendo el usuario
  /*public int cargarProgreso() {
   return usuario.getUltimoNivelAprobado();
   }*/

  //guarda el nivel en el usuario
  public void guardarProgreso() {
    if (nivel.pasarNivel()) {
      usuario.guardarNivel(nivel.getNivelActual());  //pilas que se hace
    }
  }

  //verifica si el usuario ya se encuentra registrado ?
  public void verificarUsuario() {
  }
}
