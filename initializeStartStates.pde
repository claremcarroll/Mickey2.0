void initializeStartStates() {
  
  
  //drop listener
    drop = new SDrop(this);
    droparr = new MyDropListener[] {drop1, drop2, drop3, drop4, drop5, drop6};
    
    //sound
    minim = new Minim(this);
    picture = minim.loadFile("assets/picture.wav");
    
    // load in our PImages
    defhat1 = loadImage("assets/hat1.png");
    defhat2 = loadImage("assets/hat2.png");
    defhat3 = loadImage("assets/hat3.png");
    defhat4 = loadImage("assets/hat4.png");
    defhat5 = loadImage("assets/hat5.png");
    defhat6 = loadImage("assets/hat6.png");
    
    hat1 = defhat1;
    hat2 = defhat2;
    hat3 = defhat3;
    hat4 = defhat4;
    hat5 = defhat5;
    hat6 = defhat6;
    
    button1 = loadImage("assets/button1.png");
    button2 = loadImage("assets/button2.png");
    button3 = loadImage("assets/button3.png");
    button4 = loadImage("assets/button4.png");
    button5 = loadImage("assets/button5.png");
    button6 = loadImage("assets/button6.png");
    

    customhat1 = loadImage("assets/customassets/customhat1.png");
    customhat2 = loadImage("assets/customassets/customhat2.png");
    customhat3 = loadImage("assets/customassets/customhat3.png");
    customhat4 = loadImage("assets/customassets/customhat4.png");
    customhat5 = loadImage("assets/customassets/customhat5.png");
    customhat6 = loadImage("assets/customassets/customhat6.png");
    
    customsettings = loadImage("assets/customassets/customsettings.png");
    customsettings.resize(width,height);
    customframe = loadImage("assets/customassets/customframe.png");
    customframe.resize(width,height);
    
    defsettings = loadImage("assets/settingsbackground.png");
    defsettings.resize(width,height);
    
    defframe = loadImage("assets/frame1.png");
    defframe.resize(width,height);
    
    if(ifExists("loadedsettings.png")){
      settingsbackground = customsettings;
    } else {
      settingsbackground = defsettings;
    }
    
    if(ifExists("loadedframe.png")){
      frame = customframe;
    } else {
      frame = defframe;
    }
    
    cameraimg = loadImage("assets/camera.png");
    
    buttons = new PImage[] { button1, button2, button3, button4, button5, button6 };
    
    //if things were loaded in last time, load them again
    loadedhatimages = new PImage[6];
    
    if(ifExists("loadedhat1.png")){
      loadedhatimages[0] =  loadImage("loadedhat1.png");
      hat1 = loadedhatimages[0];
    }
    if(ifExists("loadedhat2.png")){
      loadedhatimages[1] =  loadImage("loadedhat2.png");
      hat2 = loadedhatimages[1];
    }
    if(ifExists("loadedhat3.png")){
      loadedhatimages[2] =  loadImage("loadedhat3.png");
      hat3 = loadedhatimages[2];
    }
    if(ifExists("loadedhat4.png")){
      loadedhatimages[3] =  loadImage("loadedhat4.png");
      hat4 = loadedhatimages[3];
    }
    if(ifExists("loadedhat5.png")){
      loadedhatimages[4] =  loadImage("loadedhat5.png");
      hat5 = loadedhatimages[4];
    }
    if(ifExists("loadedhat6.png")){
      loadedhatimages[5] =  loadImage("loadedhat6.png");
      hat6 = loadedhatimages[5];
    }

    gearimg = loadImage("assets/gear.png");
    arrowimg = loadImage("assets/arrow.png");
    
    gearimg.resize(50,50);
    arrowimg.resize(50,50);

    hat = hat1;
    
    col2 = width - fromright - buttonW;
    col = fromleft;

    hatimages = new PImage[] { hat1, hat2, hat3, hat4, hat5, hat6};
    
    if(hatnum % 2 == 0){
      even = true;
      half = hatnum/2;
    } else {
      even = false;
      half = ((int)hatnum/2) + 1;
    }
    
    allthehats = new Hat[hatnum];
    
    for(int i = 0; i < hatnum; i++) {
      Hat temp = new Hat(i);
      allthehats[i] = temp;
    }
    
  //Face Detection
 
  String[] cameras = Capture.list();

  // no camera objects - no need to continue!  
  if (cameras.length == 0) 
  {
    println("There are no cameras available for capture.");
    exit();
  } 
  else 
  {
    // create a video object
    video = new Capture(this, videoW, videoH);
    video.start();

    // create our open CV object and tell it to monitor the video stream
    opencv = new OpenCV(this, video);

    // tell open CV to begin looking for faces
    opencv.loadCascade(OpenCV.CASCADE_FRONTALFACE);  

  }
  
  
  
}