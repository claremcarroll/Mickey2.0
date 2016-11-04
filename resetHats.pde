void resetHats() {
   hat1 = defhat1; 
   deleteFile("loadedhat1.png");
   allthehats[0].image = hat1;
   allthehats[0].button = button1;
   hat2 = defhat2; 
   allthehats[1].image = hat2;
   allthehats[1].button = button2;
   deleteFile("loadedhat2.png");
   hat3 = defhat3; 
   allthehats[2].image = hat3;
   allthehats[2].button = button3;
   deleteFile("loadedhat3.png");
   hat4 = defhat4; 
   allthehats[3].image = hat4;
   allthehats[3].button = button4;
   deleteFile("loadedhat4.png");
   hat5 = defhat5; 
   allthehats[4].image = hat5;
   allthehats[4].button = button5;
   deleteFile("loadedhat5.png");
   hat6 = defhat6;
   allthehats[5].image = hat6;
   allthehats[5].button = button6;
   deleteFile("loadedhat6.png");
   hat = hat1;
   
   for(int i = 0; i < loadedhatimages.length; i++) {
     loadedhatimages[i] = null;
   }
}