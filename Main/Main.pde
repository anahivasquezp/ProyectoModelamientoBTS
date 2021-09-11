Mapa m;

final static float MOVE_SPEED = 5;
GameManager gm;

void setup(){
  size(1200,500);
  imageMode(CENTER);
  
  gm = new GameManager();
  
}

void draw(){
  background(255);

  gm.dibujarGM();
}
