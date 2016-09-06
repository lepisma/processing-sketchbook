 
float theta;
int l = 50;
float upperMultLim = pow((2 / l), 1 / 33);

void setup() {
  size(900, 400);
  background(50);
  frameRate(10);
  strokeCap(ROUND);
}

void draw(){
  
  theta = radians(60);
  pushMatrix();
  translate(0, height);
  
  int n = 15;
  int count = 0;
  int diff = width / n;
  while(count < (n - 1)){
//    stroke(random(1) * 255, random(1) * 255, random(1) * 255);
    stroke(255);
    translate(diff, 0);
    branch(l);
    count++;
  }
  popMatrix();
  
  if(frameCount % 1 == 0){
    noStroke();
    fill(50, 50, 50, 50);
    rect(0, 0, width, height);
  }
}

void branch(float h) {
  h *= random(0.4, upperMultLim);
  
  if (h > 2) {
    pushMatrix();    
    rotate(theta * random(1));  
    line(0, 0, 0, -h);  
    translate(0, -h);
    branch(h); 
    popMatrix();
    
    pushMatrix();
    rotate(-theta * random(1));
    line(0, 0, 0, -h);
    translate(0, -h);
    branch(h);
    popMatrix();
  }
}
