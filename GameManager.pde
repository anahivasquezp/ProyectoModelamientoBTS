public class GameManager {
  Nivel nivel; //bidireccionalidad con nivel
  Usuario usuario; //necesita de un usuario verificado para funcionar
  boolean pantallaNivel=true; //conocer si está dentro del frame
  int nivelElegido = 0;  
  PImage candado;//imagen cargada para el fram GM de niveles no aprobados

  public GameManager(Usuario user) {
    nivel = new Nivel(this);
    usuario = user;
    candado = loadImage("Candado.png");
  }

  //game manager es un Frame que se ejecuta 60 veces
  public void dibujarGameManager() { //click en botones
    boolean button = false;
    //Variables para el botón
    int x= 20; //ejex
    int w= 200;  //ancho cuadrado
    int y= 280; //eje y
    int h= 200;   //altura cuadrado
    PFont font1;

    background(255);
    
    //obtiene el último nivel aprobado dependiendo del usuario
    int ultimoNivel=usuario.getUltimoNivelAprobado();
    
    //si se encuentra en la pantalla de niveles   
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
      x=45;

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
            image(candado, x+20, y+20);
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
      nivel.setNivelActual(nivelElegido); //nivel que el usuario elija en el menú
      nivel.iniciarNivel(); //es el que llama para inicializar o dibujar el mapa
    }
  }


  //guarda el nivel en el usuario
  public void guardarProgreso() {
    if (nivelElegido > usuario.getUltimoNivelAprobado()) { //verifica que haya aprobado un nuevo nivel
      usuario.setUltimoNivelAprobado(nivelElegido); //se necesita para actualizar el gm
      usuario.guardarNivel(); //guarda el último nivel del usuario 
    }
  }
}
