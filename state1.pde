void state1() {
  
  CornerButton gear = new CornerButton(gearimg, width-70, height-70);
  CameraButton cambut = new CameraButton(60, 50);
  
  
  
  //draw the video
  imageMode(CENTER);
  image(video, width/2, height/2, viddispW, viddispH);
  imageMode(CORNER);
  
  //if there is video, look for faces and draw the hats
  if (video.available() == true) 
  {  
    // read a new frame of video
    video.read();
    
    mirrorImage(video);
    

    // tell OpenCV about this frame
    opencv.loadImage(video);

    // attempt to detect any new faces
    hats = opencv.detect();
    

    for (int i = 0; i < hats.length; i++) 
    {

      imageMode(CENTER);
      image  (hat, 
              hats[i].x*scalingFactor+width/2-viddispW/2 + hats[i].width/2*scalingFactor,
              hats[i].y*scalingFactor+height/2-viddispH/2 - hats[i].height/8*scalingFactor, 
              hats[i].width*scalingFactorW, 
              hats[i].height*scalingFactorH);
      imageMode(CORNER);

    }
  }
  
    
  keySpace();
    
  image(frame, 0,0);
  
  gear.draw();
   if(gear.checkClick()){
    setState(2);
    mousePressed=false;
    //println("clicked");
  }
  for(int i = 0; i < hatnum; i++){
    allthehats[i].draw();
    allthehats[i].checkMouse();
  }
  if (cambut.checkClick()){
      takePicture();
  }

  for(int i = 0; i < droparr.length; i++) {
    droparr[i].draw();
  }
  
  
  
}

void keySpace(){
  if(keyPressed && key == ' ' && keypressed == false){
    takePicture();
    keypressed = true;
  } 
}

void keyReleased() {
  keypressed = false;
}