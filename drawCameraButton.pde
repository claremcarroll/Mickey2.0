void drawCameraButton() {
  //imageMode(CENTER);
  float distLeft = (width - viddispW)/2;
  float distBot = height - ((height - viddispH) / 2) - 20;
  
  fill(255,0,0);
  rect(distLeft, distBot, viddispW, 60);
  
  //imageMode(CORNER);
  
}