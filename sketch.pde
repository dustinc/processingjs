
// globals
Ball[] balls;

int ind = 0;

float x = 400;
float y = 150;
float pos = 0;


// main setup
void setup() {

  size(800, 800);

  frameRate(60);

  balls = new Ball[ind];

}


// main draw
void draw() {

  background(0);


  fill(255);
  noStroke();

  // circle clockwise
  //pos = pos + .005;
  //x = (height / 2) + Math.sin(pos * 2 * Math.PI) * 0.9 * 50;
  //y = (height / 2) - Math.cos(pos * 2 * Math.PI) * 0.9 * 50;
  //ellipse(x, y, 10, 10);

  if(ind > 0) {
    for(int i = 1; i <= ind; i++) {
      balls[i].update();
    }
  }


}

void mouseClicked() {

  if(mouseButton == LEFT) {
    balls[++ind] = new Ball(mouseX, mouseY);
  }

}

void mouseDragged() {
  //println('pmx' + pmouseX + '  mx ' + mouseX);
  if(abs(mouseX - pmouseX) > 10 || abs(mouseY - pmouseY) > 15) {
    balls[++ind] = new Ball(mouseX, mouseY);
  }
}



class Ball {

  float xpos, ypos, xstart, ystart, speed, esize, spawnSize, startSpeed;

  Ball(float bx, float by) {
    xpos = xstart = bx;
    ypos = ystart = by;
    speed = startSpeed = 4.0;
    esize = spawnSize = 20;
  }


  void update() {
    speed += 0.055;
    ypos = (ypos - speed);

    xpos = xstart + Math.sin(speed * 2 * Math.PI) * (0.9 / (speed*1.2)) * 20;

    spawnSize = spawnSize - 0.75;

    if(spawnSize < 10) {
      spawnSize = 10;
    }

    if(ypos < 0) {
      xpos = xstart;
      ypos = ystart;
      spawnSize = esize;
      speed = startSpeed;
    }

    this.draw();

  }

  void draw() {
    stroke(255);
    noFill()
    ellipse(xstart, ystart, spawnSize, spawnSize);
    noStroke()
    fill(255);
    ellipse(xpos, ypos, esize, esize);
  }

}
