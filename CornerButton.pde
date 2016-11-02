class CornerButton {
  PImage image;
  int xpos;
  int ypos;
  
  CornerButton (PImage img, int x, int y) { 
    image = img;
    xpos = x;
    ypos = y;
  
    }
    
    void draw() {
      image(image, xpos, ypos);
    }
    
    boolean checkClick() {
      if(mousePressed && mouseX > xpos && mouseY > ypos) {
        return true;
      } else {
        return false;
      }
    }

  
}