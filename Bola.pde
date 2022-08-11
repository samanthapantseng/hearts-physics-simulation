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
  
  void handleBoundaryCollisions(){
  
    if ( particle.position().x() < 0 || particle.position().x() > width )
      particle.velocity().set( -0.9*particle.velocity().x(), particle.velocity().y(), 0 );
    if ( particle.position().y() < 0 || particle.position().y() > height-196-width/64 )
      particle.velocity().set( particle.velocity().x(), -0.9*particle.velocity().y(), 0 );
    particle.position().set( constrain( particle.position().x(), 0, width ), constrain( particle.position().y(), 0, height-196-width/64), 0 ); 
  }  
}
