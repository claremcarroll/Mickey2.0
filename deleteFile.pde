void deleteFile(String path){
  
  File f = new File(sketchPath(path));
  
  if (f.exists())
  {
    f.delete();
  }   
}