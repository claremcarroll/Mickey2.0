void state2() {
  image(settingsbackground,0,0);
  
  color back = color(128,192,209);
  color text = color(255);
  color hover = color(65,147,175);
  color click = color(43,121,142);
  
  CornerButton arrow = new CornerButton(arrowimg, width-70, height-70);
  Button reset = new Button(200, 300, 200, 50, back, "RESET HATS", text, hover,click);
  Button custom = new Button(200, 500, 200, 50, back, "CUSTOM THEME", text, hover,click);
  
  reset.draw();
  custom.draw();
  arrow.draw();
  
  if(arrow.checkClick()){
    setState(1);
    mousePressed=false;
  }
  
  if(reset.checkClick()){
    resetHats();
  }
  
  if(custom.checkClick()){
    customhats = true;
    allthehats[0].image = customhat1;
    allthehats[0].button = customhat1;
    loadedhatimages[0] = customhat1;
    allthehats[1].image = customhat2;
    allthehats[1].button = customhat2;
    loadedhatimages[1] = customhat2;
    allthehats[2].image = customhat3;
    allthehats[2].button = customhat3;
    loadedhatimages[2] = customhat3;
    allthehats[3].image = customhat4;
    allthehats[3].button = customhat4;
    loadedhatimages[3] = customhat4;
    allthehats[4].image = customhat5;
    allthehats[4].button = customhat5;
    loadedhatimages[4] = customhat5;
    allthehats[5].image = customhat6;
    allthehats[5].button = customhat6;
    loadedhatimages[5] = customhat6;
    
    hat = customhat1;
    frame = customframe;
    settingsbackground = customsettings;
  }
  
}