int cant = 20;
float[] barras;

void setup() {
  size(800, 600);
  barras = new float[cant];
}

void draw() {
  background(255);
  float ancho = width / cant;
  for (int i = 0; i < cant; i++) {
    float x = i * ancho;

    fill(0);
    rect(x, height - barras[i], ancho, barras[i]);
  }
  int i = int(mouseX / (width / cant));

  if (i >= 0 && i < cant) {
    barras[i] = height - mouseY;
    barras[i] = constrain(barras[i], 0, height);
  }
}

LABERINTO
int filas = 10;
int cols = 10;
boolean[][][] laberinto; 

void setup() {
  size(800, 600);
  laberinto = new boolean[filas][cols][6];
  iniciarLaberinto();
}

void draw() {
  background(255);
  dLaberinto();
}
void iniciarLaberinto() {
  for (int i = 0; i < filas; i++) {
    for (int j = 0; j < cols; j++) {
      for (int k = 0; k < 6; k++) {
        laberinto[i][j][k] = random(1) > 0.5;
      }
    }
  }
}
void dLaberinto() {

  float w = width / cols;
  float h = height / filas;

  for (int i = 0; i < filas; i++) {
    for (int j = 0; j < cols; j++) {

      float x = j * w;
      float y = i * h;

      if (laberinto[i][j][0]) line(x, y, x + w, y);           
      if (laberinto[i][j][1]) line(x, y + h, x + w, y + h);   
      if (laberinto[i][j][2]) line(x, y, x, y + h);           
      if (laberinto[i][j][3]) line(x + w, y, x + w, y + h);   

      if (laberinto[i][j][4]) line(x, y, x + w, y + h);
      if (laberinto[i][j][5]) line(x + w, y, x, y + h);
    }
  }
}
