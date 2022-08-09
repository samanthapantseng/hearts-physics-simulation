class TelaEsquina {

  Particle[][] arrayDeParticulas;
  
  int cantidadDeParticulasPorLado = 16;
  float durezaDeResortes = 0.1;
  float elasticidadDeResortes = 0.1;
  float pasoEnX = (width/16) / cantidadDeParticulasPorLado;
  float pasoEnY = (height / 2) / cantidadDeParticulasPorLado;
  color clr = #689DBC;
  
  public TelaEsquina(ParticleSystem mundoVirtual) {
    
    arrayDeParticulas = new Particle[cantidadDeParticulasPorLado][cantidadDeParticulasPorLado];
  
    for (int i = 0; i < cantidadDeParticulasPorLado; i++) {
      for (int j = 0; j < cantidadDeParticulasPorLado; j++) {
        arrayDeParticulas[i][j] = mundoVirtual.makeParticle(0.2, width/64 + j * pasoEnX, i * pasoEnY, 0); // ( float mass, float x, float y, float z )
        if (j > 0) mundoVirtual.makeSpring(arrayDeParticulas[i][j - 1], arrayDeParticulas[i][j], durezaDeResortes, elasticidadDeResortes, pasoEnX);
      }
    }
    
    for (int j = 0; j < cantidadDeParticulasPorLado; j++){
      for (int i = 1; i < cantidadDeParticulasPorLado; i++){
        mundoVirtual.makeSpring(arrayDeParticulas[i - 1][j], arrayDeParticulas[i][j], durezaDeResortes, elasticidadDeResortes, pasoEnY);
      }
    }
    
    arrayDeParticulas[0][0].makeFixed();
    arrayDeParticulas[0][cantidadDeParticulasPorLado - 1].makeFixed();
    
  }
  
  void dibujar() {
  
    noFill();
    stroke(clr);
      // dibuja las líneas horizontales  
    for (int i = 0; i < cantidadDeParticulasPorLado; i++) {
      beginShape();
      curveVertex(arrayDeParticulas[i][0].position().x(), arrayDeParticulas[i][0].position().y());
      for (int j = 0; j < cantidadDeParticulasPorLado; j++) {
        curveVertex(arrayDeParticulas[i][j].position().x(), arrayDeParticulas[i][j].position().y());
      }
      curveVertex(arrayDeParticulas[i][cantidadDeParticulasPorLado - 1].position().x(), arrayDeParticulas[i][cantidadDeParticulasPorLado - 1].position().y());
      endShape();
    } // end for
    
    // dibuja las líneas verticales
    for (int j = 0; j < cantidadDeParticulasPorLado; j++) {
      beginShape();
      curveVertex(arrayDeParticulas[0][j].position().x(), arrayDeParticulas[0][j].position().y());
      for (int i = 0; i < cantidadDeParticulasPorLado; i++) {
        curveVertex(arrayDeParticulas[i][j].position().x(), arrayDeParticulas[i][j].position().y());
      }
      curveVertex(arrayDeParticulas[cantidadDeParticulasPorLado - 1][j].position().x(), arrayDeParticulas[cantidadDeParticulasPorLado - 1][j].position().y());
      endShape();
    } // end for
  }
}
