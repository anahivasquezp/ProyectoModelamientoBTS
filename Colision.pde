public class Colision{
  private Mapa mapa;
  
  public Colision(Mapa mapa) {
        this.mapa = mapa;
  }
  
  public ArrayList<Elemento> colisionar(Elemento e){
      ArrayList<Elemento> colisonados = new ArrayList<Elemento>();
      
      for (Elemento elemento : mapa.obtenerElementos()) {
        if(!(elemento == e )){
          if(verificarColision(e, elemento)){
              colisonados.add(elemento);
          }
        }
      }
      
      return colisonados;
  }
  
  //Devuelve true si hay colisión y false si no existe colisión
  public boolean verificarColision(Elemento e1, Elemento e2){
      boolean sinColisionX = (e1.obtenerMargen()[1] <= e2.obtenerMargen()[0]) 
              || (e1.obtenerMargen()[0] >= e2.obtenerMargen()[1]);
      boolean sinColisionY = (e1.obtenerMargen()[2] >= e2.obtenerMargen()[3]) 
              || (e1.obtenerMargen()[3] <= e2.obtenerMargen()[2]);
      
      return !(sinColisionX || sinColisionY);
  }
}
