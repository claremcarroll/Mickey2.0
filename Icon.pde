class Icon {
  
  int width;
  int height;
  PImage image;
  int Xcenter;
  int Ycenter;
  
  Icon (PImage img, int xcenter, int ycenter, int w, int h) { 
  
    image = img;
    Xcenter = xcenter;
    Ycenter = ycenter;
    image.resize(w,h);
  
  }
  
  
  void draw(){
    imageMode(CENTER);
    image(image, Xcenter, Ycenter);
    imageMode(CORNER);
  }
  
  
  
}