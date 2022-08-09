import traer.physics.*;

Bola bola;
ParticleSystem mundoVirtual;
PImage base;
PImage background;
PFont font;

Particle[][] arrayDeParticulas;
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
  
  
  arrayDeParticulas = new Particle[cantidadDeParticulasPorLado][cantidadDeParticulasPorLado];
  float pasoEnX = (float) ((width / 8) / cantidadDeParticulasPorLado);
  float pasoEnY = (float) ((height / 8) / cantidadDeParticulasPorLado);
  
  for (int i = 0; i < cantidadDeParticulasPorLado; i++) {
    for (int j = 0; j < cantidadDeParticulasPorLado; j++) {
      arrayDeParticulas[i][j] = mundoVirtual.makeParticle(0.2, (width/8 * 2) + j * pasoEnX, 10 + i * pasoEnY, 0.0); // ( float mass, float x, float y, float z )
      if (j > 0) mundoVirtual.makeSpring(arrayDeParticulas[i][j - 1], arrayDeParticulas[i][j], durezaDeResortes, elasticidadDeResortes, pasoEnX);
    }
  }
  for (int j = 0; j < cantidadDeParticulasPorLado; j++){
    for (int i = 1; i < cantidadDeParticulasPorLado; i++){
      mundoVirtual.makeSpring(arrayDeParticulas[i - 1][j], arrayDeParticulas[i][j], durezaDeResortes, elasticidadDeResortes, pasoEnY);
    }
  }  
  arrayDeParticulas[0][0].makeFixed();
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
    text("change cloth color", width/2, height/2);
  
  
  fill(#1d1a21, 150); // color morado oscuro
  for (int j = 0; j < cantidadDeParticulasPorLado-1; j++) {
    for (int i = 0; i < cantidadDeParticulasPorLado-1; i++) {
      beginShape();
      vertex(arrayDeParticulas[i][j].position().x(), arrayDeParticulas[i][j].position().y());
      vertex(arrayDeParticulas[i+1][j].position().x(), arrayDeParticulas[i+1][j].position().y());
      vertex(arrayDeParticulas[i+1][j+1].position().x(), arrayDeParticulas[i+1][j+1].position().y());
      vertex(arrayDeParticulas[i][j+1].position().x(), arrayDeParticulas[i][j+1].position().y());
      vertex(arrayDeParticulas[i][j].position().x(), arrayDeParticulas[i][j].position().y());
      endShape();
    }
  }
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
