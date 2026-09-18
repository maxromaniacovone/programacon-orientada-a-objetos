ArrayList<Cuadrado> tubos;
Pelota bird;
float ultimoPar = 0;
PVector G = new PVector(0, 0.4);
void setup() {
  size(800, 600);
  tubos = new ArrayList<Cuadrado>();
  bird = new Pelota(100, height / 2);
}
void draw() {
  background(150);
  Agregartubos();
  bird.addFuerza(G);
  bird.mover();
  borrartubos();
  for (Cuadrado t : tubos) {
    t.mover();
    t.mostrar();
    if (bird.choca(t)) {
      exit();
    }
  }
  fill(100);
  noStroke();
  rect(0, height - 20, width, 20);
  bird.mostrar();
}
void keyPressed() {
  if (key == ' ') {
    bird.saltar();
  }
}
void borrartubos() {
  for (int i = tubos.size() - 1; i >= 0; i--) {
    Cuadrado Aux = tubos.get(i);
    if (Aux.pos.x + Aux.ancho < 0) {
      tubos.remove(i);
    }
  }
}
void Agregartubos() {
  float tActual = millis();
  float dt = tActual - ultimoPar;
  if (dt > 2500) {
    float gap = 140;
    float altoTop = random(50, height - gap - 50);
    float altoBottom = height - altoTop - gap;
    tubos.add(new Cuadrado(width, 0, 60, altoTop));
    tubos.add(new Cuadrado(width, height - altoBottom, 60, altoBottom));
    ultimoPar = tActual;
  }
}
class Cuadrado {
  PVector pos;
  float ancho, largo;
  float vel = 3;
  Cuadrado(float x, float y, float w, float h) {
    pos = new PVector(x, y);
    ancho = w;
    largo = h;
  }
  void mover() {
    pos.x -= vel;
  }
  void mostrar() {
    fill(0, 200, 100);
    stroke(255);
    rect(pos.x, pos.y, ancho, largo);
  }
}
class Pelota {
  PVector pos;
  PVector vel;
  PVector acc;
  float tamano = 30;
  Pelota(float x, float y) {
    pos = new PVector(x, y);
    vel = new PVector(0, 0);
    acc = new PVector(0, 0);
  }
  void addFuerza(PVector fuerza) {
    acc.add(fuerza);
  }
  void saltar() {
    vel.y = -8;
  }
  void mover() {
    vel.add(acc);
    pos.add(vel);
    acc.mult(0);
    if (pos.y < tamano / 2) {
      pos.y = tamano / 2;
      vel.y = 0;
    }
    if (pos.y + tamano / 2 > height - 20) {
      pos.y = height - 20 - tamano / 2;
      vel.y = 0;
    }
  }
  boolean choca(Cuadrado tubo) {
    return pos.x + tamano / 2 > tubo.pos.x &&
           pos.x - tamano / 2 < tubo.pos.x + tubo.ancho &&
           pos.y + tamano / 2 > tubo.pos.y &&
           pos.y - tamano / 2 < tubo.pos.y + tubo.largo;
  }
  void mostrar() {
    fill(255, 255, 0);
    noStroke();
    ellipse(pos.x, pos.y, tamano, tamano);
  }
}
