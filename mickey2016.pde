import processing.video.*;
import gab.opencv.*;
import java.awt.Rectangle;
import drop.*;

PImage hat;
int hatW = 300;
int hatH = 300;

PImage loadedhat1;
PImage loadedhat2;
PImage loadedhat3;
PImage loadedhat4;
PImage loadedhat5;
PImage loadedhat6;

PImage defhat1;
PImage defhat2;
PImage defhat3;
PImage defhat4;
PImage defhat5;
PImage defhat6;

PImage hat1;
PImage hat2;
PImage hat3;
PImage hat4;
PImage hat5;
PImage hat6;

PImage button1;
PImage button2;
PImage button3;
PImage button4;
PImage button5;
PImage button6;

PImage gearimg;
PImage arrowimg;

MyDropListener drop1;
MyDropListener drop2;
MyDropListener drop3;
MyDropListener drop4;
MyDropListener drop5;
MyDropListener drop6;

MyDropListener[] droparr;

PImage[] hatimages;
PImage[] buttons;
PImage[] loadedhatimages;

Hat[] allthehats;

int hover;

float scalingFactorW = 2.5;
float scalingFactorH = 1.65;

int videoW = 320;
int videoH = 240;
int viddispW = 800;
int viddispH = 600;

int offsetX = (width/2) - (videoW/2);
int offsetY = (height/2) - (videoH/2);

//button locations
int fromleft = 100;
int fromright = 100;
int col2;
int col;
int fromtop = 80;
int rowspacing = 50;
int buttonW = 150;
int buttonH = 105;
int state = 1;

int hatnum = 6;

boolean even;
int half;

Capture video;

OpenCV opencv;

SDrop drop;

// array to hold all of the positions of the found faces
Rectangle[] hats = {};

void setup(){
  size(1400, 800);
  background(255);
  drop = new SDrop(this);
  droparr = new MyDropListener[] {drop1, drop2, drop3, drop4, drop5, drop6};
  
    // load in our PImages
    defhat1 = loadImage("assets/hat1.png");
    defhat2 = loadImage("assets/hat2.png");
    defhat3 = loadImage("assets/hat3.png");
    defhat4 = loadImage("assets/hat4.png");
    defhat5 = loadImage("assets/hat5.png");
    defhat6 = loadImage("assets/hat6.png");
    
    hat1 = defhat1;
    hat2 = defhat2;
    hat3 = defhat3;
    hat4 = defhat4;
    hat5 = defhat5;
    hat6 = defhat6;
    
    button1 = loadImage("assets/button1.png");
    button2 = loadImage("assets/button2.png");
    button3 = loadImage("assets/button3.png");
    button4 = loadImage("assets/button4.png");
    button5 = loadImage("assets/button5.png");
    button6 = loadImage("assets/button6.png");
    
    buttons = new PImage[] { button1, button2, button3, button4, button5, button6 };
    
    if(ifExists("loadedhat1.png")){
      hat1 = loadImage("loadedhat1.png");
    }
    if(ifExists("loadedhat2.png")){
      hat2 = loadImage("loadedhat2.png");
    }
    if(ifExists("loadedhat3.png")){
      hat3 = loadImage("loadedhat3.png");
    }
    if(ifExists("loadedhat4.png")){
      hat4 = loadImage("loadedhat5.png");
    }
    if(ifExists("loadedhat5.png")){
      hat5 = loadImage("loadedhat5.png");
    }
    if(ifExists("loadedhat6.png")){
      hat6 = loadImage("loadedhat6.png");
    }

    gearimg = loadImage("assets/gear.png");
    arrowimg = loadImage("assets/arrow.png");
    
    gearimg.resize(50,50);
    arrowimg.resize(50,50);

    hat = hat1;
    
    col2 = width - fromright - buttonW;
    col = fromleft;
    
    loadedhatimages = new PImage[6];
    hatimages = new PImage[] { hat1, hat2, hat3, hat4, hat5, hat6};
    
    
    if(hatnum % 2 == 0){
      even = true;
      half = hatnum/2;
    } else {
      even = false;
      half = ((int)hatnum/2) + 1;
    }
    
    allthehats = new Hat[hatnum];
    
    for(int i = 0; i < hatnum; i++) {
      Hat temp = new Hat(i);
      allthehats[i] = temp;
    }
    
  //Face Detection
 
  String[] cameras = Capture.list();

  // no camera objects - no need to continue!  
  if (cameras.length == 0) 
  {
    println("There are no cameras available for capture.");
    exit();
  } 
  else 
  {
    // create a video object
    video = new Capture(this, videoW, videoH);
    video.start();

    // create our open CV object and tell it to monitor the video stream
    opencv = new OpenCV(this, video);

    // tell open CV to begin looking for faces
    opencv.loadCascade(OpenCV.CASCADE_FRONTALFACE);  

  }
}

boolean ifExists(String path) {
  
  File f = new File(sketchPath(path));
  println(f);
  if (f.exists())
  {
    return true;
  } else {
    return false;
  }
}

void deleteFile(String path){
  
  File f = new File(sketchPath(path));
  
  if (f.exists())
  {
    f.delete();
  }   
}

void setState(int s)
{
  state = s;
}

void resetHats() {
   hat1 = defhat1; 
   deleteFile("loadedhat1.png");
   allthehats[0].image = hat1;
   hat2 = defhat2; 
   allthehats[1].image = hat2;
   deleteFile("loadedhat2.png");
   hat3 = defhat3; 
   allthehats[2].image = hat3;
   deleteFile("loadedhat3.png");
   hat4 = defhat4; 
   allthehats[3].image = hat4;
   deleteFile("loadedhat4.png");
   hat5 = defhat5; 
   allthehats[4].image = hat5;
   deleteFile("loadedhat5.png");
   hat6 = defhat6;
   allthehats[5].image = hat6;
   deleteFile("loadedhat6.png");
   hat = hat1;
}

void draw(){
  
  if( state == 1) {
    state1();
  } else if (state == 2) {
    state2();
  }
  
  
  
}

void exit() {
  for(int i = 0; i < loadedhatimages.length; i++) {
    int savenum = i+1;
   if(loadedhatimages[i] != null) {
     hat.save(savePath("loadedhat"+savenum+".png"));
   }  
  }
  super.exit();
} 