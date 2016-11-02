class Hat { 
  int number;
  float xpos;
  float ypos; 
  PImage image;
  PImage button;
  
  Hat (int num) {  
    int number = num;
    
    if(loadedhatimages[number] == null) {
      image = hatimages[number];
      button = buttons[number];
    } else {
      image = loadedhatimages[number];
      button = loadedhatimages[number];
    }
    
    if(number < half) {
      xpos = col;
      ypos =  fromtop + buttonH * (number+1) + (number*rowspacing);
    } else {
      xpos = col2;
      ypos = fromtop + buttonH * (number-half+1) + ((number-half)*rowspacing);
    }
    
    droparr[number] = new MyDropListener(number, (int)xpos, (int)ypos, buttonW, buttonH);
    drop.addDropListener(droparr[number]);
    
  } 
  void draw() { 
    fill(255);
    for (int i = 0; i < buttons.length; i++){
      println(buttons[i]);
    }
    image(button, xpos, ypos, buttonW, buttonH);
  } 
  
  void checkMouse(){
    if(mouseX >= xpos && mouseY >= ypos && mouseX <= xpos+buttonW && mouseY <= ypos+buttonH){
      println(number);
      if(mousePressed){
        println("clicked!");
        hover = number;
        hat = image;
      }

    }
  }
} 