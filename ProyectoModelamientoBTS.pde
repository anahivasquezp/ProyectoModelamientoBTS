import g4p_controls.*;

// You can remove the PeasyCam import if you are not using
// the GViewPeasyCam control or the PeasyCam library.

PImage img;
float x, y;
GameManager gm;

// variables de estado

final int stateLogin = 0;  // consts
final int stateGameManager = 1;
//
int state = stateLogin ;   // current




public void setup() {

  size(1250, 825, JAVA2D);

  surface.setLocation(100, 100);
  createGUI();
  customGUI();
  
  img = loadImage("Big.png");
  x=200;
  y=400;
  
}

public void draw() {

  background(255);

  // this calls functions for each state
  switch (state){
  case stateLogin:
    //imagen que salte
    image(img, 580, y);
    y-=0.5;
    if (y==350) {
      image(img, 580, y);
      y+=20;
    }
    break;

  case stateGameManager:
  
    gm.dibujarGameManager();
    for(Elemento s: gm.nivel.mapa.elementos){
      s.interactuar();
    }
    
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
    if(keyCode==RIGHT || keyCode==LEFT ||keyCode==UP ){
      for(Elemento s: gm.nivel.mapa.personajes){
        ((Personaje) s).mover();
        ((Personaje) s).saltar();
      }
    }
    if(keyCode==32){
      String tipo="";
      for(Elemento s: gm.nivel.mapa.personajes){
        //(Personaje) s).cambiarEstado();
        if(((Personaje) s).estado==true && s instanceof Big){
          tipo="Big";
          break;
        }
        if(((Personaje) s).estado==true && s instanceof Tall){
          tipo="Tall";
          break;
        }
        if(((Personaje) s).estado==true && s instanceof Small){
          tipo="Small";
          break;
        }
        }
        for(Elemento s: gm.nivel.mapa.personajes){
        ((Personaje) s).cambiarEstado(tipo);
      }
    }
  }catch(Exception e){
    //System.out.println("Error 1!!!");
  }
  
}
void keyReleased(){
  try{
    if(keyCode==RIGHT || keyCode==LEFT ){
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
