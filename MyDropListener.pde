class MyDropListener extends DropListener {
  
  int number;
  int myColor;
  int xpos;
  int ypos;
  int mywidth;
  int myheight;
  
  MyDropListener(int num, int x, int y, int w, int h) {
    number = num;
    xpos = x;
    ypos = y;
    mywidth = w;
    myheight = h;
    myColor = color(255,255,255,0);
    // set a target rect for drop event.
    setTargetRect(xpos,ypos,mywidth,myheight);
  }
  
  void draw() {
    fill(myColor);
    noStroke();
    rect(xpos,ypos,mywidth,myheight);
  }
  
  // if a dragged object enters the target area.
  // dropEnter is called.
  void dropEnter() {
    myColor = color(255,0,0);
  }
  
  // if a dragged object leaves the target area.
  // dropLeave is called.
  void dropLeave() {
    myColor = color(255, 255, 255, 0);
  }
  
  void dropEvent(DropEvent theEvent) {
    println("Dropped on MyDropListener");
    if(theEvent.isImage()) {
      println("### loading image ...");
      allthehats[number].image = theEvent.loadImage();
      allthehats[number].button = theEvent.loadImage();
      hat = theEvent.loadImage();
      loadedhatimages[number] = theEvent.loadImage();
      
    }
  }
}