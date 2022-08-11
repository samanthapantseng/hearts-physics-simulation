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
  
  bola = new Bola(mundoVirtual, width/8, 3*height/4, width/64, color(#FFFFFF, 95));
  mouseX = width/2;
  mouseY = 2*height/3;  
  
  tela1 = new Tela (mundoVirtual, 70);
  tela2 = new Tela2 (mundoVirtual, 40);
  tela3 = new Tela3 (mundoVirtual, 70);
  tela4 = new Tela4 (mundoVirtual, 40);
  tela5 = new Tela5 (mundoVirtual, 70);
  
  tela1.repulsion(mundoVirtual, bola);  
  tela2.repulsion(mundoVirtual, bola); 
  tela3.repulsion(mundoVirtual, bola); 
  tela4.repulsion(mundoVirtual, bola); 
  tela5.repulsion(mundoVirtual, bola);   
  
  background =loadImage("background.png");  
  background.resize(width, height);
  
  font = createFont("AvenirLTStd-Light.otf", width/40);
  textFont(font);
  
  song = new SoundFile(this, "intothesea.mp3");
  song.loop();  
  
}

void draw() {
    
  mundoVirtual.tick();
  
  image(background, 0, 0);
  tela1.dibujar();
  tela2.dibujar();
  tela3.dibujar();
  tela4.dibujar();
  tela5.dibujar();
  
  bola.particle.position().set(mouseX, mouseY, 0 );
  bola.dibujar();
  
  noStroke();
  
// instrucciones
    textSize(width/64);
    textAlign(CENTER);
    fill(#FFFFFF, 80);
    text("touch their hearts", width/2, 3*height/5);  
    
// base que no está en uso porque la bola ya no rebota, sino que flota

  //beginShape();
  //    vertex(width/2-width/2.08, height-200);
  //    vertex(width/2+width/2.08, height-200);
  //    vertex(width/2+width/2.08, height-180);
  //    vertex(width/2-width/2.08, height-180);
  //    //vertex(width/4, height-200);
  //    fill(#201D24);
  //    noStroke();
  //    endShape(CLOSE);

  //beginShape();
  //    vertex(width/2-width/2.2, height-180);
  //    vertex(width/2+width/2.2, height-180);
  //    vertex(width/2+width/2.5, height);
  //    vertex(width/2-width/2.5, height);
  //   // vertex(width/2-400, height-180);
  //    fill(#221F27);
  //    noStroke();
  //    endShape(CLOSE);
      
  //beginShape();
  //    vertex(width/2-width/2.2, height-180);
  //    vertex(width/2+width/2.2, height-180);
  //    vertex(width/2+width*0.445, height-150);
  //    vertex(width/2-width*0.445, height-150);
  //   // vertex(width/2-400, height-180);
  //    fill(#221F27,30);
  //    noStroke();
  //    endShape(CLOSE);
}
