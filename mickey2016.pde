import processing.video.*;
import gab.opencv.*;
import java.awt.Rectangle;
import drop.*;
import ddf.minim.*;

//sound
Minim minim;
AudioPlayer picture;

//video
Capture video;
OpenCV opencv;

//sdrop
SDrop drop;

// LOAD ALL THE IMAGES

//current hats
PImage hat;
PImage hat1;
PImage hat2;
PImage hat3;
PImage hat4;
PImage hat5;
PImage hat6;

//user loaded hat
PImage loadedhat1;
PImage loadedhat2;
PImage loadedhat3;
PImage loadedhat4;
PImage loadedhat5;
PImage loadedhat6;

//default hats
PImage defhat1;
PImage defhat2;
PImage defhat3;
PImage defhat4;
PImage defhat5;
PImage defhat6;

//button images for default hats
PImage button1;
PImage button2;
PImage button3;
PImage button4;
PImage button5;
PImage button6;

//customhats and buttons
PImage customhat1;
PImage customhat2;
PImage customhat3;
PImage customhat4;
PImage customhat5;
PImage customhat6;


//icons
PImage gearimg;
PImage arrowimg;
PImage cameraimg;

//frame and backgrounds
PImage settingsbackground;
PImage frame;
PImage customframe;
PImage customsettings;
PImage defframe;
PImage defsettings;

//DEFAULT VALUES

int second = second();
int minute = minute();
int hour = hour();
int day = day();
int month = month();
int year = year();

boolean customhats = false;

boolean keypressed = false;

float scalingFactorW = 3.5;
float scalingFactorH = 2.25;
float scalingFactor = 2.5;

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
int fromtop = 100;
int rowspacing = 50;
int buttonW = 150;
int buttonH = 105;
int state = 1;

int hatnum = 6;
boolean even;
int half;

//INITIALIZE 

//droplisteners
MyDropListener drop1;
MyDropListener drop2;
MyDropListener drop3;
MyDropListener drop4;
MyDropListener drop5;
MyDropListener drop6;

MyDropListener[] droparr;

//INITIALIZE IMAGE ARRAYS
PImage[] hatimages;
PImage[] buttons;
PImage[] loadedhatimages;

Hat[] allthehats;

int hover;

// array to hold all of the positions of the found faces
Rectangle[] hats = {};

void setup(){
  size(1400, 800);
  background(255);
  initializeStartStates();
}

void setState(int s)
{
  state = s;
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
    //println(loadedhatimages[i]);
   if(loadedhatimages[i] != null) {
     loadedhatimages[i].save(savePath("loadedhat"+savenum+".png"));
   }  
   if(customhats == true){
     customsettings.save(savePath("loadedsettings.png"));
     customframe.save(savePath("loadedframe.png"));
   }
  }
  super.exit();
} 