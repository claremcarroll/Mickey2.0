boolean ifExists(String path) {
  
  File f = new File(sketchPath(path));
  //println(f);
  if (f.exists())
  {
    return true;
  } else {
    return false;
  }
}