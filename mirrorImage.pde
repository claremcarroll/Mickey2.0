void mirrorImage(PImage imageToMirror)
{
  imageToMirror.loadPixels();
  for (int x = 0; x < imageToMirror.width/2; x++)
  {
    // compute opposite x position
    int oppositeX = imageToMirror.width-x-1;

    for (int y = 0; y < imageToMirror.height; y++)
    {
      // determine our location
      int location1 = x         + y*imageToMirror.width;
      int location2 = oppositeX + y*imageToMirror.width;

      // swap!
      color temp = imageToMirror.pixels[location1];
      imageToMirror.pixels[location1] = imageToMirror.pixels[location2];
      imageToMirror.pixels[location2] = temp;
    }
  }
  imageToMirror.updatePixels();
}