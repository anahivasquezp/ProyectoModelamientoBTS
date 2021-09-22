import g4p_controls.*;
import lord_of_galaxy.timing_utils.*;

PImage img;
float x, y;
GameManager gm;

// variables de estado
final int stateLogin = 0;  // consts
final int stateGameManager = 1;
Stopwatch temporizador = new Stopwatch(this);

int state = stateLogin ;   // current



public void setup() {

  size(1250, 825, JAVA2D);

  surface.setLocation(100, 100);
  createGUI();
  customGUI();
  
  img = loadImage("Big.png");
  x=570;
  y=725;
}

public void draw() {
  background(255);

  // this calls functions for each state
  switch (state){
  case stateLogin:
    //imagen que salte
    image(img, 570, y);
    y-=0.5;
    if (y==685) {
      image(img, 570, y);
      y+=20;
    }
    break;

  case stateGameManager:  //el estado se cambia en 
    gm.dibujarGameManager();
    for(Elemento s: gm.nivel.mapa.elementos){
      s.interactuar();
    }
    gm.nivel.mapa.interactuar(); //verifica a los personajes 
    break;

  default:
    // error
    println ("undefined state, error 39");
    break;
    //
  } // switch
}

void keyPressed(){
  try{
    boolean teclaPresionada = keyCode==RIGHT || keyCode==LEFT ||keyCode==UP || (key == 'd' || key == 'D') || (key == 'a' || key == 'A') || (key == 'w' || key == 'W');
    if(teclaPresionada){
      for(Elemento s: gm.nivel.mapa.personajes){
        ((Personaje) s).mover();
        ((Personaje) s).saltar();
      }
    }
    if(keyCode==32){
      for(Elemento s: gm.nivel.mapa.personajes){
        ((Personaje) s).cambiarEstado();
        }
    }
    if(keyCode==ENTER){ 
      user.verificar();//verifica denuevo el usuario por el último nivel aprobado
      gm = new GameManager(user); //vuelve a crear un gm      
    }
  }catch(Exception e){
    //System.out.println("Error 1!!!");
  }
  
}
void keyReleased(){
  try{
    boolean teclaPresionada = keyCode==RIGHT || keyCode==LEFT || (key == 'd' || key == 'D') || (key == 'a' || key == 'A');
    if(teclaPresionada){
      for(Elemento s: gm.nivel.mapa.personajes){
        ((Personaje) s).detener();
      }
    }
  }catch(Exception e){
    //System.out.println("Error 2!!");
  }
}


// Use this method to add additional statements
// to customise the GUI controls
public void customGUI() {
}
