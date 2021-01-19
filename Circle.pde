class Circle {
  float x;
  float y;
  float r;
  
  boolean growing = true;
  
  Circle(float x, float y) {
    this.x = x;
    this.y = y;
    this.r = 5;
  }
  
  void grow() {
    if(growing){
      r++;
    }
  }
  
  boolean edges() {
    return(x+r>width || x-r<0 || y+r>height || y-r<0);
  }
  
  void show() {
    stroke(255);
    strokeWeight(2);
    noFill();
    ellipse(x, y, r*2, r*2);
  }

}
