import java.util.regex.Pattern;

public class Mapa implements Elemento {
  private float posX, posY;
  ArrayList<Elemento> elementos; // contiene todos los elementos
  Elemento[] personajes; //array únicamente para acceder a los personajes
  Nivel nivel; //bidireccionalidad con nivel

  // especificaciones de escala del mapa  
  final static float SPRITE_SCALE = 50.0/128;
  final static float SPRITE_SIZE = 50;
    
  //temporizador para actualizar posición del malo
  

  
  public Mapa(Nivel nivel) { //requiere de parámetro un nivel para crearse un mapa
    this.nivel = nivel; //se necesita para el método interactuar
    elementos = new ArrayList<Elemento>(); //array para guardar los elementos creados en el mapa
    personajes = new Elemento[4]; //array para guardar los personajes creados en el mapa
  }


  //inicializa el nivel que el usuario escoje en el Game Manager
  public void inicializarMapa(int nivel) {
    Colision colision = new Colision (this); //se crea un objeto colisión que irá como parámetro para cada uno de los elementos que se creen y agreguen al arraylist

    String Filename="";
    
    //carga el csv del mapa que solicita
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
    case 4:
      Filename = "NivelCuatro.csv";
      break;
    case 5:
      Filename = "NivelCinco.csv";
      break;
    case 6:
      Filename = "GameOver.csv";
      break;
    }

    String[] lines = loadStrings(Filename);

    //hashMaps otorga un identificador a dos elementos que necesitan uno de otro (boton, láser, teletransportador)
    HashMap<String, Elemento[]> conexionLaserBoton = new HashMap<String, Elemento[]>(); //array normal porque se necesitan posiciones específicas
    HashMap<String, ArrayList<Elemento>> conexionTeletransportador = new HashMap<String, ArrayList<Elemento>>(); //arraylist porque los TPs se asocian todos entre sí


    //Separa el csv en columnas y filas
    for (int row = 0; row < lines.length; row++) {
      String[] values = split(lines[row], ",");
      for (int col = 0; col < values.length; col++) {

        // calculo de la posición de un elemento en base al csv y las escalas
        posX = SPRITE_SIZE/2 + col * SPRITE_SIZE;
        posY = SPRITE_SIZE/2 + row * SPRITE_SIZE;

        // Elemento temporal
        Elemento s = null;

        // los valores 1,2 y 3 son para personajes
        if (values[col].equals("1")) {
          s = new Big(posX, posY, colision);
          personajes[0]=s;
        } else if (values[col].equals("2")) {
          s = new Tall(posX, posY, colision);
          personajes[1]=s;
        } else if (values[col].equals("3")) {
          s = new Small(posX, posY, colision);
          personajes[2]=s;
        }//elementos generales que no requieren de verificación
        else if (values[col].equals("4")) s = new Pared(posX, posY, colision);
        else if (values[col].equals("5")) s = new Portal(posX, posY, colision);
        else if (values[col].equals("6")) s = new Pincho(posX, posY, colision);
        else if (values[col].equals("7")) s = new Llave(posX, posY, colision);
        else if (values[col].equals("8")) s = new Puerta(posX, posY, colision);
        else if (values[col].equals("9")) s = new Caja(posX, posY, colision);
        else if (values[col].equals("14")) s = new BarreraColor(posX, posY, colision, Color.ROJO);
        else if (values[col].equals("15")) s = new BarreraColor(posX, posY, colision, Color.AZUL);
        else if (values[col].equals("16")) s = new BarreraColor(posX, posY, colision, Color.AMARILLO);
        else if (values[col].equals("17")){
          s = new Malo(posX, posY, colision);
          personajes[3]=s;
        }

        if (s != null) elementos.add(s);

        //Se lee el valor 10 para Boton y su identificador
        else if (Pattern.compile("10-\\d+").matcher(values[col]).matches()) {

          //Tomo el indice
          String key = values[col].substring(3);

          //verifico si en el hashmap existe el índice y si no lo creo
          if (conexionLaserBoton.get(key) == null) {
            conexionLaserBoton.put(key, new Elemento[2]);
          }

          //Agrego un botón al hashmap temporal conexionLaser
          conexionLaserBoton.get(key)[1] = new Boton(posX, posY, colision);
        }

        //Se lee el valor 11 para Laser y su identificador
        else if (Pattern.compile("11-\\d+").matcher(values[col]).matches()) {

          //Tomo el indice
          String key = values[col].substring(3);

          //verifico si en el hashmap existe el índice y si no lo creo
          if (conexionLaserBoton.get(key) == null) {
            conexionLaserBoton.put(key, new Elemento[2]);
          }

          //Agrego un Laser al hashmap temporal conexionLaser
          conexionLaserBoton.get(key)[0] = new Laser(posX, posY, colision);
        }

        //Se lee el valor 13 para Teletransportador y su identificador
        else if (Pattern.compile("13-\\d+").matcher(values[col]).matches()) {

          //Tomo el indice
          String key = values[col].substring(3);

          //verifico si en el hashmap existe el índice y si no lo creo
          if (conexionTeletransportador.get(key) == null) {
            conexionTeletransportador.put(key, new ArrayList<Elemento>());
          }

          //Agrego un Teletransportador al hashmap temporal conexionTeletransportador
          conexionTeletransportador.get(key).add(new Teletransportador(posX, posY, colision));
        }
      }
    }


    //Se procesan las listas de teletransportadores para verificar su completitud y tipo
    for (ArrayList<Elemento> trasnportadores : conexionTeletransportador.values()) {

      //Se verifica que se hayan asignado valores para ambos teletransportadores 
      if (trasnportadores.get(0) != null && trasnportadores.get(1) != null) {

        //Se conectan los teletransportadores
        ((Teletransportador)trasnportadores.get(0)).setOtroTeletransportador((Teletransportador)trasnportadores.get(1));

        //Se agregan a la lista de elementos
        elementos.add(trasnportadores.get(0));
        elementos.add(trasnportadores.get(1));
      }
    }

    for (Elemento[] laserYBoton : conexionLaserBoton.values()) {

      //Se verifica que se hayan asignado valores para boton y laser 
      if (laserYBoton[0] != null && laserYBoton[1] != null) {

        //Conecto boton y laser
        ((Boton)laserYBoton[1]).setLaser((Laser)laserYBoton[0]);

        //Se agregan a la lista de elementos
        elementos.add(laserYBoton[0]);
        elementos.add(laserYBoton[1]);
      }
    }
  }
 
    @Override
    public void dibujar() {
    for (Elemento s : elementos) 
      s.dibujar();
  }

  @Override
    public void interactuar() {
    int contador=0;
    if (personajes[0] != null) {       
      for (Elemento p : personajes) {
        if (((Personaje) p).getVida() == 2) { //verifica si algun personaje murió
          this.nivel.reiniciarNivel();
        } else if (((Personaje) p).getVida() == 1) { //verifica si algun personaje pasó el portal
          contador++;
        }
      }
      if (contador ==3) {
        this.nivel.pasarNivel();
      }
    }
  }

  //get Array de Elementos del mapa (colisión hace uso de este método)
  public ArrayList<Elemento> obtenerElementos() {
    return this.elementos;
  }
  
    //no hay implementación de este método
  @Override
    public float[] obtenerMargen() {
    throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
  }
  
    //no hay implementación de este método
  @Override
    public void mover() {
    throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
  }

  //no hay implementación de este método
  @Override
    public boolean esMortal() {
    return false;
  }
  
}
