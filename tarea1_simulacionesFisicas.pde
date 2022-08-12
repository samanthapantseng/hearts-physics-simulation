/* Tecnológico de Costa Rica
   Escuela de Diseño Industrial
   D7 Visual - Tarea 1 Simulaciones físicas
   Valeria Navarro - 2018254437
   Samantha Pan Tseng  - 2019065194
   Elke Segura Badilla - 2018086696
   Valeria Leslie Serrano - 
*/

import traer.physics.*;
import processing.sound.*;

SoundFile song;
SoundFile sfxTela;

Bola bola;

Tela tela1, tela3, tela5;

TelaSmall tela2, tela4;

Corazon cora1, cora2, cora3, cora4, cora5;

ParticleSystem mundoVirtual;

PImage base;
PImage background;
PFont font;

color clrNegro;
color clrBlanco;

void setup() {
  
  fullScreen();
  smooth();
  ellipseMode(CENTER);
  noCursor();
  colorMode(HSB, 400);
  
  mundoVirtual = new ParticleSystem(0.02, 0.001);
  
  bola = new Bola(mundoVirtual, width/8, 3*height/4, width/64, color(#FFFFFF, 99));
  mouseX = width/2;
  mouseY = 2*height/3;  
  
  tela1 = new Tela (mundoVirtual, 70, width*1/6, height/16);
  tela2 = new TelaSmall (mundoVirtual, 40, width*2/6, height*2/16);
  tela3 = new Tela (mundoVirtual, 70, width*3/6, height/16);
  tela4 = new TelaSmall (mundoVirtual, 40, width*4/6, height*2/16);
  tela5 = new Tela (mundoVirtual, 70, width*5/6, height/16);
  
  cora1 = new Corazon (width*1/6, height/10);
  cora2 = new Corazon (width*2/6, height/8);
  cora3 = new Corazon (width*3/6, height/10);
  cora4 = new Corazon (width*4/6, height/8);
  cora5 = new Corazon (width*5/6, height/10);  
  
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
  
  sfxTela = new SoundFile(this, "sfxTela.mp3");
  
  clrNegro = color(#222222);
  clrBlanco = color(#ffffff);
}

void draw() {
    
  mundoVirtual.tick();
  
  image(background, 0, 0);

  // averiguar si la bola toca el corazon de la tela
  
   if (bola.meToco(cora1.getX(), cora1.getY()) == true) {
    tela1.setColor(#ffffff);
    sfxTela.play(); 
  }
  
  if (bola.meToco(cora2.getX(), cora2.getY()) == true) {
    tela2.setColor(#ffffff);
    sfxTela.play(); 
  }
  
  if (bola.meToco(cora3.getX(), cora3.getY()) == true) {
    tela3.setColor(#ffffff);
    sfxTela.play(); 
  }
  
   if (bola.meToco(cora4.getX(), cora4.getY()) == true) {
    tela4.setColor(#ffffff);
    sfxTela.play(); 
  }
  
   if (bola.meToco(cora5.getX(), cora5.getY()) == true) {
    tela5.setColor(#ffffff);
    sfxTela.play(); 
  }
  
  tela1.dibujar();
  tela2.dibujar();
  tela3.dibujar();
  tela4.dibujar();
  tela5.dibujar();
  
  cora1.dibujar();
  cora2.dibujar();
  cora3.dibujar();
  cora4.dibujar();
  cora5.dibujar();
    
  bola.particle.position().set(mouseX, mouseY, 0 );
  bola.dibujar();
  
  noStroke();
  
  // escribir instrucciones mientras hayan telas negras
  
  if (tela1.getColor() == clrNegro ){
    textSize(width/64);
    textAlign(CENTER);
    fill(#FFFFFF, 80);
    text("touch their hearts", width/2, 4*height/5); 
  }
  
  if (tela2.getColor() == clrNegro ){
    textSize(width/64);
    textAlign(CENTER);
    fill(#FFFFFF, 80);
    text("touch their hearts", width/2, 4*height/5); 
  }
  
  if (tela3.getColor() == clrNegro ){
    textSize(width/64);
    textAlign(CENTER);
    fill(#FFFFFF, 80);
    text("touch their hearts", width/2, 4*height/5); 
  }
  
  if (tela4.getColor() == clrNegro ){
    textSize(width/64);
    textAlign(CENTER);
    fill(#FFFFFF, 80);
    text("touch their hearts", width/2, 4*height/5); 
  }
  
  if (tela5.getColor() == clrNegro ){
    textSize(width/64);
    textAlign(CENTER);
    fill(#FFFFFF, 80);
    text("touch their hearts", width/2, 4*height/5); 
  }
  
  if (tela1.getColor() == clrBlanco ){
    if (tela2.getColor() == clrBlanco ){
      if (tela3.getColor() == clrBlanco ){
        if (tela4.getColor() == clrBlanco ){
          if (tela5.getColor() == clrBlanco ){
            textSize(width/64);
            textAlign(CENTER);
            fill(#FFFFFF, 150);
            text("click [R] to restart", width/2, 4*height/5); 
          }
        }
      }
    }
  }
}

void keyPressed(){    
    if (key == 'R') {
    }
}
  
void keyReleased() {
  tela1.setColor(clrNegro);
  tela2.setColor(clrNegro);
  tela3.setColor(clrNegro);
  tela4.setColor(clrNegro);
  tela5.setColor(clrNegro);
}
