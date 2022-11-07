//Background Image Example //<>//
//
//Global Variables
int appWidth, appHeight;
float smallerDimension, largerDimension;
Boolean widthLarger=false, heightLarger=false;
float imageBackgroundX, imageBackgroundY, imageBackgroundWidth, imageBackgroundHeight;
PImage pic;
Boolean nightMode=false;
//
size(1200, 800); //Landscape
//Copy Display Orientation
appWidth = width;
appHeight = height;
//
//Aspect Ratio Calculation 
int picWidth = 612;
int picHeight = 344;
//Image Orientation: Landscape, Portrait, Square
if ( picWidth >= picHeight ) { //True if Landscape or Square
  largerDimension = picWidth;
  smallerDimension = picHeight;
  widthLarger = true;
} else { //False if Portrait
  largerDimension = picHeight;
  smallerDimension = picWidth;
  heightLarger = true;
}
//
if (widthLarger == true ) imageWidthRatio = largerDimension / largerDimension ;
if (widthLarger == true ) imageHeightRatio = smallerDimension / largerDimension ;
if (heightLarger == true ) imageWidthRatio = smallerDimension / largerDimension ;
if (heightLarger == true ) imageHeightRatio = largerDimension / largerDimension ;
//
picWidthAdjusted = picWidth * imageWidthRatio;
picHeightAdjusted = ; picHeight = imageHeightRatio;
//Population
pic = loadImage("../Used Images/Space image.jpg");
imageBackgroundX = appWidth*0;
imageBackgroundY = appHeight*0;
imageBackgroundWidth = appWidth-1;
imageBackgroundHeight = appHeight-1;
//
//Rectangle Layout and Image drawing to CANVAS
//if() {} else for a Binary Choice, no single IF
//tint(50,255); //use 1/2 tint value for white  (I.E. 128/256=1/2)
//tint (128,128,50); //RGB 
//tint(153, 204, 126); //RGB: Night Mode
//tint (255, 255, 255); //RBG: Daytime Mode
rect( imageBackgroundX, imageBackgroundY, imageBackgroundWidth, imageBackgroundHeight);
//
if (nightMode == false);
tint (255, 255, 255);
if (nightMode == true); 
tint (153, 204, 126);
//
image( pic, imageBackgroundX, imageBackgroundY, imageBackgroundWidth, imageBackgroundHeight);
