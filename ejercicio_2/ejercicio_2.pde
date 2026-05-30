Movil[][] estacionamiento;

void setup() {
  size(800, 600);

  estacionamiento = new Movil[2][3];

  for (int fila = 0; fila < 2; fila++) {
    for (int columna = 0; columna < 3; columna++) {
      estacionamiento[fila][columna] = new Movil(fila, columna);
    }
  }
}

void draw() {
  background(156,255);

  stroke(0);

  for (int i = 1; i < 3; i++) {
    line(i * width/3, 0, i * width/3, height);
  }

  for (int i = 1; i < 2; i++) {
    line(0, i * height/2, width, i * height/2);
  }

  for (int fila = 0; fila < 2; fila++) {
    for (int columna = 0; columna < 3; columna++) {
      estacionamiento[fila][columna].mostrar();
    }
  }
}

class Movil {

  int fila;
  int columna;

  Movil(int f, int c) {
    fila = f;
    columna = c;
  }

  void mostrar() {
    float anchoCelda = width / 3.0;
    float altoCelda = height / 2.0;

    float x = columna * anchoCelda + anchoCelda / 2;
    float y = fila * altoCelda + altoCelda / 2;

    fill(0, 255, 0);
    ellipse(x, y, 50, 50);
  }
}
