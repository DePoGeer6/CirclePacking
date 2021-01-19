Circle c;

ArrayList<Circle> circles;
ArrayList<PVector> spots;

PImage img;

void setup() {
  size(1500, 800);
  spots = new ArrayList<PVector>();
  img = loadImage("2021.jpg");
  img.loadPixels();
  for(int x = 0; x < img.width; x++) {
    for(int y = 0; y < img.height; y++) {
      int index = x + y * img.width;
      color c = img.pixels[index];
      float b = brightness(c);
      if(b < 220){
        spots.add(new PVector(x,y));
      }
    }
  }
  circles = new ArrayList<Circle>();
}

void draw() {
  background(0);
  //frameRate(5);
  int total = 10;
  int count = 0;
  int attempts = 0;
  
  while(count < total){
    Circle newCircle = newCircle();
    if(newCircle != null) {
      circles.add(newCircle);
      count++;
    }
    attempts++;
    if(attempts > 1000){
      noLoop();
      println("DONEZO");
      break;
    }
  }
  
  for(Circle c : circles) {
    if(c.growing){
      if(c.edges()) {
        c.growing = false;
      } else {
        for(Circle other: circles) {
          if(c != other){
            float d = dist(c.x, c.y, other.x, other.y);
            if(d - 2 < c.r + other.r) {
              c.growing = false;
              break;
            }
          }
        }
      }
    }
    c.show();
    c.grow();
  }
}

Circle newCircle() {
  
  int rand = int(random(0, spots.size()));
  PVector spot = spots.get(rand);
  float x = spot.x;
  float y = spot.y;
  
  boolean valid = true;
  for(Circle c : circles) {
    float d = dist(x, y, c.x, c.y);
    if(d < c.r+5) {
      valid = false;
      break;
    }
  }
  
  if(valid){
    return new Circle(x, y);
  } else {return null;}
}
