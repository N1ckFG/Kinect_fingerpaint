import processing.opengl.*;

//--  GLOBALS  --
boolean useOsc = true;
boolean debug = false;

int sW = 640;
int sH = 480;
int fps = 60;
//--
float lPosX = sW/2;
float lPosY = sH/2;
float rPosX = sW/2;
float rPosY = sH/2;
float getDist = 0;
int range = 200;
int dotSize = 20;
float clicked = 0;
//--


//--  CORE  --
void setup() {
  size(sW,sH,OPENGL);
  frameRate(fps);
  smooth();
  if(useOsc) {
    oscSetup();
  }
}

//--

void draw() {
  background(0);
  if(useOsc) {
    if(hitDetect(lPosX,lPosY,range,range,rPosX,rPosY,range,range)){
    clicked = 1;
    }else{
      clicked = 0;
    }
    oscSend();
  }
  if(debug){
  strokeWeight(2);
  stroke(127,127,0,abs(255-((getDist/width)*255)));
  line(rPosX,rPosY,lPosX,lPosY);
  getDist = dist(rPosX,rPosY,lPosX,lPosY);
  println("dist: " + getDist);
  fill(127,127,0,0.5*abs(255-((getDist/width)*255)));
  noStroke();
  ellipse(rPosX,rPosY,range,range);
  ellipse(lPosX,lPosY,range,range);
  strokeWeight(dotSize);
  stroke(255,0,0);
  point(rPosX,rPosY);
  stroke(0,255,0);
  point(lPosX,lPosY);
  }
}

//--  END  --

