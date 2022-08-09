import traer.physics.*;
import processing.sound.*;

SoundFile song;
Bola bola;

ParticleSystem mundoVirtual;
PImage base;
PImage background;
PFont font;

int cantidadDeParticulasPorLado = 30;
float durezaDeResortes = 0.2;
float elasticidadDeResortes = 0.1;

void setup() {
  
  fullScreen();
  smooth();
  ellipseMode(CENTER);
  noCursor();
  
  mundoVirtual = new ParticleSystem(0.01, 0.0001);
  bola = new Bola(mundoVirtual, width/8, 3*height/4, width/64, color(0));

  base =loadImage("baseb.png");
  background =loadImage("background.png");
  
  font = createFont("AvenirLTStd-Light.otf", width/40);
  textFont(font);
  
  song = new SoundFile(this, "intothesea.mp3");
  song.loop();
  
}

void draw() {

  mundoVirtual.tick();
  background(255);
  image(background, 0, 0, width, height);
  image(base, 0, height-196);
  bola.dibujar();
  bola.handleBoundaryCollisions();
  noStroke();
  
  //if tela no cambia de color;
    textSize(width/40);
    textAlign(CENTER);
    fill(225);
    text("turn them red", width/2, height/2);  
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
