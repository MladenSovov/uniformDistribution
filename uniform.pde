/**
 * uniform distribution.case snow
 * by Mladen SAVOV
 */

int rateValue = 1000;

PShape squareOut;
PShape squareIn;
PShape bar1;
PShape bar2;
PShape bar3;//invisible
PShape bar4;//invisible

float u1=350;
float v1=200;
float D1=300;
float D2=300;

float b1=350;
float c1=550;
float w1=300;
float h1=33;

float b2=350;
float c2=550;
float w2=300;
float h2=33;

float b3=350;
float c3=690;
float w3=300;
float h3=33;

float b4=350;
float c4=710;
float w4=300;
float h4=33;

float numberOfPoints=1;
float numberOfInPoints=0;
float proportionBar=0.5;
float proportion=0.5;

void setup(){
  size(1000, 800);
  noiseSeed(1000);
  noStroke();
  //stroke(0, 10);
  frameRate(rateValue);
  background(29,29,29);
  squareOut = createShape(RECT,u1,v1,D1,D2);
  squareOut.setFill(color(33, 33, 33));
  //squareOut.setStroke(color(255, 255, 255));
  //stroke(0,0,0);
  shape(squareOut);
  float d1=D1*proportion;
  float d2=D2*proportion;
  float x1=u1;
  float y1=v1+D2-d2;
  drawSquareIn();
  
  
  bar1 = createShape(RECT,b1,c1,w1,h1);
  bar1.setFill(color(69, 69, 69));
  //bar1.setStroke(color(255, 255, 255));
  
}

void draw() {
 // background(0,0,133);

   float d1=D1*proportion;
   float d2=D2*proportion;
   float x1=u1;
   float y1=v1+D2-d2;

 
  /*quad(u1, v1, u2, v2, u3, v3, u4, v4);*/
  /*noFill();*/
  /*quad(x1, y1, x2, y2, x3, y3, x4, y4);*/
  /*noFill();*/
  /*quad(b1, c1, b2, c2, b3, c3, b4, c4);*/
  /*noFill();*/
  /*quad(bb1, cc1, bb2, cc2, bb3, cc3, bb4, cc4);*/
  
  
  
  //stroke(5,5,5);
  shape(bar1);
 
  
  float randomX=random(u1,u1+D1);
  float randomY=random(v1,v1+D2);
  stroke(214,214,214);
  ellipse(randomX,randomY,3,3);
  fill(color(233,233,233));
  if(randomX<u1+d1&&randomY>v1+D2-d2){
  numberOfInPoints++;
}

//if(in==true){
 // numberOfInPoints++;
//}
  proportionBar=numberOfInPoints/numberOfPoints;
  stroke(14,14,14);
  bar2 = createShape(RECT,b2,c2,w2*proportionBar,h2);
  bar2.setFill(color(0, 133, 255));
  //bar2.setStroke(color(253, 5, 17));
  shape(bar2);
  /*line(n, 0, n, height);*/
  String t = str(Math.round(proportionBar*100)/(100.0));
  textSize(19);
  text(t, b2+5, c2+5, w2*proportionBar, h2);
  numberOfPoints++;
  /*clear();*/
  
  
  bar3=createShape(RECT,b3,c3,w3,h3);
  bar3.setFill(color(29, 29, 29));
  bar3.setStroke(color(29, 29, 29));
  shape(bar3);
  String nx = "Nx="+str(numberOfInPoints);//+"  "+"/";
    
  textSize(19);
  //text(nx, b3, v1+D2+2.5*h3+1, w2*proportionBar, h2);
  text(nx, b3+5, c3, b3+D1/2, h3);
  //text(n, b3+110, v1+D2+2.5*h2+1, w2*proportionBar, h2);
  
  bar4=createShape(RECT,b4,c4,w4,h4);
  bar4.setFill(color(29, 29, 29));
  bar4.setStroke(color(29, 29, 29));
  shape(bar4);
  String n = "N="+str(numberOfPoints);
  
  textSize(19);
  text(n, b4+5, c4, w4, h4);
}
void mouseWheel(MouseEvent event) {
  float e = event.getCount();
  if(e<0){
    if(proportion+0.1<=1){
      background(0,0,0);
  proportion=proportion+0.1;
  numberOfPoints=1;
  numberOfInPoints=0;
  //stroke(0,0,0);
  shape(squareOut);
  drawSquareIn();
  //textIt();
  }
  }
  if(e>0){
    if(proportion-0.1>0.3){
      background(33,33,33);
  proportion=proportion-0.1;
  numberOfPoints=1;
  numberOfInPoints=0;
  stroke(133,133,133);
  shape(squareOut);
  drawSquareIn();
  }
  }
  }
  public void drawSquareIn(){
   float d1=D1*proportion;
   float d2=D2*proportion;
   float x1=u1;
   float y1=v1+D2-d2;
   PShape square; 
  square=createShape(RECT,x1,y1,d1,d2);
  //stroke(155,155,155);
  shape(square);
  
  square.setFill(color(123, 123, 123));
  square.setStroke(color(133, 133, 133));
  
  fill(color(233,233,233));
  String s = "Sx/S="+str(Math.round(proportion*proportion*100)/(100.0));
  textSize(19);
  text(s, x1+5, v1+D2+1, d1, d2+5.5);
    
  String ss = "Nx/N";
  textSize(19);
  text(ss, x1+5, 590, d1, d2+5.5);
  return;
  }