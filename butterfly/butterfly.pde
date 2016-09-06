void setup(){
  size(500, 500);
  smooth();
  background(50);
  frameRate(5000);
}

void draw(){
  // frameCount works as time
  // width and height works as time periods
  float periodX = width;
  float periodY = height;
  float t = frameCount;
  
  // float waveY = saw(t, periodY, 0);
  //float waveX = 40 * sin(t, periodX, 0) * quarterSin(t, periodY + 50, 0);
  //float waveY = 20 * sin(t, periodY, PI / 2) + saw(t, periodY + 50, 0) * 3 / 5;
   
  float waveX = 100 * sin(t, periodX, 0) * (exp(sin(t, periodX, PI / 2)) - 2 * sin(4 * t, periodX, PI / 2) - pow(sin(t / 12, periodX, 0), 5));
  float waveY = 100 * sin(t, periodY, PI / 2) * (exp(sin(t, periodY, PI / 2)) - 2 * sin(4 * t, periodY, PI / 2) - pow(sin(t / 12, periodY, 0), 5));

  int posY = int(0.5 * waveY);
  int posX = int(0.5 * waveX);
  // addition to center the plot
  drawPoint(int(posX + width * 0.5), int(posY + height * 0.4));
}

void drawPoint(int x, int y){
  // Draw a point at (x, y)
  noStroke();
  fill(255);
  ellipse(x, y, 1, 1);
}

// Wave functions
// --------------

float saw(float t, float period, float phase){
  // Sawtooth wave
  return ((t % period) + phase);
}

float sin(float t, float period, float phase){
  // Sinusoidal wave
  return sin((2 * PI * t / period) + phase);
}

float quarterSin(float t, float period, float phase){
  // Only last quarter
  if ((t % period) > (period * 1 / 4)){
    return 0.001;
  }
  else{
    return sin(t, period, phase);
  }
}
