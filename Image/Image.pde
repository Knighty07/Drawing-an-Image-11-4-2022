//Background Image Example //<>//
//
//Global Variables
int appWidth, appHeight;
float smallerDimension, largerDimension;
Boolean widthLarger=false, heightLarger=false;
float imageWidthRatio=0.0, imageHeightRatio=0.0;
float backgroundImageX, backgroundImageY, backgroundImageWidth, backgroundImageHeight;
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
/* Older algorithm
 if ( widthLarger == true ) imageWidthRatio = largerDimension / largerDimension;
 if ( widthLarger == true ) imageHeightRatio = smallerDimension / largerDimension;
 if ( heightLarger == true ) imageWidthRatio = smallerDimension / largerDimension;
 if ( heightLarger == true ) imageHeightRatio = largerDimension / largerDimension;
 */
float picWidthAdjusted, picHeightAdjusted;
//Better Iamge Stretch Algorithm
if ( appWidth >= picWidth ) {
  picWidthAdjusted = picWidth;
} else {
  if ( widthLarger == true ) imageWidthRatio = largerDimension / largerDimension;
  if ( heightLarger == true ) imageWidthRatio = smallerDimension / largerDimension;
}
if ( appHeight >= picHeight ) {
  picWidthAdjusted = picWidth;
} else {
  if ( widthLarger == true ) imageHeightRatio = smallerDimension / largerDimension;
  if ( heightLarger == true ) imageHeightRatio = largerDimension / largerDimension;
}
  //Image smaller than CANVAS needs seperate algorithm
  println (appWidth, imageWidthRatio);
  println (appHeight, imageHeightRatio);
  
picWidthAdjusted = appWidth * imageWidthRatio;
picHeightAdjusted = appHeight * imageHeightRatio;
//
println (appWidth, picWidth, picWidthAdjusted);
println (appHeight, picHeight, picHeightAdjusted);
//
//Population
pic = loadImage("../Used Images/Space image.jpg");
backgroundImageX = appWidth*0;
backgroundImageY = appHeight*0;
backgroundImageWidth = appWidth-1;
backgroundImageHeight = appHeight-1;
//
//Rectangular Layout and Image Drawing to CANVAS
//Note: Dimensions are found in the image
// file/Right Click / Properites / Details

//if() {} else for a Binary Choice, no single IF
//tint(50,255); //use 1/2 tint value for white  (I.E. 128/256=1/2)
//tint (128,128,50); //RGB 
//tint(153, 204, 126); //RGB: Night Mode
//tint (255, 255, 255); //RBG: Daytime Mode
//rect( imageBackgroundX, imageBackgroundY, imageBackgroundWidth, imageBackgroundHeight);
//
if (nightMode == false);
tint (255, 255, 255);
if (nightMode == true); 
tint (153, 204, 126);
//
//image( pic, backgroundImageX, backgroundImageY, backgroundImageWidth, backgroundImageHeight);
image( pic, backgroundImageX, backgroundImageY, picWidthAdjusted, picHeightAdjusted);
