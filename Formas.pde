void setup() {
  size(800, 600);
}

void draw() {
  background(#34F5E3); 

  dibujarSuelo();
  dibujarCasa(width*0.4, height*0.5);
  dibujarSol(width*0.85, height*0.15);
}

// piso
void dibujarSuelo() {
  fill(#35EA2D);
  rect(0, height*0.75, width, height*0.25);
}

// casa
void dibujarCasa(float x, float y) {
  float ancho = width*0.2;
  float alto = height*0.25;

  // base
  fill(#759374);
  rect(x, y, ancho, alto);

  // techo 
  stroke(#5A5A5A);
  line(x, y, x + ancho/2, y - alto*0.5);
  line(x + ancho, y, x + ancho/2, y - alto*0.5);

  // puerta
  fill(#3B0C0B);
  rect(x + ancho*0.4, y + alto*0.5, ancho*0.2, alto*0.5);

  // ventana
  fill(255);
  rect(x + ancho*0.1, y + alto*0.2, ancho*0.2, alto*0.2);
}

// sol
void dibujarSol(float x, float y) {
  fill(255, 204, 0);
  noStroke();
  ellipse(x, y, width*0.1, width*0.1);
}
