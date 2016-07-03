void setup() {
  size(900, 400);
  background(13, 16, 21);
  fill(255, 255, 255);
  stroke(255, 255, 255);

  PFont thick = createFont("BebasNeue Bold.otf", 80);
  textSize(80);
  textFont(thick);
  pushMatrix();
  translate(width, height);
  scale(-1, 1);
  textAlign(CENTER, CENTER);
  text("radiohead", (width / 2) , -(height / 2));
  popMatrix();
  randomSeed(1234);

  // Bad practice
  int count = 50;
    for (int i = 0; i < count; i++) {
     pushMatrix();
     translate(i * (width / count), height + 20);
     rotate(PI);
     rotate(random(- PI / 2, PI / 2));
     drawBranch(random(5, 12), random(100, 300));
     popMatrix();
    }
}

void draw() {
}

void drawBranch(float wid, float len) {
  // Call transform and rotate before this

  if (wid < 5) {
    // Finish it off
    triangle(-wid / 2, 0, wid / 2, 0, 0, len);
  }
  else {
    // Break at this much fraction of length
    float breakFraction = random(0.1, 0.6);
    float rotationAngle = random(- PI / 4, PI / 4);

    float x3 = len * (1 - breakFraction) / (tan(rotationAngle) - (2 * len / wid));
    float y3 = (tan(rotationAngle) * x3) + (breakFraction * len);
    PVector p3 = new PVector(x3, y3);

    float x4 = len * (1 - breakFraction) / (tan(rotationAngle) + (2 * len / wid));
    float y4 = (tan(rotationAngle) * x4) + (breakFraction * len);
    PVector p4 = new PVector(x4, y4);

    PVector center = PVector.add(p3, p4).div(2);
    // Actually draw the quad
    quad(-wid / 2, 0, wid / 2, 0, p4.x, p4.y, p3.x, p3.y);

    // Set systems for next quad
    translate(center.x, center.y);
    rotate(rotationAngle);
    drawBranch(PVector.dist(p3, p4), len * (1 - breakFraction));
  }
}
