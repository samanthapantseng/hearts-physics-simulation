import traer.physics.*;

Bola bola;
ParticleSystem mundoVirtual;
PImage base;

void setup() {
  
  fullScreen();
  smooth();
  ellipseMode(CENTER);
  noCursor();
  
  mundoVirtual = new ParticleSystem(0.01, 0.0001);
  bola = new Bola(mundoVirtual, width/8, 3*height/4, width/64, color(0));
  
  base =loadImage("baseb.png");
}

void draw() {

  mundoVirtual.tick();
  background(255);
  image(base, 0, height-196);
  bola.dibujar();
  bola.handleBoundaryCollisions();
}

void keyPressed(){
  
  if (key == ' ') {
    bola.particle.velocity().set(bola.particle.velocity().x(), -30, 0 );
  }
  
  if (key == CODED) {
    if (keyCode == RIGHT) {
        bola.particle.velocity().set(5, bola.particle.velocity().y(), 0 );
    }
    
    else if (keyCode == LEFT) {
        bola.particle.velocity().set(-5, bola.particle.velocity().y(), 0 );
    }
    
    else if (keyCode == UP) {
        bola.particle.velocity().set(bola.particle.velocity().x(), -30, 0);
    }
  }
}
