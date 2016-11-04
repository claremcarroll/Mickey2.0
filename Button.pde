class Button {
  int xpos;
  int ypos;
  float width;
  float height;
  color backcolor;
  String text;
  color txtcolor;
  color hover;
  color click;
  
  Button(int x, int y, float w, float h, color c, String txt, color cl, color hv, color ck){
    xpos = x;
    ypos = y;
    width = w;
    height = h;
    backcolor = c;
    text = txt;
    txtcolor = cl;
    hover = hv;
    click = ck;
  }
  
  void draw(){
    pushMatrix();
    if(mouseOver() && mousePressed){
      fill(click);
    } else if(mouseOver()) {
      fill(hover);
    } else {
      fill(backcolor);
    }
    rect(xpos, ypos, width, height);
    fill(txtcolor);
    textAlign(CENTER);
    textSize(25);
    text(text, xpos+width/2, ypos+height/3*2); 
    popMatrix();
  }
  
  boolean mouseOver(){
    if(mouseX > xpos && mouseX < xpos + width && mouseY > ypos && mouseY < ypos + height){
      return true;
    } else {
      return false;
    }
  }
  
  boolean checkClick(){
    if(mousePressed && mouseOver()){
      return true;
    } else {
      return false;
    } 
  }
  
  
  
}