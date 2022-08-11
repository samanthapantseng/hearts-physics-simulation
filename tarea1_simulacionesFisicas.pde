import traer.physics.*;
import processing.sound.*;

SoundFile song;
Bola bola;
Tela tela1;
Tela2 tela2;
Tela3 tela3;
Tela4 tela4;
Tela5 tela5;



ParticleSystem mundoVirtual;
PImage base;
PImage background;
PFont font;

void setup() {
  
  fullScreen();
  smooth();
  ellipseMode(CENTER);
  noCursor();
  colorMode(HSB, 400);
  
  mundoVirtual = new ParticleSystem(0.02, 0.001);
  bola = new Bola(mundoVirtual, width/8, 3*height/4, width/64, color(0));
  
  tela1 = new Tela (mundoVirtual, 40);
  tela2 = new Tela2 (mundoVirtual, 40);
  tela3 = new Tela3 (mundoVirtual, 40);
  tela4 = new Tela4 (mundoVirtual, 40);
  tela5 = new Tela5 (mundoVirtual, 40);
  
  //base =loadImage("baseb.png");
  background =loadImage("background.png");
  
  font = createFont("AvenirLTStd-Light.otf", width/40);
  textFont(font);
  
  song = new SoundFile(this, "intothesea.mp3");
  song.loop();
  
}

void draw() {
    
  mundoVirtual.tick();
  
  background(255);
  //image(background, 0, 0, width, height);
  //image(base, 0, height-196);
  tela1.dibujar();
  tela2.dibujar();
  tela3.dibujar();
  tela4.dibujar();
  tela5.dibujar();
  
  
  bola.dibujar();
  bola.handleBoundaryCollisions();
  noStroke();
  
  beginShape();
      vertex(width/2-width/2.08, height-200);
      vertex(width/2+width/2.08, height-200);
      vertex(width/2+width/2.08, height-180);
      vertex(width/2-width/2.08, height-180);
      //vertex(width/4, height-200);
      fill(#4C3B43);
      noStroke();
      endShape(CLOSE);

  beginShape();
      vertex(width/2-width/2.2, height-180);
      vertex(width/2+width/2.2, height-180);
      vertex(width/2+width/2.5, height);
      vertex(width/2-width/2.5, height);
     // vertex(width/2-400, height-180);
      fill(#604B54);
      noStroke();
      endShape(CLOSE);
      
       beginShape();
      vertex(width/2-width/2.2, height-180);
      vertex(width/2+width/2.2, height-180);
      vertex(width/2+width*0.445, height-150);
      vertex(width/2-width*0.445, height-150);
     // vertex(width/2-400, height-180);
      fill(#111111,30);
      noStroke();
      endShape(CLOSE);
  
  
    
  
  
  
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
