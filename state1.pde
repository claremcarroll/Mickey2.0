void state1() {
  
  
  background(255);
  pushMatrix();
  scale(.3);
  //if(loadedbackground == null){
  //  image(background, 0,0);
  //} else {
  //  image(loadedbackground, 0, 0);
  //}
  popMatrix();
  imageMode(CENTER);
  image(video, width/2, height/2, viddispW, viddispH);
  imageMode(CORNER);
  
  
  CornerButton gear = new CornerButton(gearimg, width-70, height-70);
  gear.draw();
  
  if (video.available() == true) 
  {  
    // read a new frame of video
    video.read();
    
    mirrorImage(video);
    

    // tell OpenCV about this frame
    opencv.loadImage(video);

    // attempt to detect any new faces
    hats = opencv.detect();
    
    //imageMode(CENTER);

    for (int i = 0; i < hats.length; i++) 
    {
      pushMatrix();
      imageMode(CENTER);
      //translate(hats[i].width*scalingFactorW/2,0);
      image  (hat, 
              hats[i].x*scalingFactor+width/2-viddispW/2 + hats[i].width/2*scalingFactor,
              hats[i].y*scalingFactor+height/2-viddispH/2 - hats[i].height/8*scalingFactor, 
              hats[i].width*scalingFactorW, 
              hats[i].height*scalingFactorH);
      popMatrix();
      

  }
  
  if(gear.checkClick()){
    setState(2);
    mousePressed=false;
    
    resetHats();
    println("clicked");
  }
  
  CameraButton cambut = new CameraButton(60, 50);
  cambut.draw();
  
  
  
  if (cambut.checkClick()){
    takePicture();
  }
  keySpace();
  }
  
  image(frame, 0,0, width, height);
  for(int i = 0; i < hatnum; i++){
    allthehats[i].draw();
    allthehats[i].checkMouse();
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