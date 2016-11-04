void takePicture(){
  fill(255,255,255,200);
  delay(5);
  fill(255,255,255,0);
  delay(5);
  rect(0,0,width,height);
  picture.rewind();
  picture.play();
  image(frame, 0,0);
  second = second();
  minute = minute();
  hour = hour();
  day = day();
  month = month();
  year = year();
  savePic();
  mousePressed=false;
}