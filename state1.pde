void state1() {
  
  
  background(255);
  imageMode(CENTER);
  image(video, width/2, height/2, viddispW, viddispH);
  imageMode(CORNER);
  for(int i = 0; i < hatnum; i++){
    allthehats[i].draw();
    allthehats[i].checkMouse();
  }
  
  for(int i = 0; i < droparr.length; i++) {
    droparr[i].draw();
  }
  
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
    
    imageMode(CENTER);

    for (int i = 0; i < hats.length; i++) 
    {
      
      image  (hat, hats[i].x * scalingFactorW + 300 + hats[i].width/2*scalingFactorW, 
              hats[i].y * scalingFactorH + 100, 
              hats[i].width * scalingFactorW * 1.5, 
              hats[i].height * scalingFactorH * 1.5);        
      }
      
    imageMode(CORNER);

    //image(third, 0, 0);
  }
  
  if(gear.checkClick()){
    //setState(2);
    //mousePressed=false;
    
    resetHats();
    println("clicked");
  }
  
  drawCameraButton();
  
  
}