class CameraButton {
  
  
  int buttonH = 60;
  float distLeft = (width - viddispW)/2;
  float distBot = height - ((height - viddispH) / 2) - 20;
  float xpos = width/2;
  float ypos = distBot + buttonH/2;
  int iconsize;
  
  CameraButton(int height, int iconsize){
    buttonH = height;
    
  }

  void draw() {
    fill(255,0,0);
    rect(distLeft, distBot, viddispW, buttonH);
    Button camera = new Button(cameraimg, (int)xpos , (int) ypos, 50, 50);
    camera.draw();
  }
  
  boolean checkClick(){
   if(mousePressed && mouseX > distLeft && mouseX < distLeft+viddispW && mouseY > distBot && mouseY < buttonH + distBot){
     return true;
   } else {
     return false;
   }
  }
    
  
  
}