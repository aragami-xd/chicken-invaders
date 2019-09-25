//side note before the program starts: There is a READ ME file in the program file that list out many details of the game
//side note 2: the whole game takes 10 - 15 min to try out every functions like customization or play every level with reading storyline and try tutorial level


//PImage functions
PImage[] chicken1 = new PImage[3];
PImage[] chicken2 = new PImage[chicken1.length];
PImage[] chicken3 = new PImage[chicken1.length];
PImage[] ship = new PImage[8];
PImage[] artwork = new PImage[ship.length]; 
PImage[] bullet = new PImage[9];
PImage egg;
PImage asteroids;
PImage redBox;
PImage greenBox;
PImage yellowBox;
PImage atomicBox;
PImage ufo;
PImage ufoBullet;
PImage galaxy1;
PImage rocket;
PImage[] boss = new PImage[chicken1.length];
PImage forkArt;
PImage logo;
PImage rocketLogo;
PImage[] scrollIntroLines = new PImage[8];
PImage[] epilogueLines = new PImage[12];



//chicken stuff
float[][] xPos = new float[9][5];                 //chicken X
float[][] yPos = new float[xPos.length][xPos[1].length];                 //chicken Y 
int[][] chickenDied = new int[xPos.length][xPos[1].length];
boolean moveGrid = false;                           //chicken forming in is true or false
float[][] chickenHealth = new float[xPos.length][xPos[1].length];
boolean resetLives = true;
int chickenCount;

//shoot egg stuff
float[][] eggShot = new float[xPos.length][xPos[1].length];    //random value if the egg will be dropped or not
float eggSpeed;                  //egg moving speed
float[] eggX = new float[1000];          //x cooridinates of the egg
float[] eggY = new float[eggX.length];        //y coordiantes of the egg
int eggCount;   //numbers of egg shot 


//frames and delay intervals
int frames = 0;          //count the frames for animetions 
int framesBullet = 0;                             //count the frames for animations
int[][] randomInterval = new int[xPos.length][xPos[1].length];                  //random the delay between randoms of dropping eggs


//background stuff
float backgroundMultiply = 1;                           //multiply the speed of background for animations
float[] xStars = new float[400];                           //use to draw stars
float[] yStars = new float[xStars.length];
float[] speed = new float[xStars.length];              //random moving speed of stars 


//level tutorial setup
boolean levelTSetup = false;
boolean levelT = false;
int phase = 1;
int tutorialFrames = 0;                //use to delay the frames for some interactive quotes
int leftButton = 0;
int rightButton = 0;

//level opening stuff      
boolean levelOpenSetup = true;
boolean levelOpen = false;


//level 0 stuff       (the opening animation)
boolean level0Setup = false;        
boolean level0 = false;


//level 1 stuff (some will be reused in level 10)
boolean level1Setup = false;
boolean level1 = false;                            //level 1
float nextX;                                  //coordiantes of the point that the chicken will fly to
float nextY;
float oldX;                      //coordinates of the point that chicken start flying from
float oldY;
float proportion = 0.0;                    //percentage of the distance
float totalDist;                    //use to check if chicken has arrived yet
int skipLevel = 0;


//level 2 stuff
boolean level2Setup = false;
boolean level2 = false;                            //level 2
int[] direction = new int[5];                      //direction of the grid
float[] basePosition = new float[5];               //base position of the chicken to move in
int chickenCount2 = xPos.length * xPos[1].length;

//in game grid moving (moving the whole chicken grid up down, left right
int gridFrames;              
int directionX = -1;
int directionY = -1;


//level 3 stuff
boolean level3Setup = false;
boolean level3 = false;
  float[][] pXC = new float[xPos.length][xPos[1].length];                //previous X for chicken
float[][] pYC = new float[xPos.length][xPos[1].length];
float[][] nXC = new float[xPos.length][xPos[1].length];                //next X for chicken
float[][] nYC = new float[xPos.length][xPos[1].length];
float[][] gridDist = new float[xPos.length][xPos[1].length];
float gridProportion;
float gridTotal;



//level 4 stuff
boolean level4Setup = false;
boolean level4 = false;

//level 5 stuff
boolean level5Setup = false;
boolean level5 = false;
float level5Y;                        //starting point of the formation

//level 6 stuff
boolean level6Setup = false;
boolean level6 = false;

//level 7 stuff
boolean level7Setup = false;
boolean level7 = false;



//level 8 stuff          (shoot one giant asteroids)
boolean level8Setup = false;
boolean level8 = false;
float bigAsteroidsHealth = 30;
float bigAsteroidsX;
float bigAsteroidsY;
float bigXSpeed;
float bigYSpeed;
int bigDirectionX;
int bigDirectionY;
boolean bigTouchX;
boolean bigTouchY;
boolean quitSetup;



//level 9 stuff          (bonus upgrade)
boolean level9Setup = false;
boolean level9 = false;
int ufoX;                                
int ufoY;
int ufoSpeed;                              //ufo moving speed
int ufoRate = 45;                          //ufo fire rate
int ufoFrames;                            //use for ufo animations 
float ufoHealth = 0.5;
int[] ufoBulletX = new int[10];                      //coordiantes of the bullet
int[] ufoBulletY = new int[ufoBulletX.length];
int[] ufoShot = new int[ufoBulletX.length];
int ufoBulletCount;                  //number of ufo bullets shot
int ufoBulletSpeed;                    //moving speed of bullet 


//level 10 stuff     (boss level)
boolean level10Setup = false;
boolean level10 = false;
float bossHealth = 100;
float bossX;
float bossY;
float pBossX;
float pBossY;
float nBossX;
float nBossY;
float bossSpeed;
float bossProportion;
float bossTotal;
int eggFrames;
int endGame;


//level credit stuff    
boolean levelCreditSetup = false;
boolean levelCredit = false;



//pew pew pew pew
boolean shoot = false;          //shoot
int[] bulletPosX = new int[4000];          //x coordinates of the bullet
int[] bulletPosY = new int[bulletPosX.length];    //y coordiantes of the bullet
int[] bulletShot = new int[bulletPosX.length];    //state of the bullet shot or not
int[] renderBullet = new int[bulletPosX.length];
int bulletType = 1;
int bulletNo = 0;           //bullet count                        
int bulletSpeed;         //speed of moving of bullet
int bulletRate;         //fire rate of bullets
float damage;            //damage
int redBulletSpeed;                            //red bullet stats
int redBulletRate = 20;
float redBulletDamage = 1;
int greenBulletSpeed;                        //green bullet stats
int greenBulletRate = 35;
float greenBulletDamage = 1.5;
int yellowBulletSpeed;                        //yellow bullet stats
int yellowBulletRate = 10;  
float yellowBulletDamage = 0.5;


//ship stuff
int mayDay = 0;              //ship exploded
float shipX;                  
float shipY;
int shipType = 0;
int loseGameFrames;


//asteroids stuff
int asteroidsAmount = int(random(40, 80));             //total amount of asteroids will drop in the level
int[] asteroidsX = new int[asteroidsAmount];             //x coordiantes of the asteroids  
int[] asteroidsY = new int[asteroidsAmount];             //y coordiantes of the asteroids
int[] asteroidsStat = new int[asteroidsAmount];             //status if a specific asteroid has been dropped or not
float[] asteroidsRescale = new float[asteroidsAmount];        //random the rescale value to get small or big asteroids
float[] asteroidsHealth = new float[asteroidsAmount];
int asteroidsDrop;          //"boolean" if asteroid will be dropped or not  
int asteroidsSpeed;              //speed of the asteroids

//gun upgrade                   
int nextBox = 1;                          //if next box can be dropped
int boxCount;
int[] boxX = new int[100];    
int[] boxY = new int[boxX.length];
int[] boxColor = new int[boxX.length];
int bulletLevel = 1;          //gun level
int[][] dropBox = new int[xPos.length][xPos[1].length];              //stats if chicken have dropped the box or not 

//rocket stuff
float rocketX;
float rocketY;
boolean rocketFired = false;
boolean rocketDetonated = false;
int flashDuration = 0; //used to create flash of duration frames
float rocketSlope;  //slope of rocket path from point fired to centre of canvas
float rocketSpeed = 5;  //rocket speed
boolean vertical = false; //avoid divide by zero when calculating slope.
int rocketCount = 80;    //only have 3, but since the counter is repeated 8 times in the function so the value is 24
boolean nextRocket = true;

//easter egg
boolean cheatCodeMode = false;
int cheatCode = 0;
boolean easterEgg;
boolean keyStroke = true;


//level transition
boolean levelDone = false;
int levelDelay;

//main menu stuff
int menuState = 1; 
int buttonX; // x-coord of buttons
int buttonYBase; // y-coordinate reference point for buttons
int buttonYoffSet; //y-coordinate offset from reference point for buttons.
int [][] buttonPos = new int [4][2];//store coordinates of buttons


//change the string name to a different one depends on the ship's name               
int rightShip;
int leftShip;
int pressed;
String custom = "CUSTOMIZATION"; //Menu title.

/* button data*/
float butWidth ; //button width
float butHeight; //button height
/*ButPositionCustMenu stores the coordinates of the buttons for the customization menu
 butPositionCustMenu = x coordinate of Back button  */
float butPositionCustMenu;
int x = 0, y = 1; //array indices for button coordinates
String butTitlesCustMenu = "Back";//titles for buttons 

/*'difficulty' stores difficulty level:
 difficulty = 0 := 'rookie' easy level
 difficulty = 1 := 'veteran' more difficult level.*/
int difficulty = 0;

/*butPositionDiffMenu stores coordinates of positions
 of buttons on difficulty menu*/
int [][] butPositionDiffMenu = new int [2][2];

/* butTitleDiffMenu stores the labels for the buttons*/
String [] butTitleDiffMenu = {"Rookie", "Veteran"};

/*Main title of 'difficulty level' menu*/
String difficultMenuTitle = "Difficulty Level";


//font
PFont font;

//difficulty level
int eggSpawnRate;
int healthMultiply;
float dropRate;

//X-plosion effect
float explosionX;
float explosionY;
int explosionFrames;
int explosionDirection = 1;                //this will make the moving up and down effect
boolean explosion = false;

//fade to black transition
boolean transition = false;
int transitionFrames;

//start dimensions of the text images
float lineW;
float lineH;
//array that stores the dimension of each text image
float [][] lineDimensions = new float[scrollIntroLines.length][2];
float [][] epilogLineDim = new float[epilogueLines.length][2];

//array stores the positon that each text image is place
float [][] linePosition = new float[lineDimensions.length][lineDimensions[0].length];
float [][] epilogLinePos = new float[epilogLineDim.length][epilogLineDim[0].length];

//file base names for story lines imports of png.
String epilogBaseFileName = "eline";
String prologBaseFileName = "line";

//fcount is a frame counter use to space out the lines of text in time
int fCount = 0;

//fCountbase is limit of fcount. It is based on the initial position of the text images.
int fCountBase ;

//fDelay is the delay in frames between the insertion of each line of text.
int fDelay = 120;
int fCounter = 0;



//void setup begin
void setup() {
  size(1366,768);
  /* For the best experience, run the game at a 16:9 ratio, example:    (other ratios work, but it will looks weird)
  853,480
  1280,720
  1366,768
  1920,1080
  */
  font = loadFont("AgencyFB-Bold-48.vlw");
  textFont(font);
  //frameRate(3);
  //frameRate(30);
  //frameRate(12);
  //frameRate(120);
  //frameRate(240);


  //load images
  for (int i=0; i<ship.length; i++) {
    ship[i] = loadImage("ship " + (i+1)+ ".png");
    artwork[i] = loadImage("ship " + (i+1) + " artwork.png");
  }
  for (int i=0; i<chicken1.length; i++) { 
    chicken1[i] = loadImage("chicken " + (i+1) + " " + 1 + ".png");
    chicken2[i] = loadImage("chicken " + (i+1) + " " + 2 + ".png");
    chicken3[i] = loadImage("chicken " + (i+1) + " " + 3 + ".png");
    boss[i] = loadImage("boss " + (i+1) + ".png");
  }  

  bullet[0] = loadImage("red bullet.png");
  bullet[1] = loadImage("green bullet.png");
  bullet[2] = loadImage("yellow bullet.png");
  bullet[3] = loadImage("red bullet 2.png");
  bullet[4] = loadImage("green bullet 2.png");
  bullet[5] = loadImage("yellow bullet 2.png");
  bullet[6] = loadImage("red bullet 3.png");
  bullet[7] = loadImage("green bullet 3.png");
  bullet[8] = loadImage("yellow bullet 3.png");

  egg = loadImage("egg.png");
  asteroids = loadImage("asteroids.png");
  redBox = loadImage("red box.png");
  greenBox = loadImage("green box.png");
  yellowBox = loadImage("yellow box.png");
  atomicBox = loadImage("atomic box.png");
  ufo = loadImage("ufo.png");
  ufoBullet = loadImage("ufo bullets.png");
  galaxy1 = loadImage("galaxy.jpg");
  rocket = loadImage("rocket.png");
  forkArt = loadImage("fork.png");
  logo = loadImage("logo.png");
  rocketLogo = loadImage("rocket logo.png");




  //rescaling the images
  for (int i=0; i<chicken1.length; i++) {
    chicken1[i].resize(width/18, width/18);
    chicken2[i].resize(width/18, width/18);
    chicken3[i].resize(width/18, width/18);
    boss[i].resize(width/5, width/5);
  }
  for (int i=0; i<ship.length; i++) {
    ship[i].resize(width/10, width/10);
  }
  galaxy1.resize(width, height);
  bullet[0].resize(width/45, width/45);
  bullet[1].resize(width/35, width/35);
  bullet[2].resize(width/40, width/40);
  bullet[3].resize(width/55, width/55);
  bullet[4].resize(width/35, width/35);
  bullet[5].resize(width/50, width/10);
  bullet[6].resize(width/35, width/35);
  bullet[7].resize(width/20, width/40);
  bullet[8].resize(width/60, width/12);

  egg.resize(width/95, width/85);
  redBox.resize(width/40, width/40);
  greenBox.resize(width/40, width/40);
  yellowBox.resize(width/40, width/40);
  atomicBox.resize(width/40, width/40);
  ufo.resize(width/5, width/10);
  ufoBullet.resize(width/40, width/40);
  forkArt.resize(width/20, width/20);
  logo.resize(width/3, width/5);
  rocketLogo.resize(width/55, width/55);



  /*Assign values to button parameters*/
  butWidth = 0.22*width;
  butHeight = 0.065*height;
  butPositionDiffMenu[0][x]= int(0.5*width - 0.5*butWidth);
  butPositionDiffMenu[1][x]= butPositionDiffMenu[0][x];
  butPositionDiffMenu[1][y]= int(5*height/8);
  butPositionDiffMenu[0][y]= int(5*height/8 - 2*butHeight);

  buttonX = 39*width/120; 
  buttonYBase = height/2; 
  buttonYoffSet = height/9;
  butWidth = 0.22*width;
  butHeight = 0.065*height;
  butPositionCustMenu = width/1000.0;
  level5Y = -width/27;


  eggSpeed = height/200;
  asteroidsSpeed = width/180;
  ufoSpeed = width/150;
  ufoBulletSpeed = height/80;
  //backgroundSpeed = width/256;

  redBulletSpeed = -height/80;
  greenBulletSpeed = -height/80;
  yellowBulletSpeed = -height/80;
  
  lineW = width/1.355158;
  lineH = width/13.39216;

  for (int i = 0; i < buttonPos.length; i++) {
    for (int j = 0; j < 2; j++) {
      if (j==0) {
        //assign x-coordinat of button position
        buttonPos[i][j] = buttonX;
      } else {
        //assign y-coordinate of button position
        buttonPos[i][j] = buttonYBase + buttonYoffSet *i;
      }
    }
  }

  for (int i=0; i<bulletPosX.length; i++) {                  //start the game with all bullets outside the screen, moving them inside when needed later
    bulletPosX[i] = 4000;
    bulletPosY[i] = 4000;
    renderBullet[i] = 0;
  }


  bulletSpeed = redBulletSpeed;

  //background
  for (int i = 0; i < xStars.length; i++) {                          //use for drawing the stars 
    xStars[i] = random(width);
    yStars[i] = random(height);
    speed[i] = random(4);
  }
  //backgroud
}
//end of void setup



//void draw beginning
void draw() { 
  frames = frames + 1;
  imageMode(CENTER);
  drawBackground();
  if (transition == true) {                //drawing the fading to black transition
    transition();
  }


  if (menuState == 1) {                              //the main menu
    backgroundMultiply = 1;
    for (int i=0; i < xPos.length; i++) {                        
      for (int m=0; m < xPos[1].length; m++) {    
        xPos[i][m] = 5000;                                      //move all chicken outside the canvas
        yPos[i][m] = 5000;
      }
    }
    imageMode(CORNER);
    drawMainMenu();
    drawCursor();                                //some functions to draw the main menu
    menuChicken();
    clickChicken();
    chickenAmbient(frames);
    easterEgg();
    textSize(width/80);
    if (easterEgg == true) {
      text("Cheat code mode", width*0.08, height*0.95);
    }
  }

  if (difficulty == 0) {                  //setting up some value for the difficulty like how oftern it drop eggs, health, ...
    eggSpawnRate = 8;
    healthMultiply = 1;
    dropRate = 29;
  } else if (difficulty == 1) {
    eggSpawnRate = 6;
    healthMultiply = 2;
    dropRate = 29.7;
  }

  if (menuState == 2) {                                //where all the magic happens, or the main gameplay
    imageMode(CENTER);
    if (easterEgg == true) {                        //make the ship cannot died when cheat code is on
      mayDay = 0;
    }

    if (levelTSetup == true) {                        //setup functions for each levels
      levelTSetup();
    } else if (levelOpenSetup == true) {
      levelOpenSetup();
    } else if (level0Setup == true) {
      level0Setup();
    } else if (level1Setup == true) {
      level1Setup();
    } else if (level2Setup == true) {
      level2Setup();
    } else if (level3Setup == true) {
      level3Setup();
    } else if (level4Setup == true) {
      level4Setup();
    } else if (level5Setup == true) {
      level5Setup();
    } else if (level6Setup == true) {
      level6Setup();
    } else if (level7Setup == true) {
      level7Setup();
    } else if (level8Setup == true) {
      level8Setup();
    } else if (level9Setup == true) {
      level9Setup();
    } else if (level10Setup == true) {
      level10Setup();
    } else if (levelCreditSetup == true) {
      levelCreditSetup();
    }

    //reset health points 
    if (resetLives == true) {
      resetLives();
    }

    if (levelOpen == false && levelCredit == false) {
      drawShip();            //draw the ship
    }



    if (bulletType == 1) {                                  //different data for different bullet types
      bulletSpeed = redBulletSpeed;
      bulletRate = redBulletRate;
      damage = redBulletDamage;
    } else if (bulletType == 2) {
      bulletSpeed = greenBulletSpeed;
      bulletRate = greenBulletRate;
      damage = greenBulletDamage;
    } else if (bulletType == 3) {
      bulletSpeed = yellowBulletSpeed;
      bulletRate = yellowBulletRate;
      damage = yellowBulletDamage;
    }
    damage = damage + bulletLevel*0.5;

    //level opening
    if (levelOpen == true) {
      displayStory(scrollIntroLines, linePosition, lineDimensions);                        //draw the opening storyline
      if (frames >= 1300 || (key == ENTER && keyPressed == true && pressed == 0)) {
        levelOpen = false;
        levelTSetup = true;
        transition = true;
        pressed = 1;
      }
    }

    //skip level by pressing the button: `   (on the left of number 1, on top of tab button)
    if (key == '`' && keyPressed == true) {
      skipLevel = 1;
    }

    //level T
    if (levelT == true) {
      levelT();
    }

    //level 0
    if (level0 == true) {
      level0();
    }


    //level 1
    if (level1 == true) {
      level1();
    }


    //level 2
    if (level2 == true) {
      level2();
    }  

    //level 3
    if (level3 == true) {
      level3();
    }  


    //level 4
    if (level4 == true) {                            
      level4();
    }


    //level 5
    if (level5 == true) {
      level5();
    }


    //level 6
    if (level6 == true) {
      level6();
    }

    //level7
    if (level7 == true) {
      level7();
    }

    //level 8
    if (level8 == true) {
      level8();
    }  


    //level9
    if (level9 == true) {
      level9();
    } 

    //level 10
    if (level10 == true) {
      level10();
    }

    //credit
    if (levelCredit == true) {
      levelCredit();
    }

    if (level1 == true || level2 == true || level3 == true || level5 == true || level6 == true || level7 == true) {              //some animations, hit registration, ... for chickens
      hitChicken();
      chickenAmbient(frames);
      dropEggs();
    }


    //dropGift();
    for (int i=0; i<boxX.length; i++) {
      giftBox(i);                                      //drawing the gift boxes
      boxY[i] = boxY[i] + height/256;                    
      if (boxY[i] > height) {
        boxX[i] = -1000;                              //if gift box is used or out of the screen
      }
      if (levelT == false && levelOpen == false) {
        upgradeBox(i);
      }
    }



    if (mayDay == 0) {
      shoot(framesBullet);              //shoot if you not died yet
    }





    for (int i=0; i<bulletNo; i++) {                          //drawing the bullet and count the bullet
      if (bulletShot[i] == 1 || shoot == true) {
        bullet(i); 
        bulletPosY[i] = bulletPosY[i] + bulletSpeed;      
        if (bulletPosY[i] <= 0) {                              //bullet is out of screen
          bulletPosX[i] = 4000;
          bulletPosY[i] = 4000;
        }
      }
    }

    if (levelOpen == false && levelCredit == false) {
      rocketGauge();
    }


    for (int i=0; i<eggCount; i++) {                //drawing the egg and count the egg  
      eggShot(i); 
      eggY[i] = eggY[i] + eggSpeed;
    }

    if (mousePressed == true) {                    //frame counter for the bullet
      framesBullet = framesBullet + 1;
    } else if (mousePressed == false) {
      framesBullet = 0;                          //released the mouse
    }


    /* if rocket has been fired then call trackRocket*/
    if (rocketFired == true) {
      trackRocket();
    }

    /* if signal to detonate has been set then call
     detonateRocket function*/
    if (rocketDetonated == true) {
      detonateRocket();
    }
  }

  if (menuState == 5) {                        //the buy full game menu
    dlc();
  }

  if (menuState == 3) {                        //customization menu
    drawCustomizationMenu();
  }

  if (menuState == 4) {                  //difficulty menu
    drawDifficultyMenu();
  }
}
//end of void draw




void drawBackground() {            //drawing the stary sky background
  if (explosion == true) {                  //moving the entire background to create shaky explosion effect
    explosionFrames++;
    explosionFX();
  }  
  image(galaxy1, width/2, height/2);
  stroke(255);
  strokeWeight(width/450);
  for (int i = 0; i < xStars.length; i++) {            
    point(xStars[i], yStars[i]);                  //drawing the stars
    yStars[i] += speed[i] * backgroundMultiply;              //moving  stars 
    if (yStars[i] > height) {
      yStars[i] = 0;                          //reset the position of the stars
    }
  }
}





void chickenAmbient(int frames) {                          //ambient movement animation (chicken move slightly up and down)
  for (int i=0; i<xPos.length; i++) {
    for (int m=0; m<xPos[1].length; m++) {
      if (frames % 40 >= 0 && frames % 40 <= 10) {                    //these if functions are used to draw the wings moving up, down or flat
        image(chicken1[i%3], xPos[i][m], yPos[i][m] + 8);
      } else if ((frames % 40 >= 10 && frames % 40 <= 20)|| (frames % 40 >= 30 && frames % 40 <= 40)) {
        image(chicken2[i%3], xPos[i][m], yPos[i][m] + 4);
      } else if (frames % 40 >= 20 && frames % 40 <= 30) {
        image(chicken3[i%3], xPos[i][m], yPos[i][m]);
      }
      if ((xPos[i][m] < shipX + width/45 && xPos[i][m] > shipX - width/45 && yPos[i][m] > shipY - width/45 && yPos[i][m] < shipY + width/45) && chickenHealth[i][m] > 0) {           
        mayDay = 1;                            //ship hits the chicken
        if (easterEgg == false) {
          explosion = true;
          frames = 0;
        }
      }
    }
  }
}




void hitChicken() {
  for (int i=0; i<xPos.length; i++) {
    for (int m=0; m<xPos[1].length; m++) {
      for (int a = 0; a < bulletShot.length; a++) {
        if (bulletPosX[a] > xPos[i][m] - width/38 && bulletPosX[a] < xPos[i][m] + width/38 && bulletPosY[a] <= yPos[i][m] + width/14 && bulletPosY[a] >= yPos[i][m] - width/14) {  //chicken hitbox
          chickenHealth[i][m] -= damage;        //when the chicken is hit, lose health
          bulletPosX[a] = 4000;
        }
      }
      if (chickenHealth[i][m] <= 0) {              //when the chicken died
        if (chickenDied[i][m] == 0) {
          chickenCount--;
          chickenDied[i][m] = 1;
          float drop = random(30);                      //random the chance of dropping the upgrade box when the chicken died
          if (drop > dropRate) {
            boxX[boxCount] = round(xPos[i][m]);
            boxY[boxCount] = round(yPos[i][m]);
            boxColor[boxCount] = round(random(1, 4));
            boxCount = boxCount + 1;
          }
        }
        xPos[i][m] = 5000;
      }
    }
  }
}






void dropEggs() {                          //chicken drops the egg
  for (int i=0; i<xPos.length; i++) {
    for (int m=0; m<xPos[1].length; m++) {
      if (xPos[i][m] > 0 && xPos[i][m] < width && yPos[i][m] > 0) {              //the chicken is inside the screen
        if (frames % randomInterval[i][m] == 0 && chickenHealth[i][m] > 0) {              //drop the egg
          eggShot[i][m] = random(0, 10);               //random the possibility of dropping the egg
          if (eggShot[i][m] > eggSpawnRate) {                    
            eggX[eggCount] = xPos[i][m]; 
            eggY[eggCount] = yPos[i][m] + height/45; 
            eggCount = eggCount + 1;
          }
        }
      }
    }
  }
}



void randomMove(float nextX, float nextY, float oldX, float oldY, float totalDist, int i, int m) {            //level 1 chicken movement system (and the one in the menu)
  xPos[i][m] = oldX + totalDist * (nextX - oldX); 
  yPos[i][m] = oldY + totalDist * (nextY - oldY);
}

void nextRandom() {                          //still for the level 1 chicken
  oldX = nextX; 
  oldY = nextY; 
  nextX = random(width*0.2, width*0.8); 
  nextY = random(height*0.2, height*0.6);
}




void moveGrid2() {                                                //moving in the formation for level 2
  for (int i=0; i<xPos.length; i++) {
    for (int m=0; m<xPos[1].length; m++) {
      if (chickenHealth[i][m] > 0) {
        if (m % 2 == 0) {
          direction[m] = 1; 
          xPos[i][m] = basePosition[m] + i*width/12; //move from left to right
          yPos[i][m] = m*width/18 + height/9.5;
        } else if (m % 2 == 1) {
          direction[m] = -1; 
          xPos[i][m] = basePosition[m] + i*width/12; //move from right to left
          yPos[i][m] = m*width/18 + height/9.5;
        }
      }
      basePosition[m] = basePosition[m] + width/2732.0*direction[m]; //moving speed
      if (basePosition[0] > basePosition[1]) {
        moveGrid = false; //if formation is in position
      }
    }
  }
}



void moveGrid3() {                                    //moving the chickens in level 3 
  for (int i=0; i<xPos.length; i++) {
    for (int m=0; m<xPos[1].length; m++) {
      if (chickenHealth[i][m] > 0) {
        if (gridTotal < 1) {
          xPos[i][m] = pXC[i][m] + gridTotal*(nXC[i][m] - pXC[i][m]);
          yPos[i][m] = pYC[i][m] + gridTotal*(nYC[i][m] - pYC[i][m]);
          gridTotal += gridProportion;
        }
        if (gridTotal >= 1) {
          moveGrid = false;
        }
      }
    }
  }
}

void inGameGrid() {                          //moving the whole chicken grid in level 2 and 3 (how the chicken moving up down && left right
  gridFrames ++;
  for (int i=0; i<xPos.length; i++) {
    for (int m=0; m<xPos[1].length; m++) {
      xPos[i][m] += (width/1200.0)*directionX;
      yPos[i][m] += (height/10000.0)*directionY;
    }
  }
  if (gridFrames % 120 == 60) {                  //changing direction
    directionX = directionX*(-1);
  } 
  if (gridFrames == 360) {
    directionY = directionY*(-1);
    gridFrames = 0;
  }
}





void asteroids4(int i) {
  for (int a=0; a<bulletNo; a++) {
    if (bulletPosX[a] > asteroidsX[i] - width/38 && bulletPosX[a] < asteroidsX[i] + width/38 && bulletPosY[a] < asteroidsY[i] + height/19 && bulletPosY[a] > asteroidsY[i] - height/19) {
      asteroidsHealth[i] -= damage;            //ship bullet hits the asteroids
      bulletPosX[a] = 4000;
    }
  }
  if (asteroidsHealth[i] > 0) {
    image(asteroids, asteroidsX[i], asteroidsY[i], width/asteroidsRescale[i], width/asteroidsRescale[i]);           //draw the asteroids
  } else if (asteroidsHealth[i] <= 0) {
    asteroidsX[i] = 5000;
  }

  if (asteroidsX[i] < shipX + width/45 && asteroidsX[i] > shipX - width/45 && asteroidsY[i] > shipY - width/45 && asteroidsY[i] < shipY + width/45) {          //ship hitbox for asteroids
    mayDay = 1;
    if (easterEgg == false) {
      explosion = true;
      frames = 0;
    }
  }
}





void moveGrid5(float level5Y) {                  //move the whole chicken formation in level 5
  for (int i=0; i<xPos.length; i++) {
    for (int m=0; m<xPos[1].length; m++) {
      if (chickenHealth[i][m] > 0) {
        yPos[i][m] = level5Y - m*width/2.277 - abs((i-4))*width/32; 
        xPos[i][m] = width/2 + (i-4)*width/9;
      }
    }
  }
}


void asteroids8(int asteroidsRescale) {                  //movign the asterodis for level 8
  for (int a=0; a<bulletNo; a++) {              //hit registration
    if (bulletPosX[a] > bigAsteroidsX - width/16 && bulletPosX[a] < bigAsteroidsX + width/16 && bulletPosY[a] < bigAsteroidsY + height/8 && bulletPosY[a] > bigAsteroidsY - height/8) {
      bigAsteroidsHealth -= damage;
      bulletPosX[a] = 4000;
    }
  }

  if (bigAsteroidsHealth > 0) {                  
    image(asteroids, bigAsteroidsX, bigAsteroidsY, width/asteroidsRescale, width/asteroidsRescale);           //draw the asteroids
  } else if (bigAsteroidsHealth <= 0) {    
    bigAsteroidsX = 5000;                     //if asteroid has died
  }

  if (bigAsteroidsX < shipX + width/16 && bigAsteroidsX > shipX - width/16 && bigAsteroidsY > shipY - width/16 && bigAsteroidsY < shipY + width/16) {          //ship hitbox for asteroids
    mayDay = 1;
    if (easterEgg == false) {                              
      explosion = true;
      frames = 0;
    }
  }
}


void wallX() {
  if (bigAsteroidsX > width*0.95 || bigAsteroidsX < width*0.05) {                    //asteroids touch the vertical wall
    bigDirectionX = bigDirectionX*(-1);
    bigTouchX = true;
  }
}
void wallY() {
  if (bigAsteroidsY > height*0.95 || bigAsteroidsY < height*0.05) {                //asteroids touch the horizontal wall
    bigDirectionY = bigDirectionY*(-1);
    bigTouchY = true;
  }
}





void drawUfo(int ufoFrames) {                                          //drawing the ufo 
  if (ufoHealth > 0) {
    image(ufo, ufoX, ufoY); 
    if (ufoFrames % 20 == 0) {                              //ufo shooting
      ufoBulletCount = ufoBulletCount + 1; 
      ufoBulletX[ufoBulletCount] = ufoX; 
      ufoBulletY[ufoBulletCount] = ufoY + width/68; 
      ufoShot[ufoBulletCount] = 1;
    }
  } else if (ufoHealth <= 0) {                        //if the ufo is died
    ufoX = 6000;
  }
}

void ufoBullet(int i) {                        //drawing the ufo bullets
  ufoBulletY[i] += ufoBulletSpeed; 
  image(ufoBullet, ufoBulletX[i], ufoBulletY[i]);
  if (ufoBulletX[i] < shipX + width/45 && ufoBulletX[i] > shipX - width/45 && ufoBulletY[i] > shipX - width/45 && ufoBulletY[i] < shipX + width/45) {        //ufo bullet hits ship
    mayDay = 1;
    if (easterEgg == false) {
      explosion = true;
      frames = 0;
    }
  }
}

void hitUfo() {                                              //ship bullet hits the ufo
  for (int a = 0; a < bulletShot.length; a++) {
    if (bulletPosX[a] > ufoX - width/27 && bulletPosX[a] < ufoX + width/27 && bulletPosY[a] <= ufoY + width/19 && ufoHealth > 0) {  
      bulletPosX[a] = 4000; 
      bulletPosY[a] = 4000;
      ufoHealth = 0;
      boxX[boxX.length - 1] = ufoX;                              //ufo drops the upgrade box
      boxY[boxX.length - 1] = ufoY;
      boxColor[boxX.length - 1] = int(random(1, 5));
    }
  }
}





void bossMove(float nBossX, float nBossY, float pBossX, float pBossY, float bossTotal) {            //moving the boss
  bossX = pBossX + bossTotal * (nBossX - pBossX); 
  bossY = pBossY + bossTotal * (nBossY - pBossY);
}

void nBossRandom() {                                                  //how the boss randomly move        (p/s: 'n' means next)
  pBossX = nBossX;                                                     //the boss will move based on your ship position when during the random function to move it (sort of)
  pBossY = nBossY; 
  nBossX = shipX + random(-width*0.1, width*0.1);                               
  if (nBossX > width*0.9) {
    nBossX = width*0.9;                                            //mostly edge cases
  } else if (nBossX < width*0.1) {
    nBossX = width*0.1;
  }
  nBossY = shipY + random(-height*0.3, height*0.05);
  if (nBossY > height*0.7) {
    nBossY = height*0.7;
  } else if (nBossY < height*0.1) {
    nBossY = height*0.1;
  }
}

void bossAmbient(float bossX, float bossY, float bossHealth) {                                //boss flapping wings
  if (bossHealth > 0) {
    if (frames % 40 >= 0 && frames % 40 <= 10) {
      image(boss[0], bossX, bossY + 16);
    } else if ((frames % 40 >= 10 && frames % 40 <= 20)|| (frames % 40 >= 30 && frames % 40 <= 40)) {
      image(boss[1], bossX, bossY + 8);
    } else if (frames % 40 >= 20 && frames % 40 <= 30) {
      image(boss[2], bossX, bossY);
    }
    if ((bossX < shipX + width/10 && bossY > shipX - width/10 && bossY > shipY - width/10 && bossY < shipY + width/10) && bossHealth > 0) {          //ship hitbox for chicken  
      mayDay = 1;
      if (easterEgg == false) {
        explosion = true;
        frames = 0;
      }
    }
  } else if (bossHealth <= 0) {                          //boss died
    bossX = 5000;
  }
}

void bossEgg(float bossX, float bossY) {                          //how boss drops the egg
  eggX[eggCount] = random(bossX - width/15, bossX + width/15);
  eggY[eggCount] = bossY + width/10;
  eggCount++;
  image(egg, eggX[eggCount], eggY[eggCount]);
}

void hitBoss() {                                    //ship bullet hits the egg
  for (int a = 0; a < bulletShot.length; a++) {
    if (bulletPosX[a] > bossX - width/10 && bulletPosX[a] < bossX + width/10 && bulletPosY[a] <= bossY + width/10 && bossHealth > 0) {  //chicken hit
      bossHealth -= damage;                                   //lose 1 health
      bossY -= width/341;
      bulletPosX[a] = 4000; 
      bulletPosY[a] = 4000;
    }
  }
}




void drawShip() {                                        //drawing the ship
  if (mayDay == 0) { 
    shipX = mouseX;
    shipY = mouseY;
    if (shipX > width * 0.95) {                                  //limiting the ship movement at the corners
      shipX = width*0.95;
    } else if (shipX < width * 0.05) {
      shipX = width*0.05;
    }  
    if (shipY > height * 0.9) {
      shipY = height*0.9;
    } else if (shipY < height * 0.1) {
      shipY = height*0.1;
    }
    if (shoot == false) {                                
      image(ship[shipType], shipX, shipY); //draw the ship
    } else if (shoot == true) {
      image(ship[shipType], shipX, shipY + height/75); //recoil
    }
  } else if (mayDay == 1) {                  //if ship exploded
    loseGameFrames++;
    shipX = -2000;
    shipY = -2000;
    textAlign(CENTER);
    fill(255);
    textSize(width/34.15);
    text("YOU LOSE, TRY AGAIN :)", width/2, height*0.45);                        //loosing message and back to the menu
    if (mayDay == 1 && loseGameFrames == 120) {
      resetGame();
    }
  }
}



void shoot(int framesBullet) {  
  if (mouseButton == LEFT) {          //press shoot
    if (framesBullet % bulletRate == 1) {        //delay interval
      shoot = true; 
      bulletPosX[bulletNo] = round(shipX); //coordinate of a specific bullet
      bulletPosY[bulletNo] = round(shipY - width/40); 
      bulletShot[bulletNo] = 1; //status of a bullet being shot or not
      bulletNo++; //number of bullet
    } else if (framesBullet % bulletRate < 3) {
      shoot = true;
    } else if (framesBullet % bulletRate >= 3) {      //delay interval
      shoot = false;
    }
  }
}





void mouseReleased() {                     //stop shooting after mouse is released
  shoot = false; 
  framesBullet = 0;
}



void bullet(int i) {                      //drawing the bullet
  image(bullet[renderBullet[i]], bulletPosX[i], bulletPosY[i] - width/45.5);
}



void eggShot(int i) {                        //drawing the egg          
  if (eggX[i] < shipX + width/45 && eggX[i] > shipX - width/45 && eggY[i] > shipY - width/45 && eggY[i] < shipY + width/45) {            //ship's hitbox for the egg
    mayDay = 1; 
    if (easterEgg == false) {
      explosion = true;
      frames = 0;
    }
    eggX[i] = -1000;
    eggY[i] = 2000;
  } else {
    image(egg, eggX[i], eggY[i]); //draw the egg
  }
}


void giftBox(int i) {                //drawing the upgrade box
  if (boxColor[i] == 1) {
    image(redBox, boxX[i], boxY[i]);
  } else if (boxColor[i] == 2) {  //green
    image(greenBox, boxX[i], boxY[i]);
  } else if (boxColor[i] == 3) {  //yellow
    image(yellowBox, boxX[i], boxY[i]);
  } else if (boxColor[i] == 4) {  //power  
    image(atomicBox, boxX[i], boxY[i]);
  }
}



void upgradeBox(int i) {                          //how the upgrade box behaves
  if (mayDay == 0 && (boxX[i] < shipX + width/45 && boxX[i] > shipX - width/45 && boxY[i] > shipY - width/45 && boxY[i] < shipY + width/45)) {   //eat the box
    if (boxColor[i] == bulletType || boxColor[i] == 4) {            
      bulletLevel++;                                  //upgrade the gun  
      if (bulletLevel >= 3) {                    //limit upgrade level
        bulletLevel = 3;
      }
    }  
    if (boxColor[i] != bulletType && boxColor[i] != 4) {                //changing bullet type
      bulletType = boxColor[i];
    }
    for (int m=bulletNo; m<bulletPosX.length; m++) {                       
      renderBullet[m] = (bulletType - 1) + (bulletLevel-1)*3;                    //use to determine which image of the bullet it will draw
    }  
    boxX[i] = -1000;
    boxY[i] = - 100;
  }
}  



//(joe's part)

void mousePressed() {
  if (menuState == 2) {
    if (mouseButton == RIGHT && nextRocket == true && rocketCount > 0 && levelOpen == false && levelCredit == false) {
      fireRocket();                                                              //for the rockets
      nextRocket = false;
    }
  }
  if (menuState == 1) {
    checkMenuButtonClicked();                          //for the main menu buttons
  }
  if (menuState == 3 || menuState == 5) {                    //for the back button
    checkCustMenuButPress();
  }
  if (menuState == 4) {
    checkCustMenuButPress();                          //for the difficulty buttons
    checkDifficulty();
  }
}


void fireRocket() {
  /*called if right mouse button is clicked. The coordinates of the
   mouse are recorded at the point when right click ocurred. The absolute value of
   the slope of the straight line path from the mouse position to the centre
   of the canvas is calculated. */
  rocketX = shipX;
  rocketY = shipY;
  rocketFired = true;

  if (rocketX != 0.5*width) {
    /* only calculate slope for non-vertical lines */
    rocketSlope = abs((rocketY-0.5*height)/(rocketX-0.5*width));
  } else {
    vertical = true;
  }
  drawRocket();
}



void drawRocket() {
  /*Draws the rocket on the screen and orients it towards
   the centre of the canvas*/

  float theta;//angle of slope of line to centre of canvas.
  float alpha; //angle rocket for orienting rocket to centre of canvas.
  theta = atan(rocketSlope);
  alpha = pointRocket(theta);

  /*orient the rocket towards the centre of the canvas*/
  translate(rocketX, rocketY);
  rotate(alpha);
  image(rocket, -9, -37);
}


void trackRocket() {
  /*Updates and checks the position of the rocket.  If the rocket has
   reached the centre of the canvas the rocketDetonated value is set to true*/
  moveRocket(); 
  if (rocketX == 0.5*width && rocketY == 0.5*height) {
    rocketDetonated = true;
    rocketFired = false;
  }
}



void moveRocket() {
  /* Moves the rocket on a linear trajectory towards centre of canvas. It checks
   if position has overshot the centre of the canvas after being updated.  If position
   has overshoot centre then position is assigned to the centre position*/
  float speedX;
  float speedY;

  if (vertical == true) { 
    /*if rocket is travelling vertically adjust only rocketY*/
    if (rocketY < 0.5*height) {
      rocketY = rocketY + rocketSpeed;

      /*Correct of overshoot*/
      if (rocketY > 0.5*height) {
        rocketY = 0.5*height;
      }
    } else if (rocketY > 0.5) {
      rocketY = rocketY - rocketSpeed;

      /*Correct for overshoot*/
      if (rocketY < 0.5*height) {
        rocketY = 0.5*height;
      }
    }
  }

  /*calculate x and y components of the rocket speed*/
  speedX = rocketSpeed*cos(atan(rocketSlope));
  speedY = rocketSpeed*sin(atan(rocketSlope));

  /*update position of rocket using method dependent on location
   relative to centre of canvas*/
  if ((rocketX < 0.5*width) && (rocketY <=0.5*height)) {
    /*Rocket in top left quadrant wrt to canvas centre then
     increase x and y components*/
    if (rocketY == 0.5*height) {
      /*if rocketY is 0.5*height don't update it*/
      rocketX = rocketX + speedX;

      /*correct for overshoot*/
      if (rocketX > 0.5*width) {
        /*if rocketX has overshot 0.5*width the assign 0.5*width to rocketX*/
        rocketX = 0.5*width;
      }
    } else {
      rocketX = rocketX + speedX;
      rocketY = rocketY + speedY;

      /*correct for overshoot*/
      if (rocketX > 0.5*width) {
        /*if rocketX has overshot 0.5*width the assign 0.5*width to rocketX*/
        rocketX = 0.5*width;
      }
      if (rocketY > 0.5*height) {
        /*if rockety has overshot 0.5*width the assign 0.5*height to rockety*/
        rocketY = 0.5*height;
      }
    }
  } else if ((rocketX > 0.5*width)&&(rocketY <= 0.5*height)) {
    /*rocket in upper right hand quadrant wrt canvas centre then
     decrease x and increase y*/

    if (rocketY == 0) {
      /*Don't update rocketY if it is 0.5*height*/
      rocketX = rocketX - speedX;

      /*Correct for overshoot*/
      if (rocketX < 0.5*width) {
        rocketX = 0.5*width;
      }
    } else {
      rocketX = rocketX - speedX;
      rocketY = rocketY + speedY;

      /*Correct for overshoot*/
      if (rocketX < 0.5*width) {
        rocketX = 0.5*width;
      }
      if (rocketY > 0.5*height) {
        rocketY = 0.5*height;
      }
    }
  } else if ((rocketX < 0.5*width)&&(rocketY >= 0.5*height)) {
    if (rocketY == 0.5*height) {
      /*Don't update rocketY if it is equal to 0.5*height*/
      rocketX = rocketX + speedX;

      /*correct for overshoot*/
      if (rocketX > 0.5*width) {
        rocketX = 0.5*width;
      }
    } else {
      rocketX = rocketX + speedX;
      rocketY = rocketY - speedY;

      /*correct for overshoot*/
      if (rocketX > 0.5*width) {
        rocketX = 0.5*width;
      }
      if (rocketY < 0.5*height) {
        rocketY = 0.5*height;
      }
    }
  } else if ((rocketX > 0.5*width)&&(rocketY >= 0.5*height)) {
    if (rocketY == 0.5*height) {
      /*Don't update rocketY if it is equal to 0.5*height*/
      rocketX = rocketX -speedX;

      /*Correct for overshoot*/
      if (rocketX < 0.5*width) {
        rocketX = 0.5*width;
      }
    } else {
      rocketX = rocketX -speedX;
      rocketY = rocketY -speedY;

      /*correct for overshoot*/
      if (rocketX < 0.5*width) {
        rocketX = 0.5*width;
      }
      if (rocketY < 0.5*height) {
        rocketY = 0.5*height;
      }
    }
  }
  drawRocket();
}



float pointRocket(float theta) {
  /* returns an angle used to orient the rocket towards the centre of
   the canvas*/
  float alpha =theta;
  if ((rocketX < 0.5*width) && (rocketY <0.5*height)) {
    alpha = PI/2 +theta;
  } else if ((rocketX > 0.5*width)&&(rocketY < 0.5*height)) {
    alpha= -PI/2-theta;
  } else if ((rocketX < 0.5*width)&&(rocketY > 0.5*height)) {
    alpha = PI/2 -theta;
  } else if ((rocketX > 0.5*width)&&(rocketY > 0.5*height)) {
    alpha = -PI/2 +theta;
  }
  return alpha;
}



void detonateRocket() {
  /* Creates a white flash lasting eight frames to simulate explosion 
   Rocket is move out of frame to simulate its destruction. Variables
   rocketFired and rocketExplode are reset to default values of false.*/

  fill(255, 255, 255);// white flash
  rect(0, 0, width, height);
  if (flashDuration < 8) {
    flashDuration++;
  }
  if (flashDuration == 8) {
    flashDuration = 0;
    rocketFired = false;
    rocketDetonated = false;
    /*destroy rocket (move out of frame)*/
    rocketX = -1000;
    rocketY = 2000;
  }

  for (int i=0; i<xPos.length; i++) {                            //rocket damaging enemies 
    for (int m=0; m<xPos[1].length; m++) {
      if (xPos[i][m] > 0 && xPos[i][m] < width && yPos[i][m] > -50) {
        chickenHealth[i][m] = chickenHealth[i][m] - 1;
      }
    }
  }

  for (int i=0; i<asteroidsAmount; i++) {
    if (asteroidsX[i] > 0 && asteroidsX[i] < width && asteroidsY[i] > 0 && asteroidsY[i] < height) {
      asteroidsHealth[i] --;
    }
  }
  if (level8 == true) {
    bigAsteroidsHealth --;
  } else if (level9 == true) {
    ufoHealth --;
  } else if (level10 == true) {
    bossHealth --;
  }
  nextRocket = true;
  rocketCount--;
  explosion = true;
  for (int i=0; i<eggCount; i++) {
    eggX[i] = -300;
  }
}

void changeShips() {              //changing ships in customization menu
  if (pressed == 0) {
    if (keyCode == RIGHT) {
      shipType ++;
    } else if (keyCode == LEFT) {
      shipType --;
    }
    pressed = 1;
  }
}

void keyReleased() {
  pressed = 0;
  keyStroke = true;
}

void displayCustomization() {                                                  //display ships in the customization menu
  if (shipType >= ship.length) {
    shipType = 0;
  } else if (shipType < 0) {
    shipType = ship.length - 1;
  }
  rightShip = shipType +1;                                          //mostly edge cases
  leftShip = shipType -1;
  if (rightShip >= ship.length) {
    rightShip = 0;
  }  
  if (leftShip < 0) {
    leftShip = ship.length - 1;
  }
  image(artwork[shipType], width/2, height/2, width/2.5, width/2.5);                              //main big image
  image(artwork[leftShip], width*0.15, height/2, width/8, width/8);                          //smaller image on the left
  image(artwork[rightShip], width*0.85, height/2, width/8, width/8);                      //smaller image on the right
  text("Preview", width*0.9, height*0.77);
  image(ship[shipType], width*0.9, height*0.87);
}

void drawCustomizationMenu() {                   //draw the customization menu     
  changeShips();
  displayCustomization();                  
  fill(255);
  text(custom, width/2, height*0.25);                                    //display menu title
  textAlign(LEFT);
  textSize(width/75);
  text("Use arrow keys to change ship. Exit to choose current ship", width*0.02, height*0.95);
  drawButton(butTitlesCustMenu, butPositionCustMenu, butPositionCustMenu);
}




void easterEgg() {                      //keyboard recognition for the easter egg
  if (keyStroke == true && keyPressed == true) {
    if ((cheatCode == 0 || cheatCode == 1) && keyCode == DOWN) {
      cheatCode++;
    } else if (cheatCode >= 2 && cheatCode <= 9 && keyCode == UP) {
      cheatCode++;
    } else if (cheatCode == 10 && keyCode == UP) {
      easterEgg = true;
    }
    keyStroke = false;
  }
}



//all the nextWave functions are used for the transition between 2 level. The number is based on the "older" level (or the level you just finished)
void nextWave1() {                      
  textAlign(CENTER);
  fill(255);
  textSize(width/34.15);
  if (levelDelay > 120 && levelDelay < 240) {
    text("WAVE 2", width/2, height*0.45);
    text("CLASSIC INVASION", width/2, height*0.55);
  } else if (levelDelay == 300) {
    frames = 0;
    eggCount = 0;
    boxCount = 0;
    resetLives = true;
    levelDelay = 0;
    level1 = false;
    level2Setup = true;
    moveGrid = true;
  }
}


void nextWave2() {
  textAlign(CENTER);
  fill(255);
  textSize(width/34.15);
  if (levelDelay > 120 && levelDelay < 240) {
    text("WAVE 3", width/2, height*0.45);
    text("ONE MORE TIME", width/2, height*0.55);
  } else if (levelDelay == 300) { 
    frames = 0;
    eggCount = 0;
    boxCount = 0;
    resetLives = true;
    levelDelay = 0;
    level2 = false;
    level3Setup = true;
    moveGrid = true;
  }
}

void nextWave3() {
  textAlign(CENTER);
  fill(255);
  textSize(width/34.15);
  if (levelDelay > 120 && levelDelay < 240) {
    text("WAVE 4", width/2, height*0.45);
    text("METEOR SHOWER", width/2, height*0.55);
  } else if (levelDelay >= 300) {
    frames = 0;
    levelDelay = 0;
    level3 = false;
    level4Setup = true;
  }
}


void nextWave4() {
  textAlign(CENTER);
  fill(255);
  textSize(width/34.15);
  if (levelDelay > 120 && levelDelay < 240) {
    text("WAVE 5", width/2, height*0.45);
    text("ONCOMING!!!", width/2, height*0.55);
  } else if (levelDelay >= 300) {
    frames = 0;
    eggCount = 0;
    boxCount = 0;
    resetLives = true;
    levelDelay = 0;
    level4 = false;
    level5Setup = true;
  }
}

void nextWave5() {
  textAlign(CENTER);
  fill(255);
  textSize(width/34.15);
  if (levelDelay > 120 && levelDelay < 240) {
    text("WAVE 6", width/2, height*0.45);
    text("WATCH YOUR HEAD", width/2, height*0.55);
  } else if (levelDelay >= 300) {
    frames = 0;
    levelDelay = 0;
    level5 = false;
    level6Setup = true;
    resetLives = true;
  }
}


void nextWave6() {
  textAlign(CENTER);
  fill(255);
  textSize(width/34.15);
  if (levelDelay > 120 && levelDelay < 240) {
    text("WAVE 7", width/2, height*0.45);
    text("THIRD TIME LUCKY", width/2, height*0.55);
  } else if (levelDelay >= 300) {
    frames = 0;
    levelDelay = 0;
    level6 = false;
    level7Setup = true;
    resetLives = true;
  }
}

void nextWave7() {
  textAlign(CENTER);
  fill(255);
  textSize(width/34.15);
  if (levelDelay > 120 && levelDelay < 240) {
    text("WAVE 8", width/2, height*0.45);
    text("ASTEROIDS", width/2, height*0.55);
    if (levelDelay % 30 <= 10) {
      textSize(width/40);
      text("No Really!", width/2, height*0.62);
    }
  } else if (levelDelay >= 300) {
    frames = 0;
    levelDelay = 0;
    level7 = false;
    level8Setup = true;
  }
}


void nextWave8() {
  textAlign(CENTER);
  fill(255);
  textSize(width/34.15);
  if (levelDelay > 120 && levelDelay < 240) {
    text("WAVE 9", width/2, height*0.45);
    text("BONUS", width/2, height*0.55);
  } else if (levelDelay >= 300) {
    frames = 0;
    levelDelay = 0;
    level8 = false;
    level9Setup = true;
  }
}

void nextWave9() {
  textAlign(CENTER);
  fill(255);
  textSize(width/34.15);
  if (levelDelay > 120 && levelDelay < 240) {
    text("WAVE 10", width/2, height*0.45);
    text("SHOW 'EM WHO'S BOSS", width/2, height*0.55);
    if (levelDelay % 30 <= 10) {
      textSize(width/45);
      text("Kill Him", width/2, height*0.62);
    }
  } else if (levelDelay >= 300) {
    frames = 0;
    levelDelay = 0;
    level9 = false;
    level10Setup = true;
  }
}

void nextWave10() {
  textAlign(CENTER);
  fill(255);
  textSize(width/34.15);
  if (levelDelay > 120) {
    text("SYSTEM CLEAR", width/2, height*0.45);
    if (levelDelay % 40 <= 30) {
      text("PREPARE FOR WARP", width/2, height*0.55);
    }
  }
  backgroundMultiply += 0.025;
  if (backgroundMultiply >= 10) {
    level10 = false;
    levelCreditSetup = true;
  }
}






//all of the levelSetup functions are used for setting up the level that's about to start
//separate from nextWave functions as this functions executes only once, unlike nextWave executes for ...... amount of frames
void levelOpenSetup() {
  initialiseStory(scrollIntroLines, prologBaseFileName, linePosition, lineDimensions);
  frames = 0;
  levelOpenSetup = false;
  levelOpen = true;
}

void levelTSetup() {
  frames = 0;
  levelTSetup = false;
  levelT = true;
}


void level0Setup() {
  frames = 0;
  backgroundMultiply = 13.05;
  level0 = true;
  level0Setup = false;
  rocketCount = 24;
}

void level1Setup() {
  for (int i=0; i < xPos.length; i++) {                        
    for (int m=0; m < xPos[1].length; m++) {
      randomInterval[i][m] = round(random(30, 60));                //delay for dropping eggs      
      xPos[i][m] = 5000;                                      //move all chicken outside the canvas
      yPos[i][m] = 5000;
    }
  }
  xPos[0][0] = oldX;                                  //keep 1 chicken
  yPos[0][0] = oldY;                
  oldX = width/2;                              //initial value for the random movement of the chicken in the level 1
  oldY = -width/13.66;
  nextX = width/2;                             //moving in the canvas
  nextY = height/5;
  chickenCount = 1;
  level1Setup = false;
  level1 = true;
}


void level2Setup() {
  for (int i=0; i<xPos.length; i++) {                        
    for (int m=0; m<xPos[1].length; m++) {
      randomInterval[i][m] = round(random(160, 240));              
      if (m % 2 == 0) {
        basePosition[m] = -width/13.66 - width*0.67;            //starting position for the chicken formation to move in left to right ỏ right to lèt
      } else if (m % 2 == 1) {
        basePosition[m] = width + width/13.66;
      }
    }
  }
  skipLevel = 0;
  chickenCount = 45;
  level2Setup = false;
  level2 = true;
}



void level3Setup() {
  for (int i=0; i<xPos.length; i++) {                        
    for (int m=0; m<xPos[1].length; m++) {                  //forming the big grid to move into smaller grid
      pXC[i][m] = -width + i*width/4;
      pYC[i][m] = -height + m*height/5;
      xPos[i][m] = pXC[i][m];
      yPos[i][m] = pYC[i][m];
      nXC[i][m] = (i+2)*width/12;
      nYC[i][m] = (m+1)*height/10;
      gridDist[i][m] = dist(pXC[i][m], pYC[i][m], nXC[i][m], nYC[i][m]);
      randomInterval[i][m] = round(random(160, 240));                //delay for dropping eggs
    }
  }
  skipLevel = 0;
  gridProportion = 0.5/dist(xPos[0][0], yPos[0][0], nXC[0][0], nYC[0][0]);
  level3Setup = false;
  level3 = true;
  chickenCount = 45;
}

void level4Setup() {
  for (int i=0; i<asteroidsAmount; i++) {
    asteroidsX[i] = int(random(width));                              //random the starting point ò the áteroids
    asteroidsY[i] = int(random(-width*3, -width/27));
    asteroidsRescale[i] = random(15, 25);
    asteroidsHealth[i] = 7 - round(asteroidsRescale[i]/5);
  }
  skipLevel = 0;
  level4Setup = false;
  level4 = true;
}

void level5Setup() {
  for (int i=0; i < xPos.length; i++) {                        
    for (int m=0; m < xPos[1].length; m++) {
      randomInterval[i][m] = round(random(30, 60));
    }
  }
  skipLevel = 0;
  level5Setup = false;
  level5 = true;
}

void level6Setup() {
  for (int i=0; i < xPos.length; i++) {                        
    for (int m=0; m < xPos[1].length; m++) {
      randomInterval[i][m] = round(random(30, 60));
      xPos[i][m] = randomGaussian() * height/6 + width/4 + (m % 2)*width/2;            //random Gaussian to drop chickens fly near each other
      if (xPos[i][m] > width*0.95) {
        xPos[i][m] = width*0.95;
      } else if (xPos[i][m] < width*0.05) {
        xPos[i][m] = width*0.05;
      }
      yPos[i][m] = randomGaussian() * height/6 - height*m - height/2;
      if (yPos[i][m] < -height*4.75) {
        yPos[i][m] = -height*4.75;
      }
    }
  }
  skipLevel = 0;
  level6Setup = false;
  level6 = true;
}

void level7Setup() {                              //draw the zig zag shape of the formation
  for (int i=0; i < xPos.length; i++) {                        
    for (int m=0; m < xPos[1].length; m++) {
      randomInterval[i][m] = round(random(30, 60));
      if (m % 2 == 0) {
        yPos[i][m] = - height/3 - height*0.05*i - height*m*0.5;
      } else if (m % 2 == 1) {
        yPos[i][m] = - height/3 - height*0.05*(xPos.length - i - 1) - height*m*0.5;
      }
      xPos[i][m] = width/2 + (i-4)*width/9;
    }
  }
  skipLevel = 0;
  level7Setup = false;
  level7 = true;
}

void level8Setup() {                    //setting up the asteroid
  bigAsteroidsX = width/2;
  bigAsteroidsY = -width/4.5;
  bigTouchX = false;
  bigTouchY = false;
  bigDirectionX = 1;
  bigDirectionY = 1;
  bigXSpeed = random(3, 5);
  bigYSpeed = random(3, 5);
  level8Setup = false;
  level8 = true;
  skipLevel = 0;
}

void level9Setup() {
  ufoY = round(height*0.2);                            //coordiantes for the ufo
  ufoX = -width/13;
  for (int i=0; i<ufoBulletX.length; i++) {
    ufoBulletX[i] = -1000;
  }
  level9Setup = false;
  level9 = true;
  skipLevel = 0;
}

void level10Setup() {                //setting up some values for the boss
  pBossX = width/2;
  pBossY = -height/3;
  bossX = pBossX;
  bossY = nBossY;
  nBossX = width/2;
  nBossY = height/3;
  bossSpeed = random(width/545, width/390);
  bossProportion = bossSpeed/dist(nBossX, nBossY, pBossX, pBossY);
  level10Setup = false;
  level10 = true;
  skipLevel = 0;
}

void levelCreditSetup() {
  initialiseStory(epilogueLines, epilogBaseFileName, epilogLinePos, epilogLineDim);
  levelCreditSetup = false;
  levelCredit = true;
  frames = 0;
  backgroundMultiply = 1;
  shipX = -2000;
  for (int i=0; i<eggCount; i++) {
    eggX[i] = -3000;
  }
  pressed = 0;
}




//all of the level functions are used to display things in a level (except for level0 which acts a bit more like the nextWave functions
void levelT() {
  if (frames >= 480 && phase == 2 && mouseButton == LEFT) {                        //use for interacting in the tutorial
    leftButton = 1;
  } else if (frames >= 60 && phase == 3 && mouseButton == RIGHT) {
    rightButton = 1;
  }
  textAlign(CENTER);  
  fill(255);
  textSize(width/85);
  text("Press 'ENTER' to skip", width*0.1, height*0.95);                                      //skip the tutorial level
  if (levelT == true && key == ENTER && keyPressed == true && pressed == 0) {                            
    levelT = false;
    level0Setup = true;
    transition = true;
    pressed = 1;
  }
  textSize(width/34.15);
  if (frames >= 120 && frames <= 240 && phase == 1) {                    //draw the "tutorial" text
    text("TUTORIAL", width/2, height*0.45);
    phase = 1;
  } 
  if (frames >= 300 && frames <= 420 && phase == 1) {                //draw the "move mouse" text
    text("MOVE MOUSE TO MOVE THE SHIP", width/2, height*0.45);
    if (frames >= 420) {
      phase = 2;
    }
  }

  if (frames >= 480 && leftButton == 1 && phase == 2) {              //draw the "good" text when user press shoot
    text("GOOD!!", width/2, height*0.45);
    tutorialFrames++;
    if (tutorialFrames >= 60) {          //show the text for 60 frames
      phase = 3;
      tutorialFrames = 0;
      frames = 0;
    }
  } else if (frames >= 480 && frames <= 600 && phase == 2) {
    text("HOLD LEFT BUTTON TO SHOOT", width/2, height*0.45);          //display the how to shoot text
  }

  if (frames >= 60 && rightButton == 1 && phase == 3) {        //display the good message again, similar to the one above
    text("GOOD!!", width/2, height*0.45);
    tutorialFrames++;
    if (tutorialFrames >= 60) {
      phase = 4;
      tutorialFrames = 0;
      frames = 0;
    }
  } else if (frames >= 60 && frames <= 180 && phase == 3) {                //display the how to shoot rocket text
    text("PRESS RIGHT BUTTON TO FIRE ROCKETS", width/2, height*0.45);
  }

  if (frames >= 60 && frames <= 180 && phase == 4) {                                  //3 rockets, gameplay in a nutshell and good luck text
    text("YOU HAVE 3 ROCKETS", width/2, height*0.45);
  } else if (frames > 180 && frames <= 300 && phase == 4) {
    text("DODGE THE EGGS AND THE ENEMIES. EAT BOXES FOR UPGRADES", width/2, height*0.45);
  } else if (frames > 300 && frames <= 420 && phase == 4) {
    text("OK LET'S PLAY!!!", width/2, height*0.45);
  }
  if (frames == 420 && phase == 4) {        //move to the next level
    levelT = false;
    level0Setup = true;
    transition = true;
  }
}



void level0() {
  textAlign(CENTER);
  fill(255);
  textSize(width/34.15);
  if (frames <= 240) {  
    backgroundMultiply -= 0.05;                                          //changing from warp speed background to normal background
  }
  if (frames >= 120 && frames <= 240) {
    text("ON APPROACHING TO EARTH", width/2, height*0.45);
  } else if (frames >= 300 && frames <= 480) {
    text("WAVE 1", width/2, height*0.45);
    text("INITIAL APPROACH", width/2, height*0.55);
  }
  if (frames > 480) {  
    level1Setup = true;
    level0 = false;
    bulletNo = 0;
  }
  resetLives = true;
}

void level1() {
  if (chickenHealth[0][0] > 0) {
    if (totalDist < 1) {
      proportion = (width/390.0) / dist(nextX, nextY, oldX, oldY);          //proportion of the distance traveled every frame
      randomMove(nextX, nextY, oldX, oldY, totalDist, 0, 0);              //move the chicken randomly
      totalDist += proportion;
    } 
    if (totalDist >= 1) {                                //arrived at the destination
      nextRandom();
      totalDist = 0;
    }
  }
  if (chickenCount == 0 || skipLevel == 1) {
    nextWave1();
    levelDelay++;
  }
}

void level2() {
  if (moveGrid == true) {                            //if the chicken moving formation is active for level 2        
    moveGrid2();
  } else if (moveGrid == false) {
    inGameGrid();
  }
  if (chickenCount == 0 || skipLevel == 1) {
    nextWave2();
    levelDelay++;
  }
}

void level3() {                            //for level 3
  if (moveGrid == true) {
    moveGrid3();
  } else if (moveGrid == false) {
    inGameGrid();
  }
  if (chickenCount <= 0 || skipLevel == 1) {
    nextWave3();
    levelDelay++;
  }
}

void level4() {
  for (int i=0; i<asteroidsAmount; i++) {
    asteroidsY[i] = asteroidsY[i] + asteroidsSpeed;
    asteroids4(i);                      //draw the asteroids
  }
  if (frames >= 750 || skipLevel == 1) {
    nextWave4();
    levelDelay++;
  }
}

void level5() {
  level5Y = level5Y + height/300;
  moveGrid5(level5Y);                  //moving the formation for level 5
  if (frames >= 1650 || skipLevel == 1) {
    nextWave5();
    levelDelay++;
  }
}

void level6() {
  for (int i=0; i<xPos.length; i++) {
    for (int m=0; m<xPos[1].length; m++) {
      yPos[i][m] += height/300;
    }
  }
  if (frames >= 2000 || skipLevel == 1) {
    nextWave6();
    levelDelay++;
  }
}

void level7() {
  for (int i=0; i<xPos.length; i++) {
    for (int m=0; m<xPos[1].length; m++) {
      yPos[i][m] += height/300;
    }
  }
  if (frames >= 1400 || skipLevel == 1) {
    nextWave7();
    levelDelay++;
  }
}

void level8() {
  if (bigAsteroidsY > height*0.05) {
    quitSetup = true;
  }

  if (quitSetup == true) {                  //check if the asteroid hit the wall
    wallX();
    wallY();
  }
  if (bigTouchX == true) {
    bigXSpeed = random(3, 5);                    //what happen when the asteroid touch the wall
    bigTouchX = false;
  }  
  if (bigTouchY == true) {
    bigYSpeed = random(3, 5);
    bigTouchY = false;
  }
  asteroids8(8);                    //display the asteroid
  bigAsteroidsX += bigXSpeed*bigDirectionX;
  bigAsteroidsY += bigYSpeed*bigDirectionY;
  if (bigAsteroidsHealth <= 0 || skipLevel == 1) {
    nextWave8();
    levelDelay++;
  }
}

void level9() {                
  ufoX = ufoX + ufoSpeed;
  ufoFrames ++;
  drawUfo(ufoFrames);                        //drawing the ufo
  hitUfo();
  for (int i=0; i<ufoBulletX.length; i++) {
    ufoBullet(i);                          //drawing the ufo bullets
  }
  if (ufoFrames > 160) {
    ufoFrames = 161;                          //ufo out of the screen
  }
  if (ufoX > width || skipLevel == 1) {
    nextWave9();
    levelDelay++;
  }
}

void level10() {
  if (bossTotal < 1) {
    bossSpeed = random(2.5, 3.5);
    bossProportion = bossSpeed/dist(nBossX, nBossY, pBossX, pBossY);              //proportion of the distance traveled every frame
    bossMove(nBossX, nBossY, pBossX, pBossY, bossTotal);              //move the chicken randomly
    bossTotal += bossProportion;
  } 
  if (bossTotal >= 1) {                                //arrived at the destination
    nBossRandom();
    bossTotal = 0;
  }
  bossAmbient(bossX, bossY, bossHealth * healthMultiply);
  hitBoss();
  eggFrames ++;
  if (frames > 240) {            //dropping a swarm of eggs
    if (eggFrames <= 240 && eggFrames % 10 == 0 && bossHealth > 0) {        //start dropping the eggs after a few seconds of the boss level
      bossEgg(bossX, bossY);
    }  
    if (eggFrames == 360) {                    //dtop dropping the egg            
      eggFrames = 0;
    }
  }
  if (bossHealth <= 0 || skipLevel == 1) {                            //boss died
    if (levelDelay < 24) {
      explosion = true;
    }
    nextWave10();
    levelDelay++;
  }
}

void levelCredit() {
  displayStory(epilogueLines, epilogLinePos, epilogLineDim);                                      
  if (frames >= 1800 || (key == ENTER && keyPressed == true && pressed == 0)) { 
    levelCredit = false;
    resetGame();
    pressed = 1;
    menuState = 1;
  }
}





void drawMainMenu() {
  /* loads a png image called mainMenuArt and draws buttons
   on the menu*/

  image(logo, width*0.265, height*0.15);
  drawButton( "Save the World", buttonPos[0][x], buttonPos[0][y]);
  drawButton( "Customization", buttonPos[1][x], buttonPos[1][y]);
  drawButton( "Difficulty", buttonPos[2][x], buttonPos[2][y]);
  drawButton( "Buy full game", buttonPos[3][x], buttonPos[3][y]);
}


void drawButton(String butTitle, float butX, float butY) {
  /* Draws buttons that scale with the canvas size
   'but' component of parameters and variable names is short for 'button'.
   */

  int opacity = 50; //button opacity.

  //draw button outline
  stroke(255);
  strokeWeight(width/400);
  opacity = buttonOpacity(butX, butY, butWidth, butHeight);
  fill(#2794B9, opacity);
  rect(butX, butY, butWidth, butHeight);

  //add button text
  textAlign(CENTER);
  fill(255); //white menu text
  textSize(width/45.5);
  text(butTitle, butX + butWidth/2, butY + 2*butHeight/3);
}


int buttonOpacity(float butX, float butY, float butWidth, float butHeight) {
  /* increases the opacity of the button if the mouse curser
   is hovering over the button*/

  int opacity = 20;
  if ((mouseX > butX )&&(mouseX < butX + butWidth)) {
    if ((mouseY > butY)&&(mouseY < butY + butHeight)) {
      opacity = 255;
    }
  }
  return opacity;
}


void checkMenuButtonClicked() {
  /* Checks the that the coordinates of a left mouse click
   lie with the geometric bounds of the start button.*/
  int clickX = mouseX, clickY =mouseY;

  if (clickX > buttonPos[0][x] && clickX < buttonPos[0][x] + butWidth) {
    if (clickY > buttonPos[0][y] && clickY < buttonPos[0][y] + butHeight) {
      menuState = 2;
      transition = true;
    } else if (clickY > buttonPos[1][y] && clickY < buttonPos[1][y] + butHeight) {
      menuState = 3;
      transition = true;
    } else if (clickY > buttonPos[2][y] && clickY < buttonPos[2][y] + butHeight) {
      menuState = 4;
      transition = true;
    } else if (clickY > buttonPos[3][y] && clickY < buttonPos[3][y] + butHeight) {
      menuState = 5;
      transition = true;
    }
  }
}

void checkCustMenuButPress() {
  /* Checks the that the coordinates of a left mouse click
   lie with the geometric bounds of the start button.*/
  int clickX = mouseX, clickY =mouseY;
  if (clickX >= butPositionCustMenu && clickX <= butPositionCustMenu + butWidth && clickY >= butPositionCustMenu && clickY <= butPositionCustMenu + butHeight) {
    /* if 'back' button pressed change menuState to 1*/
    menuState = 1;
    transition = true;
  }
}

void drawCursor() {
  image(forkArt, mouseX, mouseY);
}

void clickChicken() {
  if (mousePressed == true) {
    if (mouseX > xPos[0][0] - width/32 && mouseX < xPos[0][0] + width/32 && mouseY < yPos[0][0] + width/10 && mouseY > yPos[0][0]) {
      yPos[0][0] -= height/32;
    }
  }
}

void checkDifficulty() {
  /*check if a difficulty button pressed. If valid
   button pressed change difficulty variable to value 
   corresponding button pressed*/
  int clickX = mouseX;
  int clickY = mouseY;

  if (clickX >= butPositionDiffMenu[0][x] && butPositionDiffMenu[0][x] <= butPositionDiffMenu[0][x] + butWidth) {
    /*Check to see if 'Rookie' level button pressed*/
    if (clickY >= butPositionDiffMenu[0][y] && clickY <= butPositionDiffMenu[0][y] + butHeight) {
      difficulty = 0; 

      /*Check to see if 'Veteran' level button pressed*/
    } else if (clickY >= butPositionDiffMenu[1][y] && clickY <= butPositionDiffMenu[1][y] + butHeight) {
      difficulty = 1;
    }
  }
}

void drawDifficultyMenu() {
  /* Draws the difficulty level menu*/
  displayTitle();

  /*draw 'Rookie' level button*/
  drawButton(butTitleDiffMenu[0], butPositionDiffMenu[0][x], butPositionDiffMenu[0][y]);

  /*draw 'Veteran' level button*/
  drawButton(butTitleDiffMenu[1], butPositionDiffMenu[1][x], butPositionDiffMenu[1][y]);

  /*draw tge 'Back' button'*/
  drawButton(butTitlesCustMenu, butPositionCustMenu, butPositionCustMenu);

  textAlign(LEFT);
  textSize(width/75);
  if (difficulty == 0) {
    text("Current difficulty: Rookie", width*0.02, height*0.95);
  } else if (difficulty == 1) {
    text("Current difficulty: Veteran", width*0.02, height*0.95);
  }
}

void displayTitle() {
  //displays the title of the difficulty level menu
  textSize(60);
  fill(255);
  textAlign(CENTER);
  text(difficultMenuTitle, 0.5*width, 0.25*height);
}


void dlc() {
  textAlign(LEFT);
  textSize(width/54.65);
  fill(255);
  text("Meh, this is the full game already", width*0.03, height*0.15);
  text("But hey, since you're here, I'll tell you something", width*0.03, height*0.2);
  text("Looking through the program, you'll find a cheatcode somewhere. Type it in the main menu, and you will be invincible", width*0.03, height*0.25);
  text("Good luck XD", width*0.03, height*0.3);
  drawButton(butTitlesCustMenu, butPositionCustMenu, butPositionCustMenu);
}
//cheat code: DOWN DOWN UP UP UP UP UP UP UP UP UP  (down twice, up 9 times. Cheat code from Megaman X)



void explosionFX() {                                  //the explosion effect 
  if (explosionFrames % 8 < 2 || (explosionFrames % 8 >= 6 && explosionFrames % 8 < 8)) {
    //explosionX += width/640;
    explosionY += width/320;
  } else if (explosionFrames % 8 >= 2 && explosionFrames % 8 < 6) {
    //explosionX -= width/640;
    explosionY -= width/320;
  }
  if (explosionFrames == 24) {
    explosion = false;
    explosionFrames = 0;
  }
  translate(explosionX, explosionY);
}


void transition() {                              //drawing the fading to black animation when you press a button
  transitionFrames++;
  if (transitionFrames < 8) {
    if (transitionFrames < 4) {
      fill(0, transitionFrames*63.75);            //blackout the screen
    } else if (transitionFrames >= 4 && transitionFrames < 8) {
      fill(0, (255 - (transitionFrames - 4)*63.75));                //stop blaking out the screen (kinda)
    }
    noStroke();
    rect(0, 0, width, height);
  } else if (transitionFrames >= 8) {
    transition = false;                  //stop the animation
    transitionFrames = 0;
  }
}


void resetLives() {
  for (int i=0; i<xPos.length; i++) {                                //starting health point for chickens, different for some level
    for (int m=0; m<xPos[1].length; m++) {
      if (level5 == true || level6 == true) {
        chickenHealth[i][m] = 3 * healthMultiply;
      } else if (level7 == true) {
        chickenHealth[i][m] = 4 * healthMultiply;
      } else {
        chickenHealth[i][m] = 1;
      }
      chickenDied[i][m] = 0;
    }
  }
  resetLives = false;
}


void menuChicken() {
  if (totalDist < 1) {
    proportion = (width/910.0)/dist(nextX, nextY, oldX, oldY);              //proportion of the distance traveled every frame
    randomMove(nextX, nextY, oldX, oldY, totalDist, 0, 0);              //move the chicken randomly
    totalDist = totalDist + proportion;
  } 
  if (totalDist >= 1) {                                //arrived at the destination
    nextRandom();
    totalDist = 0;
  }
}


void rocketGauge() {
  stroke(255);                                            //the small display that shows the rocket amount
  fill(120);
  beginShape();
  vertex(0, height*0.05);
  vertex(width*0.08, height*0.05);
  vertex(width*0.105, 0);
  vertex(0, 0);
  endShape();
  image(rocketLogo, width*0.02, height*0.025);
  textSize(width/50);
  fill(255);
  text(rocketCount/8, width*0.04, height*0.038);
}

void displayStory(PImage[]lines, float[][]linPos, float[][]linDim) {
  //Displays a story in slanted scrolling text.

  for ( int i=0; i<lines.length; i++) {

    //each line of text is displayed acording to its time slot. Slots are separating acording to fDelay

    if (fCounter> fDelay*i && fCounter<fCountBase + fDelay*i) {
      image(lines[i], linPos[i][0], linPos[i][1], linDim[i][0], linDim[i][1]);

      //dividing frame rate by 4 to slowdown scrolling
      if (frameCount%4==0) {
        if (linPos[i][1]> -width/2.732) {//making sure that scrolling will stop
          linPos[i][1]= linPos[i][1]-2;
        }

        if (linDim[i][0]>0) {
          //horizontal dimensions are 9 times vertical dimensions a so must shrink faster
          linDim[i][0] = linDim[i][0]-9;
        } else {
          linDim[i][0] = 0;
        }
        if (linDim[i][1] > 0) {
          linDim[i][1] = linDim[i][1]-1;
        } else {
          linDim[i][0] = 0;
        }
      }
    }
  }
  fCounter++;
  fill(255);
  textSize(width/85);
  text("Press 'ENTER' to skip", width*0.1, height*0.95);
}


void initialiseStory(PImage[] lines, String baseName, float[][] linPos, float[][] linDim) {
  //initialise variables for the slanted, scrolling stories displayed to the screen. These
  //stories include the prologue, the epilogue and the credits.

  fCountBase = int(0.5*height);// fCountBase + fDelay is number frames that textline is displayed

  //Initialising the postions of each of line of text
  for (int i=0; i<linPos.length; i++) {   
    linPos[i][0] = width/2;
    linPos[i][1] = height/2;
  }

  //Intialising the dimensions of each line of scrolling text
  for (int i=0; i<linDim.length; i++) {
    linDim[i][0] = lineW;
    linDim[i][1] = lineH;
  }

  //loading the images of the scrolling text.
  imageMode(CENTER);
  for (int i=0; i<lines.length; i++) {
    lines[i] = loadImage(baseName+(i+1)+".png");
  }
  textSize(width/85);
  fill(255);
  text("Press 'ENTER' to skip", width*0.1, height*0.95);
}

void resetGame() {                            //this function is used to reset values of the game, allow player to play the game again
  transition = true;                          //therefore there are a lot of variables in this function
  bulletNo = 0;
  shipType = 0;
  bulletType = 1;
  bulletLevel = 1;
  mayDay = 0;
  rocketCount = 24;
  resetLives();
  bossHealth = 100;
  bigAsteroidsHealth = 30;
  level1 = false;
  level2 = false;
  level3 = false;
  level4 = false;
  level5 = false;
  level6 = false;
  level7 = false;
  level8 = false;
  level9 = false;
  level10 = false;
  levelOpenSetup = true;
  menuState = 1;
  loseGameFrames = 0;
  tutorialFrames = 0;
  frames = 0;
  levelDelay = 0;
  boxCount = 0;
  eggCount = 0;
  for (int i=0; i<bulletPosX.length; i++) {            
    bulletPosX[i] = 4000;
    bulletPosY[i] = 4000;
    renderBullet[i] = 0;
  }
  bulletSpeed = redBulletSpeed;
  ufoHealth = 0.5;
  ufoBulletCount = 0;
}


//DONE !!!
