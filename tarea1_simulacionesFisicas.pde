import traer.physics.*;

Bola bola;
ParticleSystem mundoVirtual;
PImage base;

void setup() {
  
  //fullScreen();
  size (1920,1080);
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
  image(base, 0, height-200);
  bola.dibujar();
  bola.handleBoundaryCollisions();
  
  

  
}
