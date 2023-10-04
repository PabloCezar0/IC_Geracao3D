import processing.opengl.*;
PImage img;
PImage img2;
PImage[] images = new PImage[73]; // Crie um array para armazenar as imagens

void setup()
{
  size(1280, 720, P3D);
   for (int i = 0; i < 73; i++) {
    // Formate o número do arquivo com zeros à esquerda (por exemplo, 001, 002, 010, etc.)
    String filename = nf(i + 1, 3) + ".jpg";
    images[i] = loadImage(filename);
  }

}

float moveArm = 0.1, moveLeg = 0.1, moveShoulder = 0.1, moveKnee = 0.1, moveWaist = 0.1;  
float foward = 1000.0;
float neckX = 0.0, neckY = 0.0, neckZ = 0.0;
float fspineX = 0.0, fspineY = 0.0, fspineZ = 0.0;
float lforearmX = 0.0, lforearmY = 0.0, lforearmZ = 0.0;
float larm1X = 0.0, larm1Y = 0.0, larm1Z = 0.0;
float larm2X = 0.0, larm2Y = 0.0, larm2Z = 0.0;
float lhandX = 0.0, lhandY = 0.0, lhandZ = 0.0;
float rforearmX = 0.0, rforearmY = 0.0, rforearmZ = 0.0;
float rarm1X = 0.0, rarm1Y = 0.0, rarm1Z = 0.0;
float rarm2X = 0.0, rarm2Y = 0.0, rarm2Z = 0.0;
float rhandX = 0.0, rhandY = 0.0, rhandZ = 0.0;
float bspineX = 0.0, bspineY = 0.0, bspineZ = 0.0;
float bendX = 0.0, bendY = 0.0, bendZ = 0.0;
float tail1X = 0.0, tail1Y = 0.0, tail1Z = 0.0;
float tail2X = 0.0, tail2Y = 0.0, tail2Z = 0.0;
float llegX = 0.0, llegY = 0.0, llegZ = 0.0; 
float lknee1X = 0.0, lknee1Y = 0.0, lknee1Z = 0.0;
float lknee2X = 0.0, lknee2Y = 0.0, lknee2Z = 0.0;
float lfootX = 0.0, lfootY = 0.0, lfootZ = 0.0;
float rlegX = 0.0, rlegY = 0.0, rlegZ = 0.0; 
float rknee1X = 0.0, rknee1Y = 0.0, rknee1Z = 0.0;
float rknee2X = 0.0, rknee2Y = 0.0, rknee2Z = 0.0;
float rfootX = 0.0, rfootY = 0.0, rfootZ = 0.0;
float rota = 0.0;



void draw()
{

  background(155);
  lights();
  pushMatrix();//neck articulation 
    //rotateY(rota);
    fill(0);
    noStroke();
    translate(foward,150,0);
    sphere(10);
    pushMatrix();
      rotateX(neckX);
      rotateY(neckY);
      rotateZ(neckZ);
     pushMatrix();//upper-jaw
        stroke(0);
        line(0,0,0,60,0,0);
     popMatrix();//end-upper-jaw
     pushMatrix();//lower-jaw
        stroke(0);
        line(0,0,0,50,30,0);
     popMatrix();//end-lower-jaw
    pushMatrix();//neck
      stroke(0);
      line(0,0,0,-150,75,0);
      pushMatrix();//front-spine-articulation
        fill(0);
        noStroke();
        translate(-150,75,0);
        sphere(10);
        pushMatrix();
          rotateX(fspineX);
          rotateY(fspineY);
          rotateZ(fspineZ);
        pushMatrix();//front-spine
          stroke(0);
          line(0,0,0,-150,10,0);
          pushMatrix();//left-front
            stroke(0);
            line(0,0,0,0,0,40);
            pushMatrix();//left-forearm-articulation
              fill(0,255,255);
              noStroke();
              translate(0,0,40);
              sphere(10);
              pushMatrix();
                rotateX(lforearmX);
                rotateY(lforearmY);
                rotateZ(lforearmZ);
              pushMatrix();//left-forearm
                stroke(0);
                line(0,0,0,50,50,0);
                pushMatrix();//left-arm1-articulation
                  fill(0,255,255);
                  noStroke();
                  translate(50,50,0);
                  sphere(10);
                  pushMatrix();
                    rotateX(larm1X);
                    rotateY(larm1Y);
                    rotateZ(larm1Z);
                  pushMatrix();//left-arm1
                    stroke(0);
                    line(0,0,0,-30,60,0);
                    pushMatrix();//left-arm2-articulation
                      fill(0,255,255);
                      noStroke();
                      translate(-30,60,0);
                      sphere(10);
                      pushMatrix();
                        rotateX(larm2X);
                        rotateY(larm2Y);
                        rotateZ(larm2Z);
                      pushMatrix();//left-arm2
                        stroke(0);
                        line(0,0,0,50,-10,0);
                        pushMatrix();//left-hand-articulation
                          fill(0,255,255);
                          noStroke();
                          translate(50,-10,0);
                          sphere(10);
                          pushMatrix();
                            rotateX(lhandX);
                            rotateY(lhandY);
                            rotateZ(lhandZ);
                          popMatrix();
                        popMatrix();//end-left-hand-articulation
                      popMatrix();//end-left-arm2
                      popMatrix();
                    popMatrix();//left-arm2-articulation-end
                  popMatrix();//end-left-arm1
                  popMatrix();
                popMatrix();//end-left-arm1-articulation
              popMatrix();//end-left-forearm
              popMatrix();
            popMatrix();//end-left-forearm-articulation
          popMatrix();//end-left-front
          pushMatrix();//right-front
            stroke(0);
            line(0,0,0,0,0,-40);
            pushMatrix();//right-forearm-articulation
              fill(255,255,0);
              noStroke();
              translate(0,0,-40);
              sphere(10);
              pushMatrix();
                rotateX(rforearmX);
                rotateY(rforearmY);
                rotateZ(rforearmZ);
              pushMatrix();//right-forearm
                stroke(0);
                line(0,0,0,50,50,0);
                pushMatrix();//right-arm1-articulation
                  fill(255,255,0);
                  noStroke();
                  translate(50,50,0);
                  sphere(10);
                  pushMatrix();
                    rotateX(rarm1X);
                    rotateY(rarm1Y);
                    rotateZ(rarm1Z);
                  pushMatrix();//right-arm1
                    stroke(0);
                    line(0,0,0,-30,60,0);
                    pushMatrix();//right-arm2-articulation
                      fill(255,255,0);
                      noStroke();
                      translate(-30,60,0);
                      sphere(10);
                      pushMatrix();
                        rotateX(rarm2X);
                        rotateY(rarm2Y);
                        rotateZ(rarm2Z);
                      pushMatrix();//right-arm2
                        stroke(0);
                        line(0,0,0,50,-10,0);
                        pushMatrix();//right-hand-articulation
                          fill(255,255,0);
                          noStroke();
                          translate(50,-10,0);
                          sphere(10);
                          pushMatrix();
                            rotateX(rhandX);
                            rotateY(rhandY);
                            rotateZ(rhandZ);
                        popMatrix();//end-right-hand-articulation
                        popMatrix();
                      popMatrix();//end-right-arm2
                      popMatrix();
                    popMatrix();//left-right-articulation-end
                    popMatrix();
                  popMatrix();//end-right-arm1
                  popMatrix();
                popMatrix();//end-right-arm1-articulation
              popMatrix();//end-right-forearm
              popMatrix();
            popMatrix();//end-right-forearm-articulation
          popMatrix();//end-right-front
          pushMatrix();//back-spine-articulation
            fill(0);
            noStroke();
            translate(-150,10,0);
            sphere(10);
            pushMatrix();
              rotateX(bspineX);
              rotateY(bspineY);
              rotateZ(bspineZ);
            pushMatrix();//back-spine
              stroke(0);
              line(0,0,0,-120,10,0);
              pushMatrix();//back-end-articulation
                fill(0);
                noStroke();  
                translate(-120,10,0);
                sphere(10);
                pushMatrix();
                  rotateX(bendX);
                  rotateY(bendY);
                  rotateZ(bendZ);
                pushMatrix();//tail1
                  stroke(0);
                  line(0,0,0,-200,10,0);
                  pushMatrix();//tail1-articulation
                    fill(0);
                    noStroke();
                    translate(-200,10,0);
                    sphere(10);
                    pushMatrix();
                      rotateX(tail1X);
                      rotateY(tail1Y);
                      rotateZ(tail1Z);
                    pushMatrix();//tail2;
                      stroke(0);
                      line(0,0,0,-200,10,0);
                    popMatrix();//end-tail2
                  popMatrix();//end-tail1-articulation
                popMatrix();//end-tail1
                pushMatrix();//left-back
                  stroke(0);
                  line(0,0,0,0,0,40);
                  pushMatrix();//left-leg-articulation
                    fill(0,255,255);
                    noStroke();
                    translate(0,0,40);
                    sphere(10);
                    pushMatrix();
                      rotateX(llegX);
                      rotateY(llegY);
                      rotateZ(llegZ);
                    pushMatrix();//left-leg
                      stroke(0);
                      line(0,0,0,50,120,0);
                      pushMatrix();//left-knee-articulation
                        fill(0,255,255);
                        noStroke();
                        translate(50,120,0);
                        sphere(10);
                        pushMatrix();
                          rotateX(lknee1X);
                          rotateY(lknee1Y);
                          rotateZ(lknee1Z);
                        pushMatrix();//left-knee
                          stroke(0);
                          line(0,0,0,-30,90,0);
                          pushMatrix();//left-knee2-articulation
                            fill(0,255,255);
                            noStroke();
                            translate(-30,90,0);
                            sphere(10);
                            pushMatrix();
                              rotateX(lknee2X);
                              rotateY(lknee2Y);
                              rotateZ(lknee2Z);
                            pushMatrix();//left-knee2
                              stroke(0);
                              line(0,0,0,20,55,0);
                              pushMatrix();//left-foot-articulation
                                fill(0,255,255);
                                noStroke();
                                translate(20,55,0);
                                sphere(10);
                                pushMatrix();
                                  rotateX(lfootX);
                                  rotateY(lfootY);
                                  rotateZ(lfootZ);
                                popMatrix();
                              popMatrix();//end-left-foot-articulation
                            popMatrix();//end-left-knee2
                            popMatrix();
                          popMatrix();//left-knee2-articulation-end
                        popMatrix();//end-left-knee1
                        popMatrix();
                      popMatrix();//end-left-knee1-articulation
                    popMatrix();//end-left-leg
                    popMatrix();
                  popMatrix();//end-left-leg-articulation
                popMatrix();//end-left-back
                pushMatrix();//right-back
                  stroke(0);
                  line(0,0,0,0,0,-40);
                  pushMatrix();//right-leg-articulation
                    fill(255,255,0);
                    noStroke();
                    translate(0,0,-40);
                    sphere(10);
                    pushMatrix();
                      rotateX(rlegX);
                      rotateY(rlegY);
                      rotateZ(rlegZ);
                    pushMatrix();//right-leg
                      stroke(0);
                      line(0,0,0,50,120,0);
                      pushMatrix();//right-knee-articulation
                        fill(255,255,0);
                        noStroke();
                        translate(50,120,0);
                        sphere(10);
                        pushMatrix();
                          rotateX(rknee1X);
                          rotateY(rknee1Y);
                          rotateZ(rknee1Z);
                        pushMatrix();//right-knee
                          stroke(0);
                          line(0,0,0,-30,90,0);
                          pushMatrix();//right-knee2-articulation
                            fill(255,255,0);
                            noStroke();
                            translate(-30,90,0);
                            sphere(10);
                            pushMatrix();
                              rotateX(rknee2X);
                              rotateY(rknee2Y);
                              rotateZ(rknee2Z);
                            pushMatrix();//right-knee2
                              stroke(0);
                              line(0,0,0,20,55,0);
                              pushMatrix();//right-foot-articulation
                                fill(255,255,0);
                                noStroke();
                                translate(20,55,0);
                                sphere(10);
                                pushMatrix();
                                  rotateX(rfootX);
                                  rotateY(rfootY);
                                  rotateZ(rfootZ);
                                popMatrix();
                              popMatrix();//end-right-foot-articulation
                            popMatrix();//end-right-knee2
                            popMatrix();
                          popMatrix();//end-right-knee2-articulation
                        popMatrix();//end-left-knee1
                        popMatrix();
                      popMatrix();//end-left-knee1-articulation
                    popMatrix();//end-left-leg
                    popMatrix();
                  popMatrix();//end-left-leg-articulation
                popMatrix();//end-right-back
                sphere(10);
                popMatrix();
              popMatrix();//end-back-end-articulation
            popMatrix();//end-back-spine
            popMatrix();
          popMatrix();//end-back-spine-articulation
        popMatrix();//end-front-spine  
        popMatrix();
      popMatrix();//end-front-spine-articulation
    popMatrix();//end-neck 
    popMatrix();
  popMatrix();//end-neck-articulation
  //correrREX();
rota += 0.01;

}

void correr(){
  
  if (llegZ > 0.65 || llegZ < -0.65){
    moveLeg = moveLeg *-1;
  }
 
  if (fspineX > 0.3 || fspineX < -0.3){
    moveWaist = moveWaist *-1;
  }
 
 if (lforearmZ > 0.9 || lforearmZ < -0.8){
    moveArm = moveArm *-1;
  }
 
 
 llegZ = llegZ+ moveLeg;
 lknee1Z = lknee1Z + moveLeg*0.8;
 lknee2Z = lknee2Z + moveLeg*0.8;
 
 
 
 rlegZ = rlegZ - moveLeg;
 rknee1Z = rknee1Z - moveLeg*0.8;
 rknee2Z = rknee2Z - moveLeg*0.8;
 
 
 fspineX = fspineX + moveWaist;
 
 lforearmZ = lforearmZ + moveArm*0.8;
 rforearmZ = rforearmZ - moveArm*0.8;
 
 bendZ = bendZ + moveWaist;
 tail1Z = tail1Z + moveWaist*0.5;



}

void correrREX(){
  
  if (llegZ > 0.65 || llegZ < -0.65){
    moveLeg = moveLeg *-1;
  }
 
  if (fspineX > 0.3 || fspineX < -0.3){
    moveWaist = moveWaist *-1;
  }
 
 if (lforearmZ > 0.9 || lforearmZ < -0.8){
    moveArm = moveArm *-1;
  }
 
 
 llegZ = llegZ+ moveLeg*0.25;
 lknee1Z = lknee1Z + moveLeg*0.05;
 lknee2Z = lknee2Z + moveLeg*0.05;
 

 rlegZ = rlegZ - moveLeg*0.25;
 rknee1Z = rknee1Z - moveLeg*0.05;
 rknee2Z = rknee2Z - moveLeg*0.05;
 
 
 fspineX = fspineX + moveWaist*0.12;
 
 lforearmZ = 1;
 rforearmZ = 1;
 
 larm2Z = larm2Z + moveWaist*0.35;
 rarm2Z = rarm2Z - moveWaist*0.35;
 
 tail1Z = tail1Z + moveWaist*0.05;
 bendZ = bendZ * moveWaist*0.05;


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
