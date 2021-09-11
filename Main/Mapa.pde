public class Mapa {
  private float posicion[];
  private int alt;
  private int ancho;
  ArrayList<Elemento> elementos;
  PImage red_brick, small;
  //-------------------------------

  final static float MOVE_SPEED = 5;
  final static float SPRITE_SCALE = 50.0/128;
  final static float SPRITE_SIZE = 50;

  //---------------------------------




  public Mapa() {
    elementos = new ArrayList<Elemento>(); //array para guardar los elementos creados en el mapa

    //solo carga las imágenes de todos los elemntos
      red_brick = loadImage("red_brick.png");
      small = loadImage("small.png");

  }


  // dibuja

  public void dibujarMapa() {
    String Filename = "NivelUno.csv";

    String[] lines = loadStrings(Filename);

    for (int row = 0; row < lines.length; row++) {
      String[] values = split(lines[row], ",");
      for (int col = 0; col < values.length; col++) {

        if (values[col].equals("1")) {
          Elemento s = new Elemento(red_brick, SPRITE_SCALE); //aqui deberiamos crear objetos de tipo de cada elemento
          s.center_x = SPRITE_SIZE/2 + col * SPRITE_SIZE;
          s.center_y = SPRITE_SIZE/2 + row * SPRITE_SIZE;
          elementos.add(s); //anado en la lista de elmentos del mapa
        } else if (values[col].equals("2")) {
          Elemento s = new Elemento(small, 1.0); //aqui deberiamos crear objetos de tipo de cada elemento
          s.center_x = SPRITE_SIZE/2 + col * SPRITE_SIZE;
          s.center_y = SPRITE_SIZE/2 + row * SPRITE_SIZE;
          //s.mover();
          elementos.add(s); //anado en la lista de elmentos del mapa
        }
      }
    }
    obtenerElementos();
    for(Elemento s: elementos) //recorro el array de tipo elemento
    s.dibujar();
  }

 public ArrayList<Elemento> obtenerElementos(){
        return this.elementos;
    }
  
    




  public void obtenerPosicion() {
  }







  public void mostrarSize() {
    size(800, 600);
  }

  public void mostrarBackground() {
    background(255);
  }
}
