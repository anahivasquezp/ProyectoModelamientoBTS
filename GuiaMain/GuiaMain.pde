
GameManager gm;
final static float MOVE_SPEED = 5;


void setup(){
  size(1200,800);
  imageMode(CENTER);
   gm = new GameManager();

}

void draw(){
  background(255);
  gm.dibujarGameManager();

}
