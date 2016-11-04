void takePicture(){
  picture.rewind();
  picture.play();
  println("picture!"); 
  mousePressed=false;
  savePic();
}