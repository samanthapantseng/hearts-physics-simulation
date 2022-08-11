class Bola {

  Particle particle;
  
  float radio;
  color clr;
  
  public Bola(ParticleSystem mundoVirtual, float _x, float _y, float _radio, color _clr) {
    
    particle = mundoVirtual.makeParticle(0.01, _x, _y, 0 ); 
    radio = _radio;
    clr = _clr;
    particle.makeFixed();
  }
  
  void dibujar() {
    noStroke();
    fill(clr);
    ellipse(particle.position().x(), particle.position().y(), radio, radio);    
  }
}
