void state2() {
  background(255);
  CornerButton arrow = new CornerButton(arrowimg, width-70, height-70);
  arrow.draw();
  
  if(arrow.checkClick()){
    setState(1);
    mousePressed=false;
  }
  
}


void folderSelected(File selection) {
  if (selection == null) {
    println("Window was closed or the user hit cancel.");
  } else {
    println("User selected " + selection.getAbsolutePath());
  }
}