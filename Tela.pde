class Tela {
 
  Particle[][] arrayDeParticulas; // un array de dos dimensiones que contiene las partículas
  int cantidadDeParticulasPorLado;
  float durezaDeResortes;
  float elasticidadDeResortes;

  public Tela(ParticleSystem mundoVirtual, int cantidad) {
  
    cantidadDeParticulasPorLado = cantidad;
    durezaDeResortes = 0.18;
    elasticidadDeResortes = 0.1;
    
    arrayDeParticulas = new Particle[cantidadDeParticulasPorLado][cantidadDeParticulasPorLado];
    float pasoEnX = ((width / 2) / cantidadDeParticulasPorLado-(cantidadDeParticulasPorLado/4));
    float pasoEnY = ((height / 2) / cantidadDeParticulasPorLado-(cantidadDeParticulasPorLado/4));
      
    // making particles & horizontal springs
    for (int i = 0; i < cantidadDeParticulasPorLado; i++) {
      for (int j = 0; j < cantidadDeParticulasPorLado; j++) {
        arrayDeParticulas[i][j] = mundoVirtual.makeParticle(0.25, + j * pasoEnX-(width/19), (i * pasoEnY)-height/17, 0.0); // ( float mass, float x, float y, float z )
        if (j > 0) mundoVirtual.makeSpring(arrayDeParticulas[i][j - 1], arrayDeParticulas[i][j], durezaDeResortes, elasticidadDeResortes, pasoEnX);
      }
    }
    // making vertical springs
    for (int j = 0; j < cantidadDeParticulasPorLado; j++){
      for (int i = 1; i < cantidadDeParticulasPorLado; i++){
        mundoVirtual.makeSpring(arrayDeParticulas[i - 1][j], arrayDeParticulas[i][j], durezaDeResortes, elasticidadDeResortes, pasoEnY);
      }
    }
  
    arrayDeParticulas[20][20].makeFixed(); //centro
    arrayDeParticulas[20][16].makeFixed(); 
    arrayDeParticulas[20][24].makeFixed(); 
    arrayDeParticulas[16][20].makeFixed(); 
    arrayDeParticulas[24][20].makeFixed();
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
        fill(#00000, 40);
      
        if (i==0 | i==20 | j==0 | j==20 | j==38 | i==38){ //bordes
          beginShape();
          vertex(arrayDeParticulas[i][j].position().x(), arrayDeParticulas[i][j].position().y());
          vertex(arrayDeParticulas[i+1][j].position().x(), arrayDeParticulas[i+1][j].position().y());
          vertex(arrayDeParticulas[i+1][j+1].position().x(), arrayDeParticulas[i+1][j+1].position().y());
          vertex(arrayDeParticulas[i][j+1].position().x(), arrayDeParticulas[i][j+1].position().y());
          vertex(arrayDeParticulas[i][j].position().x(), arrayDeParticulas[i][j].position().y());
          fill(#ffffff, 250);
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
          fill(#ffffff,200);
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
          fill(#ffffff,200);
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
          fill(#ffffff,200);
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
          fill(#ffffff,200);
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
          fill(#ffffff,200);
        }      
      }    
    }
  }
}
//=======
//import traer.physics.*;

//class Tela {
 
//Particle[][] arrayDeParticulas; // un array de dos dimensiones que contiene las partículas
//int cantidadDeParticulasPorLado = 40;
//ParticleSystem mundoVirtual;

//float durezaDeResortes;
//float elasticidadDeResortes;

//float pasoEnX;
//float pasoEnY;

//public Tela(ParticleSystem mundoVirtual, int cantidad) {
      
      
  
//     cantidadDeParticulasPorLado = cantidad;

//     durezaDeResortes = 0.18;
//     elasticidadDeResortes = 0.15;

//     // creando el ambiente virtual de la simulación
//     mundoVirtual = new ParticleSystem(0.02, 0.0001);

//     arrayDeParticulas = new Particle[cantidadDeParticulasPorLado][cantidadDeParticulasPorLado];
//     pasoEnX = (float) ((width / 2) / cantidadDeParticulasPorLado+5);
//     pasoEnY = (float) (((height / 2) / cantidadDeParticulasPorLado));
  
//  // making particles & horizontal springs
//  for (int i = 0; i < cantidadDeParticulasPorLado; i++) {
//    for (int j = 0; j < cantidadDeParticulasPorLado; j++) {
//      arrayDeParticulas[i][j] = mundoVirtual.makeParticle(0.25, (width/4) + j * pasoEnX, 20 + i * pasoEnY, 0.0); // ( float mass, float x, float y, float z )
//      if (j > 0) mundoVirtual.makeSpring(arrayDeParticulas[i][j - 1], arrayDeParticulas[i][j], durezaDeResortes, elasticidadDeResortes, pasoEnX);
//    }
//  }
//  // making vertical springs
//  for (int j = 0; j < cantidadDeParticulasPorLado; j++){
//    for (int i = 1; i < cantidadDeParticulasPorLado; i++){
//      mundoVirtual.makeSpring(arrayDeParticulas[i - 1][j], arrayDeParticulas[i][j], durezaDeResortes, elasticidadDeResortes, pasoEnY);
//    }
//  }
  
   
//   arrayDeParticulas[20][20].makeFixed(); //centro
//    arrayDeParticulas[20][16].makeFixed(); 
//    arrayDeParticulas[20][24].makeFixed(); 
    
//    arrayDeParticulas[16][20].makeFixed(); 
//    arrayDeParticulas[24][20].makeFixed();
//}

//    void dibujar() {
//      //mundoVirtual.tick();
//      noStroke();
      
//      fill(#666666, 150); // color celeste
//  for (int j = 0; j < cantidadDeParticulasPorLado-1; j++) {
//    for (int i = 0; i < cantidadDeParticulasPorLado-1; i++) {
//      beginShape();
//      vertex(arrayDeParticulas[i][j].position().x(), arrayDeParticulas[i][j].position().y());
//      vertex(arrayDeParticulas[i+1][j].position().x(), arrayDeParticulas[i+1][j].position().y());
//      vertex(arrayDeParticulas[i+1][j+1].position().x(), arrayDeParticulas[i+1][j+1].position().y());
//      vertex(arrayDeParticulas[i][j+1].position().x(), arrayDeParticulas[i][j+1].position().y());
//      vertex(arrayDeParticulas[i][j].position().x(), arrayDeParticulas[i][j].position().y());
//      endShape();
//      fill(#ffffff, 40);
      
      
      
//      if (i==0 | i==20 | j==0 | j==20 | j==38 | i==38){ //bordes
//      beginShape();
//      vertex(arrayDeParticulas[i][j].position().x(), arrayDeParticulas[i][j].position().y());
//      vertex(arrayDeParticulas[i+1][j].position().x(), arrayDeParticulas[i+1][j].position().y());
//      vertex(arrayDeParticulas[i+1][j+1].position().x(), arrayDeParticulas[i+1][j+1].position().y());
//      vertex(arrayDeParticulas[i][j+1].position().x(), arrayDeParticulas[i][j+1].position().y());
//      vertex(arrayDeParticulas[i][j].position().x(), arrayDeParticulas[i][j].position().y());
//      fill(#79FE0C, 250);
//      endShape();
      
//      //fill(#0a2ac9, 200);
//      }
//      if ( i > 8  && i < 12 && j > 8  && 12 > j ){ //1quad
//       //beginShape();
//      vertex(arrayDeParticulas[i][j].position().x(), arrayDeParticulas[i][j].position().y());
//      vertex(arrayDeParticulas[i+1][j].position().x(), arrayDeParticulas[i+1][j].position().y());
//      vertex(arrayDeParticulas[i+1][j+1].position().x(), arrayDeParticulas[i+1][j+1].position().y());
//      vertex(arrayDeParticulas[i][j+1].position().x(), arrayDeParticulas[i][j+1].position().y());
//      vertex(arrayDeParticulas[i][j].position().x(), arrayDeParticulas[i][j].position().y());
//      //if (j==10 || i<2){
      
//     endShape();
//      fill(#ffffff,200);
//      }
      
//      else if (i > 28  && i < 32 && j > 28  && 32 > j){
//       beginShape();
//      vertex(arrayDeParticulas[i][j].position().x(), arrayDeParticulas[i][j].position().y());
//      vertex(arrayDeParticulas[i+1][j].position().x(), arrayDeParticulas[i+1][j].position().y());
//      vertex(arrayDeParticulas[i+1][j+1].position().x(), arrayDeParticulas[i+1][j+1].position().y());
//      vertex(arrayDeParticulas[i][j+1].position().x(), arrayDeParticulas[i][j+1].position().y());
//      vertex(arrayDeParticulas[i][j].position().x(), arrayDeParticulas[i][j].position().y());
//      //if (j==10 || i<2){
      
//     endShape();
//      fill(#ffffff,200);
//      }
      
//      else if (i > 8  && i < 12 && j > 28  && 32 > j){
//       beginShape();
//      vertex(arrayDeParticulas[i][j].position().x(), arrayDeParticulas[i][j].position().y());
//      vertex(arrayDeParticulas[i+1][j].position().x(), arrayDeParticulas[i+1][j].position().y());
//      vertex(arrayDeParticulas[i+1][j+1].position().x(), arrayDeParticulas[i+1][j+1].position().y());
//      vertex(arrayDeParticulas[i][j+1].position().x(), arrayDeParticulas[i][j+1].position().y());
//      vertex(arrayDeParticulas[i][j].position().x(), arrayDeParticulas[i][j].position().y());
//      //if (j==10 || i<2){
      
//     endShape();
//      fill(#ffffff,200);
//      }
     
//     else if (i > 28  && i < 32 && j > 8  && 12 > j){
//       beginShape();
//      vertex(arrayDeParticulas[i][j].position().x(), arrayDeParticulas[i][j].position().y());
//      vertex(arrayDeParticulas[i+1][j].position().x(), arrayDeParticulas[i+1][j].position().y());
//      vertex(arrayDeParticulas[i+1][j+1].position().x(), arrayDeParticulas[i+1][j+1].position().y());
//      vertex(arrayDeParticulas[i][j+1].position().x(), arrayDeParticulas[i][j+1].position().y());
//      vertex(arrayDeParticulas[i][j].position().x(), arrayDeParticulas[i][j].position().y());
//      //if (j==10 || i<2){
      
//     endShape();
//      fill(#ffffff,200);
//      }
      
//      else if (i > 14  && i < 26 && j > 14  && 26 > j){
//       beginShape();
//      vertex(arrayDeParticulas[i][j].position().x(), arrayDeParticulas[i][j].position().y());
//      vertex(arrayDeParticulas[i+1][j].position().x(), arrayDeParticulas[i+1][j].position().y());
//      vertex(arrayDeParticulas[i+1][j+1].position().x(), arrayDeParticulas[i+1][j+1].position().y());
//      vertex(arrayDeParticulas[i][j+1].position().x(), arrayDeParticulas[i][j+1].position().y());
//      vertex(arrayDeParticulas[i][j].position().x(), arrayDeParticulas[i][j].position().y());
//      //if (j==10 || i<2){
      
//     endShape();
//      fill(#ffffff,200);
//      }
      
      
      
      
      
//    }
      
//   }
//  }
//}
    
//>>>>>>> Stashed changes:Telas.pde
