class Bola {

  Particle particle;
  
  float radio;
  color clr;
  float pX, pY;
  
  public Bola(ParticleSystem mundoVirtual, float _x, float _y, float _radio, color _clr) {
    
    pX= _x;
    pY= _y;
    particle = mundoVirtual.makeParticle(0.01, pX, pY, 0); 
    radio = _radio;
    clr = _clr;
    
    particle.makeFixed();
    
  }
  
  void dibujar() {
    noStroke();
    fill(clr);
    ellipse(particle.position().x(), particle.position().y(), radio, radio);    
  }
  
  //métodos para conocer la posición de la partícula y averiguar si choca con otro objeto
  
  float getX() {
    return particle.position().x();
  }
 
  float getY() {
    return particle.position().y();
  }
 
  boolean meToco(float _x, float _y) {
    if (dist(_x, _y, particle.position().x(), particle.position().y()) < 50) {
      return true;
    }
      return false;
  }
}
