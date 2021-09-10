Mapa m;
ArrayList<Elemento> elementos;
final static float MOVE_SPEED = 5;


void setup(){
  size(1200,500);
  imageMode(CENTER);
  Mapa m = new Mapa();
  
  m.dibujarMapa();
  elementos = m.obtenerElementos();

}

void draw(){
  background(255);
  for(Elemento s: elementos) //recorro el array de tipo elemento
    s.dibujar(); //muestro en pantalla

}
