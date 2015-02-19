PImage img, main_img;
boolean enable_draw = true;

void setup() {
  size(1024, 500);
  img = loadImage("data/icon.png");
  main_img = loadImage("data/icon.png");
  main_img.resize(400, 400);
  background(0);
  
  colorMode(HSB, 360, 100, 100);
}

void draw() {
  if (enable_draw == false) return;

  fill(0, 0, 0, 5);
  noStroke();
  rect(0, 0, width, height);

  for (int i = 0; i < 10; ++i) {
    float x = random(-img.height, width + img.width);
    float y = random(-img.height, height + img.height);

    float s = random(0.5);

    pushMatrix();
    translate(x, y);
    scale(s, s);
    tint(frameCount % 360, 20, 70, 180);
    image(img, 0, 0);
    popMatrix();
  }

  tint(255, 255);
  image(main_img, width/2 - main_img.width/2, height/2 - main_img.height/2 - main_img.height / 30);
}

void keyPressed() {
  switch(key) {
  case ' ':
    enable_draw = !enable_draw;
    break;
  }
}

