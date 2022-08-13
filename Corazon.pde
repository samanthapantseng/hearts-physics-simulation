class Corazon {
  
  float pX;
  float pY;

  public Corazon(float _x, float _y) {
    pX = _x;
    pY = _y;
  }
  
  void dibujar() {
    
    fill(#ffffff,0);
    circle(pX,pY,50);    
  }
  
  //métodos para retornar la posición
   
  float getX() {
  return pX;
  }
 
  float getY() {
  return pY;
  }
}
