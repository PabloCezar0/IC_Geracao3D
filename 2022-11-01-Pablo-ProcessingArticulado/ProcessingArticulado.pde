import processing.opengl.*;
PImage img;
PImage img2;

void setup()
{
  size(1280, 720, OPENGL);
   img = loadImage("5.png");
   img2 = loadImage("4.png");
   delay(1500);
}


float i = 0, ia = 0, baixo = 0, frame = 0, tras = 0, joe = 0, jor = 0, trasL=0;
float ae = 0, ar = 0, waist = 0;
float k = 0.01,ka = 0.01, l;
float frente = 0, bracoE = 0, bracoD = 0, pernaE = 0, pernaD = 0, joelhoE = 0, joelhoD = 0, antebracoE = 0, antebracoD = 0, varB = 0.075, varP = 0.1, varJ = 0.1, pescoco = 0,pescocoT = 0, vaP = 5;
float transition = 0;


void draw()
{
  background(img);
  lights();

  //body
 pushMatrix();
 noStroke();
 fill(255, 255, 0);
 translate( 300, 300, 0);
 //rotateY(300);
 rotateX(300); 
 drawCylinder( 30, 60, 200 );
   pushMatrix();
    //neck
     fill(0, 0,0 );
     translate( 0, 0, -155);
     drawCylinder(28, 20, 100 );
     pushMatrix();//head neck articulation
     fill(0,0,0);
     translate(0,0, -25);
     sphere(20);
       pushMatrix();
         pushMatrix();
          //head
          fill(0,0,0);
          translate(0, 0, -25);
          sphere(60);
         popMatrix();
        popMatrix();
     popMatrix();
  popMatrix();
  pushMatrix();//left arm articulation
    fill(0,0,0);
    translate(80, 0, -80);
    sphere(20);
    pushMatrix();
    rotateX(bracoE);
      pushMatrix();
        //left forearm
        fill(0, 255, 0);
        translate( 0, 0, 70);
        drawCylinder(28, 20, 125 );
        pushMatrix();// //left forearm articulation
          fill(0,0,0);
          translate(0,0, 70);
          sphere(20);
          pushMatrix();
          rotateX(antebracoE);
            pushMatrix();
               //left arm
                fill(0, 0,0 );
                translate( 0, 0, 70);
                 drawCylinder(28, 20, 125 );
            popMatrix();
          popMatrix();
         popMatrix();
      popMatrix();
    popMatrix();
  popMatrix();
  pushMatrix();//Right arm articulation
    fill(0,0,0);
    translate(-80, 0, -80);
    sphere(20);
    pushMatrix();
    rotateX(bracoD);
      pushMatrix();
        //right forearm
        fill(0, 255, 0);
        translate( 0, 0, 70);
        drawCylinder(28, 20, 125 );
        pushMatrix();//right forearm articulation
           fill(0,0,0);
          translate(0, 0, 70);
          sphere(20);
          pushMatrix();
          rotateX(antebracoD);
            pushMatrix();
               //right arm
                fill(0, 0,0 );
                translate( 0, 0, 70);
                 drawCylinder(28, 20, 125 );
            popMatrix();
          popMatrix();
         popMatrix();
      popMatrix();
    popMatrix();
  popMatrix();
    //waist
    fill(0, 255, 0);
    translate( 0, 0, 120 );
    drawCylinder( 30, 60, 40 );
    pushMatrix();//Left Leg Articulation
    fill(0,0,0);
    translate(35, 0, 32);
    sphere(20);
    pushMatrix();//rotate articulation]
    rotateX(pernaE);
        pushMatrix();
           //left leg
           fill(255, 255, 0);
           translate( 0, 0, 60);
           drawCylinder(32, 20, 125 );
             pushMatrix();//left knee
              fill(0,0,0);
              translate(0, 0, 60);
              sphere(20);
              pushMatrix();//rotate Knee
              rotateX(joelhoE);
                 pushMatrix();
                 //left leg
                 fill(0, 0, 0);
                 translate( 0, 0, 75);
                 drawCylinder(32, 20, 125 );
                 popMatrix();
              popMatrix();
           popMatrix();
          popMatrix();
        popMatrix();
      popMatrix();
      pushMatrix();//Right Leg Articulation
        fill(0,0,0);
        translate(-35, 0, 32);
        sphere(20);
        pushMatrix();
        rotateX(pernaD);
          pushMatrix();
            //right leg
            fill(255, 255, 0);
            translate( 0, 0, 60);
            drawCylinder(32, 20, 125 );
            pushMatrix();//right knee
              fill(0,0,0);
              translate(0, 0, 60);
              sphere(20);
              pushMatrix();//rotate Knee
              rotateX(joelhoD);
                  pushMatrix();
                  //right leg
                  fill(0, 0,0);
                  translate( 0, 0, 75);
                  drawCylinder(32, 20, 125 );  
                  popMatrix();
              popMatrix();
            popMatrix();
          popMatrix();
        popMatrix();
     popMatrix();
popMatrix();



//if (frame < 180){
//andar();
//}

//else{
//correr();
//}

correr();
print(vaP);
frame ++;  
}


void nodyes(){
  if(pescocoT >= 30.0){
    vaP = vaP*-1;
  }
  if(pescocoT <= -30.0){
  vaP = vaP*-1;
  }
  pescocoT  += vaP;
  
  
}


void andar(){
  
  

frente = frente +3;
antebracoE = 0;
antebracoD = 0;

if (bracoE > 0.5 || bracoE < -0.5){
  varB = varB *-1;
}

if(pernaE > 0.8 || pernaE <-0.8 ){
 varP = varP *-1;
}


if(joelhoE > 1 || joelhoE < 0){
varJ = varJ * -1;
}



pernaE = pernaE + varP*0.5;
pernaD = pernaD - varP*0.5;
bracoE = bracoE + varB*0.5;
bracoD = bracoD - varB*0.5;
joelhoE = joelhoE + varJ*0.5;
joelhoD = joelhoD + varJ*0.5;



if(frente > 1400){
frente = 0;
}


}


void correr(){
 
transition = transition + 0.01;

if(transition <= 1){

frente = frente +3;
antebracoE = antebracoE - 0.01;
antebracoD = antebracoD - 0.01;

}

else{
frente = frente +8;
}


if (bracoE > 0.8 || bracoE < -0.8){
  varB = varB *-1;
}


if(pernaE > 1.3 || pernaE <-1.5 ){
 varP = varP *-1;
}

if(joelhoE > 1 || joelhoE < 0){
varJ = varJ * -1;
}



if (transition <= 1){
  
pernaE = pernaE + varP*transition;
pernaD = pernaD - varP*transition;
bracoE = bracoE + varB*transition;
bracoD = bracoD - varB*transition;
joelhoE = joelhoE + varJ*transition;
joelhoD = joelhoD + varJ*transition;

}

else{

pernaE = pernaE + varP;
pernaD = pernaD - varP;
bracoE = bracoE + varB;
bracoD = bracoD - varB;
joelhoE = joelhoE + varJ;
joelhoD = joelhoD + varJ;

}

if(frente > 1400){
frente = 0;
}



}

void drawCylinder( int sides, float r, float h)
{
  float angle = 360 / sides;
  float halfHeight = h / 2;

  // draw top of the tube
  beginShape();
  for (int i = 0; i < sides; i++) {
    float x = cos( radians( i * angle ) ) * r;
    float y = sin( radians( i * angle ) ) * r;
    vertex( x, y, -halfHeight);
  }
  endShape(CLOSE);

  // draw bottom of the tube
  beginShape();
  for (int i = 0; i < sides; i++) {
    float x = cos( radians( i * angle ) ) * r;
    float y = sin( radians( i * angle ) ) * r;
    vertex( x, y, halfHeight);
  }
  endShape(CLOSE);

  // draw sides
  beginShape(TRIANGLE_STRIP);
  for (int i = 0; i < sides + 1; i++) {
    float x = cos( radians( i * angle ) ) * r;
    float y = sin( radians( i * angle ) ) * r;
    vertex( x, y, halfHeight);
    vertex( x, y, -halfHeight);
  }
  endShape(CLOSE);
}
