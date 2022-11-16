//Background Image Example //<>//
//Global Variables
int appWidth, appHeight;
Boolean widthLarger=false, heightLarger=false;
Boolean widthLarger2=false, heightLarger2=false;
float picWidthAdjusted=0.0, picHeightAdjusted=0.0;
float imageWidthRatio=0.0, imageHeightRatio=0.0;
float picWidthAdjusted2=0.0, picHeightAdjusted2=0.0;
float backgroundImageX, backgroundImageY, backgroundImageWidth, backgroundImageHeight;
PImage pic, pic2, pic3;
Boolean nightMode=false;
int tintDayMode=255, tintDayModeOpacity;
int tintRed=70, tintGreen=70, tintBlue=48, tintNightModeOpacity=20;
float topHalfX, topHalfY, topHalfWidth, topHalfHeight;
float bottomHalfX, bottomHalfY, bottomHalfWidth, bottomHalfHeight;
//

void setup()
{
  size(1200, 800); //Landscape
  //Copy Display Algorithm from Hello World
  appWidth = width;
  appHeight = height;
  //
  //Population
  //
  pic = loadImage("../Used Images/Space image.jpg"); //NEEDS FIX
  pic2 = loadImage("Teyvat.jpg"); //NEEDS FIX
  pic3 = loadImage("");
  backgroundImageX = appWidth*0;
  backgroundImageY = appHeight*0;
  backgroundImageWidth = appWidth-1;
  backgroundImageHeight = appHeight-1;
  //Rectangular Layout and Image Drawing to CANVAS
  
  //Generating two shapes to add images in
  topHalfX= appWidth * 1/4;
  topHalfY= appHeight * 1/12;
  topHalfWidth= appWidth * 1/2;
  topHalfHeight= appHeight * 2/7;
  bottomHalfX= appWidth * 1/4;
  bottomHalfY= appHeight * 1/12;
  bottomHalfWidth= appHeight *1/2;
  bottomHalfHeight= appHeight * 2/7;

  //Image Dimensions for Aspect Ratio
  //Note: Dimensions are found in the image file / Right Click / Properties / Details
  int picWidth = 612;
  int picHeight = 344;
  int pic2Width = 474 ;//Landscape
  int pic2Height= 472 ;//Landscape
  // int pic3Width =;
  // int pic3Height=;//
  float smallerDimension, largerDimension, smallerDimension2, largerDimension2;
  //
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

  if ( pic2Width >= pic2Height ) { //True if Landscape or Square
    largerDimension2 = pic2Width;
    smallerDimension2 = pic2Height;
    widthLarger2 = true;
    //Landscaoe Large Image to larger space OR smaller space
  } else { //False if Portrait
    largerDimension2 = pic2Height;
    smallerDimension2 = pic2Width;
    heightLarger2 = true;
  }
  //
  float picWidthAdjusted=0.0, picHeightAdjusted=0.0;
  float imageWidthRatio2=0.0, imageHeightRatio2=0.0;
  //Teaching example, width is known to be larger
  //Better Image Stretch Algorithm, smaller image to larger CANVAS
  if ( appWidth >= picWidth ) {
    picWidthAdjusted = appWidth;
    //
    if ( widthLarger == true ) imageWidthRatio = largerDimension / largerDimension;
    //
    if ( appHeight >= picHeight ) {
      if ( widthLarger == true ) imageHeightRatio = smallerDimension / largerDimension;
      picHeightAdjusted = picWidthAdjusted * imageHeightRatio;
      if (appHeight < picHeightAdjusted ) {
        println("The image is too big for CANVAS");
        exit(); //stops any further use of APP
        //Remember: goal is 1:1 aspect ratio
      }
    } else {
      //Image smaller than CANVAS needs separate algorithm
    }
  } else {
    //Image smaller than CANVAS needs separate algorithm
  }
  //
  //Image is either larger or smaller than rect (including CANVAS)
  //Glitch or Waves image: Landscape into Landscape
 if ( widthLarger2 == true ) { //Lanscape or Square is TRUE
    picWidthAdjusted2 = topHalfWidth;
    imageHeightRatio2 = smallerDimension2 / largerDimension2;
    picHeightAdjusted2 = picWidthAdjusted2 * imageHeightRatio2;
  } else { //Portrait is TRUE, heightLarger2==true
    picHeightAdjusted2 = topHalfHeight;
    imageWidthRatio2 = smallerDimension2 / largerDimension2;
    picWidthAdjusted2 = picHeightAdjusted2 * imageWidthRatio2;
  }
  //Verifying Variable Values after algoroithm
  println("App Width:", appWidth, " and App Height:", appHeight);
  println("Larger Image dimension is:", largerDimension);
  println("Image dimensions are:", picWidth, picHeight);
  println("Adjusted Image dimesnions are (stretch is goal):", picWidthAdjusted, picHeightAdjusted);
  //
 println("Image Width:", pic2Width, " and Image Height:", pic2Height);
  println("Larger Image dimension is:", widthLarger2, "or", heightLarger2);
  println("Rectangle dimensions are:", topHalfWidth, topHalfHeight);
  println("Scale Ratios, width: ", "height is", imageHeightRatio2); 
  println("Adjusted Image 2 dimensions are (stretch is goal):", picWidthAdjusted2, picHeightAdjusted2);
  //

 rect( backgroundImageX, backgroundImageY, backgroundImageWidth, backgroundImageHeight );
  rect(topHalfX, topHalfY, topHalfWidth, topHalfHeight);
  rect(bottomHalfX, bottomHalfY, bottomHalfWidth, bottomHalfHeight);
  //
  //Background Image must be single executed code
  if (nightMode == false) tint(tintDayMode, tintDayModeOpacity); //Gray Scale: use 1/2 tint value for white (i.e. 128/256=1/2)
  if (nightMode == true) tint(tintRed, tintGreen, tintBlue, tintNightModeOpacity);
  //image( pic, backgroundImageX, backgroundImageY, backgroundImageWidth, backgroundImageHeight);
  image( pic, backgroundImageX, backgroundImageY, picWidthAdjusted, picHeightAdjusted);
  //
}//End setup
//
void draw() {
    image( pic2, topHalfX, topHalfY, picWidthAdjusted2, picHeightAdjusted2 );
  //image(bottomHalfX, bottomHalfY, bottomHalfWidth, bottomHalfHeight);
}//End draw
void keyPressed() {
}//End keyPressed

void mousePressed() {
  //
  //Mouse Pressed will control background image
  if (mouseButton == LEFT) {
    nightMode = false;
    rect( backgroundImageX, backgroundImageY, backgroundImageWidth, backgroundImageHeight );
    tint(tintDayMode, tintDayModeOpacity); //Gray Scale: use 1/2 tint value for white (i.e. 128/256=1/2)
    image( pic, backgroundImageX, backgroundImageY, picWidthAdjusted, picHeightAdjusted);
    //
  }
  if (mouseButton == RIGHT) {
    nightMode = true;
    rect( backgroundImageX, backgroundImageY, backgroundImageWidth, backgroundImageHeight );
    tint(tintRed, tintGreen, tintBlue, tintNightModeOpacity); //RGB: Night Mode
    image( pic, backgroundImageX, backgroundImageY, picWidthAdjusted, picHeightAdjusted);
  }
}//End mousePressed
//
//End Main Program
