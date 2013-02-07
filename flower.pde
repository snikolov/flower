void setup() {
  size(800, 800, P3D);  
}

void draw() {
  // Generate random random seeds, or specify ones that you like.
  int seedDefault = 17472;//int(random(100000));
  int seedNoise = 66260;//int(random(100000));
  randomSeed(seedDefault);
  noiseSeed(seedNoise);
  
  background(255);
  smooth();
  stroke(0, 60);
  noFill();
  //fill(255, 200);
  float randTranslate = 290;
 
  /*
  translate(width/5, height/5, 0);
  for (int i = 0; i < 5; i += 1) {
    for (int j = 0; j < 5; j += 1) {
      float lscale = 1/72.0; //(2.3 + (cos(PI * i / 20)))/72.0;
      translate(275 * j, 0, 0);
      drawFlower(lscale);
      translate(-275 * j, 0, 0);
      //translate(random(randTranslate) - randTranslate / 2, random(randTranslate) - randTranslate / 2, 0);
    }
    translate(0, 275, 0);
  }
  */
  
  translate(width/2, height/2);

  // Take a random walk through the canvas and draw a "flower" at each location.
  int numPieces = 10;
  float lscale = 1/32.0;
  for (int i = 0; i < numPieces; i += 1) {
    drawFlower(lscale);
    float dx = random(randTranslate) - randTranslate / 2;
    float dy = random(randTranslate) - randTranslate / 2;
    translate(-dx, -dy, 0);
  }
  
  save("flowers_" + height + "_" + width + "_" + seedDefault + "_" + seedNoise + "_" + randTranslate + "_" + 1/lscale + "_" + numPieces + ".png");
  exit();
}

/* Adapted from Generative Art: A Practical Guide Using Processing
 * (http://www.manning.com/pearson/), Listing i.1
 */
void drawFlower(float lscale) {
  float xstart = random(10);
  float ynoise = random(10);
  float ylim = height * lscale;
  float xlim = width * lscale;
  for (float y = -ylim; y <= ylim; y += lscale * 16.0) {
    ynoise += 0.02;
    float xnoise = xstart;
    for (float x = -xlim; x <= xlim; x += lscale * 16.0) {
      xnoise += 0.02;
      drawPoint(x, y, noise(xnoise, ynoise));
    }
  }
}

/* Taken from Generative Art: A Practical Guide Using Processing
 * (http://www.manning.com/pearson/), Listing i.1
 */
void drawPoint(float x, float y, float noiseFactor) {
  pushMatrix();
  translate(x * noiseFactor * 4, y * noiseFactor * 4, -y);
  float edgeSize = noiseFactor * 15;
  ellipse(0, 0, edgeSize, edgeSize);
  popMatrix();
}

