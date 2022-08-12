class TelaSmall {
 
  Particle[][] arrayDeParticulas; // matriz que contiene particulas
  int cantidadDeParticulasPorLado;
  float durezaDeResortes;
  float elasticidadDeResortes;
  color clr;

  public TelaSmall(ParticleSystem mundoVirtual, int cantidad, float _naceX, float _naceY) {
  
    cantidadDeParticulasPorLado = cantidad;
    durezaDeResortes = 0.18;
    elasticidadDeResortes = 0.1;
    clr = color(#222222);

    // aca se definen en el constructor donde va a nacer la matriz
    float naceX = _naceX;
    float naceY = _naceY;    
    
    arrayDeParticulas = new Particle[cantidadDeParticulasPorLado][cantidadDeParticulasPorLado];
    float pasoEnX = (width/4) / cantidadDeParticulasPorLado;
    float pasoEnY = (height/4) / cantidadDeParticulasPorLado;
      
    // making particles & horizontal springs
    for (int i = 0; i < cantidadDeParticulasPorLado; i++) {
      for (int j = 0; j < cantidadDeParticulasPorLado; j++) {
        arrayDeParticulas[i][j] = mundoVirtual.makeParticle(0.25, (j * pasoEnX)-((cantidadDeParticulasPorLado/2)*pasoEnX)
        + naceX, naceY +(i * pasoEnY)-((cantidadDeParticulasPorLado/2)*pasoEnY), 0.0);  // ( float mass, float x, float y, float z )
        if (j > 0) mundoVirtual.makeSpring(arrayDeParticulas[i][j - 1], arrayDeParticulas[i][j], durezaDeResortes, elasticidadDeResortes, pasoEnX);
      }
    }
    // making vertical springs
    for (int j = 0; j < cantidadDeParticulasPorLado; j++){
      for (int i = 1; i < cantidadDeParticulasPorLado; i++){
        mundoVirtual.makeSpring(arrayDeParticulas[i - 1][j], arrayDeParticulas[i][j], durezaDeResortes, elasticidadDeResortes, pasoEnY);
      }
    }
    
    // acá se encuentran los valores que diferencian ambas telas
    arrayDeParticulas[20][20].makeFixed();
    arrayDeParticulas[20][16].makeFixed(); 
    arrayDeParticulas[20][24].makeFixed(); 
    arrayDeParticulas[16][20].makeFixed(); 
    arrayDeParticulas[24][20].makeFixed();
  }
  
  void setColor(color _clr) {
     clr = _clr;
   }

  void dibujar() {
    noStroke();
      
    fill(#666666, 150);
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
          endShape();
          fill(clr,200);
        }      
      }    
    }
  }

   color getColor(){
    return clr;
  }
  
    void repulsion(ParticleSystem mundoVirtual, Bola bola) {
    
    for (int j = 0; j < cantidadDeParticulasPorLado-1; j++) {
      for (int i = 0; i < cantidadDeParticulasPorLado-1; i++) {
        mundoVirtual.makeAttraction(arrayDeParticulas[i][j], bola.particle, -200000, 30);    
      }
    }
  }
}
      
