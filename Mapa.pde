public class Mapa implements Elemento {
  private float posX, posY;
  private int alt;
  private int ancho;
  ArrayList<Elemento> elementos;
  ArrayList<Elemento> personajes;


  // especificaciones del mapa
  PImage big, tall, small, caja;
  final static float MOVE_SPEED = 5;
  final static float SPRITE_SCALE = 50.0/128;
  final static float SPRITE_SIZE = 50;

  public Mapa() {
    elementos = new ArrayList<Elemento>(); //array para guardar los elementos creados en el mapa
    personajes = new ArrayList<Elemento>(); //array para guardar los personajes creados en el mapa
    //inicializarMapa(3);
  }

  @Override
    public void dibujar() {
    throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
  }

  // dibuja el nivel que el usuario escoje
  public void inicializarMapa(int nivel) {

    Colision colision = new Colision (this);

    String Filename="";

    switch(nivel) {
    case 1:
      Filename = "NivelUno.csv";
      break;
    case 2:
      Filename = "NivelDos.csv";
      break;
    case 3:
      Filename = "NivelTres.csv";
      break;
    }

    String[] lines = loadStrings(Filename);

    for (int row = 0; row < lines.length; row++) {
      String[] values = split(lines[row], ",");
      for (int col = 0; col < values.length; col++) {

        
         if (values[col].equals("1")) {
         posX = SPRITE_SIZE/2 + col * SPRITE_SIZE;
         posY = SPRITE_SIZE/2 + row * SPRITE_SIZE;
         Elemento s = new Big(posX, posY, colision);
         elementos.add(s);
         personajes.add(s);
         

         } else if (values[col].equals("2")) {
         posX = SPRITE_SIZE/2 + col * SPRITE_SIZE;
         posY = SPRITE_SIZE/2 + row * SPRITE_SIZE;
         Elemento s = new Tall(posX, posY, colision);
         elementos.add(s);
         personajes.add(s);
     

         }else if (values[col].equals("3")) {
         posX = SPRITE_SIZE/2 + col * SPRITE_SIZE;
         posY = SPRITE_SIZE/2 + row * SPRITE_SIZE;
         Elemento s = new Small(posX, posY, colision);
         elementos.add(s);
         personajes.add(s);
       

         }
         

        // cambiar a else if cuando se agreguen los personajes
        if (values[col].equals("4")) {
          posX = SPRITE_SIZE/2 + col * SPRITE_SIZE;
          posY = SPRITE_SIZE/2 + row * SPRITE_SIZE;
          Elemento s = new Pared(posX, posY, colision);
          elementos.add(s);
        } else if (values[col].equals("5")) {
          posX = SPRITE_SIZE/2 + col * SPRITE_SIZE;
          posY = SPRITE_SIZE/2 + row * SPRITE_SIZE;
          Elemento s = new Portal(posX, posY, colision);
          elementos.add(s);
        }

        /*else if (values[col].equals("6")) {
         posX = SPRITE_SIZE/2 + col * SPRITE_SIZE;
         posY = SPRITE_SIZE/2 + row * SPRITE_SIZE;
         Elemento s = new Pincho(posX, posY, colision);
         elementos.add(s);
         }*/
        else if (values[col].equals("7")) {
          posX = SPRITE_SIZE/2 + col * SPRITE_SIZE;
          posY = SPRITE_SIZE/2 + row * SPRITE_SIZE;
          Elemento s = new Llave(posX, posY, colision);
          elementos.add(s);
        } else if (values[col].equals("8")) {
          posX = SPRITE_SIZE/2 + col * SPRITE_SIZE;
          posY = SPRITE_SIZE/2 + row * SPRITE_SIZE;
          Elemento s = new Puerta(posX, posY, colision);
          elementos.add(s);
        }
        /*else if (values[col].equals("9")) {
         posX = SPRITE_SIZE/2 + col * SPRITE_SIZE;
         posY = SPRITE_SIZE/2 + row * SPRITE_SIZE;
         Elemento s = new Caja(posX, posY, colision);
         elementos.add(s);
         }else if (values[col].equals("10")) {
         posX = SPRITE_SIZE/2 + col * SPRITE_SIZE;
         posY = SPRITE_SIZE/2 + row * SPRITE_SIZE;
         Elemento s = new Boton(posX, posY, colision);
         elementos.add(s);
         }else if (values[col].equals("11")) {
         posX = SPRITE_SIZE/2 + col * SPRITE_SIZE;
         posY = SPRITE_SIZE/2 + row * SPRITE_SIZE;
         Elemento s = new Laser(posX, posY, colision);
         elementos.add(s);
         }else if (values[col].equals("12")) {
         posX = SPRITE_SIZE/2 + col * SPRITE_SIZE;
         posY = SPRITE_SIZE/2 + row * SPRITE_SIZE;
         Elemento s = new Canon(posX, posY, colision);
         elementos.add(s);
         }
         else if (values[col].equals("13")) {
         posX = SPRITE_SIZE/2 + col * SPRITE_SIZE;
         posY = SPRITE_SIZE/2 + row * SPRITE_SIZE;
         Elemento s = new Teletransportador(posX, posY, colision);
         elementos.add(s);
         }*/

  
      
    }
    
  }
}

public void dibujarMapa(){
  for (Elemento s : elementos) 
        s.dibujar();
}

@Override
  public void mover() {
  throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
}

@Override
  public boolean esMortal() {
  return false;
}

@Override
  public void interactuar() {
  throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
}

@Override
  public float[] obtenerMargen() {
  throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
}


//get Array de Elementos del mapa
public ArrayList<Elemento> obtenerElementos() {
  return this.elementos;
}
}
