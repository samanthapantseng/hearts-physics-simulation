class Tela5 {
 
  Particle[][] arrayDeParticulas; // un array de dos dimensiones que contiene las partículas
  int cantidadDeParticulasPorLado;
  float durezaDeResortes;
  float elasticidadDeResortes;
  color clr;

  public Tela5(ParticleSystem mundoVirtual, int cantidad) {
  
    cantidadDeParticulasPorLado = cantidad;
    durezaDeResortes = 0.18;
    elasticidadDeResortes = 0.1;
    clr = color(0,0,14);
    
    arrayDeParticulas = new Particle[cantidadDeParticulasPorLado][cantidadDeParticulasPorLado];
    float pasoEnX = ((width/4) / cantidadDeParticulasPorLado);
    float pasoEnY = ((height/4) / cantidadDeParticulasPorLado);
      
    // making particles & horizontal springs
    for (int i = 0; i < cantidadDeParticulasPorLado; i++) {
      for (int j = 0; j < cantidadDeParticulasPorLado; j++) {
        arrayDeParticulas[i][j] = mundoVirtual.makeParticle(0.25, (j * pasoEnX)-((cantidadDeParticulasPorLado/2)*pasoEnX)+width*5/6, 1*height/16+(i * pasoEnY)-((cantidadDeParticulasPorLado/2)*pasoEnY), 0.0);  // ( float mass, float x, float y, float z )
        if (j > 0) mundoVirtual.makeSpring(arrayDeParticulas[i][j - 1], arrayDeParticulas[i][j], durezaDeResortes, elasticidadDeResortes, pasoEnX);
      }
    }
    // making vertical springs
    for (int j = 0; j < cantidadDeParticulasPorLado; j++){
      for (int i = 1; i < cantidadDeParticulasPorLado; i++){
        mundoVirtual.makeSpring(arrayDeParticulas[i - 1][j], arrayDeParticulas[i][j], durezaDeResortes, elasticidadDeResortes, pasoEnY);
      }
    }
  
    arrayDeParticulas[30][30].makeFixed(); //centro
    arrayDeParticulas[30][24].makeFixed(); // arriba
    arrayDeParticulas[30][36].makeFixed(); //abajo
    
    arrayDeParticulas[24][30].makeFixed(); //derecha
    arrayDeParticulas[36][30].makeFixed();//izq
  }

  void dibujar() {
    noStroke();
      
    fill(#666666, 150); // color celeste
    for (int j = 0; j < cantidadDeParticulasPorLado-1; j++) {
      for (int i = 0; i < cantidadDeParticulasPorLado-1; i++) {
        beginShape();
        vertex(arrayDeParticulas[i][j].position().x(), arrayDeParticulas[i][j].position().y());
        vertex(arrayDeParticulas[i+1][j].position().x(), arrayDeParticulas[i+1][j].position().y());
        vertex(arrayDeParticulas[i+1][j+1].position().x(), arrayDeParticulas[i+1][j+1].position().y());
        vertex(arrayDeParticulas[i][j+1].position().x(), arrayDeParticulas[i][j+1].position().y());
        vertex(arrayDeParticulas[i][j].position().x(), arrayDeParticulas[i][j].position().y());
        endShape();
         fill(clr, 200);
      
        if (i==0 | i==20 | j==0 | j==20 | j==38 | i==38){ //bordes
          beginShape();
          vertex(arrayDeParticulas[i][j].position().x(), arrayDeParticulas[i][j].position().y());
          vertex(arrayDeParticulas[i+1][j].position().x(), arrayDeParticulas[i+1][j].position().y());
          vertex(arrayDeParticulas[i+1][j+1].position().x(), arrayDeParticulas[i+1][j+1].position().y());
          vertex(arrayDeParticulas[i][j+1].position().x(), arrayDeParticulas[i][j+1].position().y());
          vertex(arrayDeParticulas[i][j].position().x(), arrayDeParticulas[i][j].position().y());
          fill(clr, 250);
          endShape();
        }
      
        if ( i > 8  && i < 12 && j > 8  && 12 > j ){ //1quad
          //beginShape();
          vertex(arrayDeParticulas[i][j].position().x(), arrayDeParticulas[i][j].position().y());
          vertex(arrayDeParticulas[i+1][j].position().x(), arrayDeParticulas[i+1][j].position().y());
          vertex(arrayDeParticulas[i+1][j+1].position().x(), arrayDeParticulas[i+1][j+1].position().y());
          vertex(arrayDeParticulas[i][j+1].position().x(), arrayDeParticulas[i][j+1].position().y());
          vertex(arrayDeParticulas[i][j].position().x(), arrayDeParticulas[i][j].position().y());
          endShape();
          fill(clr,200);
        }
      
        else if (i > 28  && i < 32 && j > 28  && 32 > j){
          beginShape();
          vertex(arrayDeParticulas[i][j].position().x(), arrayDeParticulas[i][j].position().y());
          vertex(arrayDeParticulas[i+1][j].position().x(), arrayDeParticulas[i+1][j].position().y());
          vertex(arrayDeParticulas[i+1][j+1].position().x(), arrayDeParticulas[i+1][j+1].position().y());
          vertex(arrayDeParticulas[i][j+1].position().x(), arrayDeParticulas[i][j+1].position().y());
          vertex(arrayDeParticulas[i][j].position().x(), arrayDeParticulas[i][j].position().y());
          //if (j==10 || i<2){      
          endShape();
          fill(clr,200);
        }
      
        else if (i > 8  && i < 12 && j > 28  && 32 > j){
          beginShape();
          vertex(arrayDeParticulas[i][j].position().x(), arrayDeParticulas[i][j].position().y());
          vertex(arrayDeParticulas[i+1][j].position().x(), arrayDeParticulas[i+1][j].position().y());
          vertex(arrayDeParticulas[i+1][j+1].position().x(), arrayDeParticulas[i+1][j+1].position().y());
          vertex(arrayDeParticulas[i][j+1].position().x(), arrayDeParticulas[i][j+1].position().y());
          vertex(arrayDeParticulas[i][j].position().x(), arrayDeParticulas[i][j].position().y());
          //if (j==10 || i<2){          
          endShape();
          fill(clr,200);
        }
       
        else if (i > 28  && i < 32 && j > 8  && 12 > j){
          beginShape();
          vertex(arrayDeParticulas[i][j].position().x(), arrayDeParticulas[i][j].position().y());
          vertex(arrayDeParticulas[i+1][j].position().x(), arrayDeParticulas[i+1][j].position().y());
          vertex(arrayDeParticulas[i+1][j+1].position().x(), arrayDeParticulas[i+1][j+1].position().y());
          vertex(arrayDeParticulas[i][j+1].position().x(), arrayDeParticulas[i][j+1].position().y());
          vertex(arrayDeParticulas[i][j].position().x(), arrayDeParticulas[i][j].position().y());
          //if (j==10 || i<2){          
          endShape();
          fill(clr,200);
        }
      
        else if (i > 14  && i < 26 && j > 14  && 26 > j){
          beginShape();
          vertex(arrayDeParticulas[i][j].position().x(), arrayDeParticulas[i][j].position().y());
          vertex(arrayDeParticulas[i+1][j].position().x(), arrayDeParticulas[i+1][j].position().y());
          vertex(arrayDeParticulas[i+1][j+1].position().x(), arrayDeParticulas[i+1][j+1].position().y());
          vertex(arrayDeParticulas[i][j+1].position().x(), arrayDeParticulas[i][j+1].position().y());
          vertex(arrayDeParticulas[i][j].position().x(), arrayDeParticulas[i][j].position().y());
          //if (j==10 || i<2){          
          endShape();
          fill(clr,200);
        }      
      }    
    }
  }

    void repulsion(ParticleSystem mundoVirtual, Bola bola) {
    
    for (int j = 0; j < cantidadDeParticulasPorLado-1; j++) {
      for (int i = 0; i < cantidadDeParticulasPorLado-1; i++) {
        mundoVirtual.makeAttraction(arrayDeParticulas[i][j], bola.particle, -200000, 30);    
      }
    }
  }
}
