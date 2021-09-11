public class GameManager {
  Nivel n;
  Usuario u;
  boolean pantallaNivel=true;
  
  public GameManager(){
    n=new Nivel();
    u=new Usuario("Pedrito");
  }
  
  public void dibujarGM(){
    boolean button = false;
    //Variables para el botón
    int x= 20; //ejex
    int w= 200;  //ancho cuadrado
    int y= 120; //eje y
    int h= 200;   //altura cuadrado
    
    background(255);
    
    //si se encuentra en la pantalla de niveles
    if(pantallaNivel==true){
      //Si esta dentro y presiona el botón
      
      if((mouseX > x) && (mouseX <x+w)&&(mouseY >y)&&(mouseY<y+h && mousePressed)){
        button = true;   
      }else{
        button = false;
      }
    
      //Botón Presionado
      if(button){
        pantallaNivel=false; //No está en la pantalla de Niveles
      }else{
        background(255);
          for(int cx = 0; cx < 5; cx++) {
            stroke(255);
            fill(205,67,52);
        
            rect(x, y, w,h);
            x=x+240;
          }
       
         
      }
    
    }else{ //Si no se encuentra en la pantalla de niveles
      n.traerMapa(); //muestra el mapa del nivel elegido
    }
  }
  
  //carga los niveles dependiendo el usuario
  public int cargarProgreso(){     //
    return 1;
  }
  
  
  //guarda el nivel enel usuario
  public void guardarProgreso(){  //
    
  }
  
  
  
  
}
