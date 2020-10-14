float s1x = 0;      
float s1y = 0;
float s1w = 50;     
float s1h = 50;
Button start_button;
int Scene = 0;
int [] xCar = new int[6];
int [] yCar = new int[6];
int [] xTruck = new int[5];
int [] yTruck = new int[5];
int score = 0;
PImage arrow;
PImage Car;
PImage Monke;
PImage truck;
import ddf.minim.*;
import ddf.minim.effects.*;
int wCar = 200;
int hCar = 100;
int wTruck = 400;
int hTruck = 200;
Minim minim;
AudioPlayer Start;
AudioPlayer Scream;
void setup() {
  size(800, 750);
   minim = new Minim(this);
  Start = minim.loadFile("Start.mp3", 2048);
Scream = minim.loadFile("Pain.mp3",2048);

  noStroke();
  arrow = loadImage("Arrow.png");
  Monke = loadImage("Monke.png");
  Car = loadImage("EL CARO.png");
  truck = loadImage("TRUCO.png");
  start_button = new Button("Start", 20, 20, 500, 50);
  //Car spawning
  for (int i=0; i < 6; i++) { 
    xCar[i] = (int)random(600, 800);

    yCar[i] = (int)random(0, 800);
  }
  //Truck spawning
  for (int i=0; i < 5; i++) { 
    xTruck[i] = (int)random(600, 800);

    yTruck[i] = (int)random(0, 800);
  }
}


void draw() {
  {
    
    if (Scene==0)
    {
      
      if (start_button.MouseIsOver()) {
        
        arrow.resize(60, 40);
        image(arrow, 650, 300);
      } else {

        background(41, 157, 244);
      }

      start_button.Draw();
 }

    if (Scene==1)
    {
      score+=1;
      background(50, 210, 86);
      fill(50);
      textSize(32);
      text("Score", 50, 25);
      text(score, 150, 25);
     
      for (int i=0; i < 6; i++)
      { 
        image(Car,xCar[i], yCar[i], wCar, hCar);
        xCar[i] = xCar[i] - 15;
      }
      for (int i=0; i < 5; i++)
      { 
        image(truck,xTruck[i], yTruck[i], wTruck, hTruck);
        xTruck[i] = xTruck[i] - 7;
      }

      for (int i = 0; i < 6; i++) {

        if (xCar[i] < 35) {
          xCar[i] = 1000;
        }
      }
      for (int i = 0; i < 5; i++) {

        if (xTruck[i] < 35) {
          xTruck[i] = 1000;
        }
      }

     
      s1x = mouseX;
      s1y = mouseY;

 
      for (int i = 0; i < 6; i++) {
        boolean hit = rectRect(s1x, s1y, s1w, s1h, xCar[i], yCar[i], wCar, hCar);
        if (hit) {
          Scream.play();
          Scene = 2;
        }
      }
      for (int i = 0; i < 5; i++) {
        boolean hit = rectRect(s1x, s1y, s1w, s1h, xTruck[i], yTruck[i], wTruck, hTruck);
        if (hit) {
          Scream.play();
          Scene = 2;
        }
      }
      

      // draw the other square
      fill(0, 150);
      image(Monke,s1x, s1y, s1w, s1h);
    }
    if (Scene==2)
    {
      textSize(30);
      background(240, 21, 54);
      text("Final Score:",150,50);
      
      text(score,270,50);
      textSize(60);
      text("You Died",450,300);
    }
  }
}

// RECTANGLE/RECTANGLE
boolean rectRect(float r1x, float r1y, float r1w, float r1h, float r2x, float r2y, float r2w, float r2h) {

  // are the sides of one rectangle touching the other?

  if (r1x + r1w >= r2x &&    // r1 right edge past r2 left
    r1x <= r2x + r2w &&    // r1 left edge past r2 right
    r1y + r1h >= r2y &&    // r1 top edge past r2 bottom
    r1y <= r2y + r2h) {    // r1 bottom edge past r2 top
    return true;
  }
  return false;
}
void mousePressed()
{
  if (start_button.MouseIsOver()) {
    Scene = 1;
  }
}
