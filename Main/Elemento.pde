public class Elemento {
  PImage image;
  float center_x, center_y;
  float change_x, change_y;
  float w, h;
  
  public Elemento(String filename, float scale, float x, float y){
    image = loadImage(filename);
    w = image.width * scale;
    h = image.height * scale;
    center_x = x;
    center_y = y;
    change_x = 0;
    change_y = 0;
  }
  
  //llamar dibujo con posicion
  public Elemento(PImage img, float scale){
    image = img;
    w = image.width * scale;
    h = image.height * scale;
    center_x = 0;
    center_y = 0;
    change_x = 0;
    change_y = 0;
  }
  
  public Elemento(String filename, float scale){
    this(filename, scale, 0, 0);
  }
  
  //dibujar
  public void dibujar(){
     image(image, center_x, center_y, w, h); 
  }
  
  //interactuar
  public void interactuar(){
     
  }
  
  //mover
  public void mover(){
     center_x += change_x;
     center_y += change_y;
  }
  
  
}
