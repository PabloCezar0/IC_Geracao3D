import processing.opengl.*;
PImage img;
PImage img2;

void setup()
{
  size(1280, 720, P3D);

}

float moveArm = 0.1, moveLeg = 0.1, moveShoulder = 0.1, moveKnee = 0.1, moveWaist = 0.1, moveLegR = -0.1;  
float foward = 580.0;
float waistX = 0.0, waistY = 0.0, waistZ = 0.0;
float spine1X = 0.0, spine1Y = 0.0, spine1Z = 0.0;
float spine2X = 0.0, spine2Y = 0.0, spine2Z = 0.0; 
float spine3X = 0.0, spine3Y = 0.0, spine3Z = 0.0;
float neckX = 0.0, neckY = 0.0, neckZ = 0.0;
float LShoulderX = 0.0, LShoulderY = 0.0, LShoulderZ = 0.0;
float RShoulderX = 0.0, RShoulderY = 0.0, RShoulderZ = 0.0;
float LForearmX = 0.0, LForearmY = 0.0, LForearmZ = 0.0;
float RForearmX = 0.0, RForearmY = 0.0, RForearmZ = 0.0;
float LArmX = 0.0, LArmY = 0.0, LArmZ = 0.0;
float RArmX = 0.0, RArmY = 0.0, RArmZ = 0.0;
float LLegX = 0.0, LLegY = 0.0, LLegZ = 0.0;
float RLegX = 0.0, RLegY = 0.0, RLegZ = 0.0;
float LKneeX = 0.0, LKneeY = 0.0, LKneeZ = 0.0;
float RKneeX = 0.0, RKneeY = 0.0, RKneeZ = 0.0;
float LAnkleX = 0.0, LAnkleY = 0.0, LAnkleZ = 0.0;
float RAnkleX = 0.0, RAnkleY = 0.0, RAnkleZ = 0.0;
float LFootX = 0.0, LFootY = 0.0, LFootZ = 0.0;
float RFootX = 0.0, RFootY = 0.0, RFootZ = 0.0;
float rota = 0.0;




void draw()
{
  background(155);
  lights();
  pushMatrix();//waist
    translate(foward,420,0);
    //rotateY(rota);
    stroke(0);
    line(100, 0,0, 0, 0,0);  
    pushMatrix();//waist articulation
      noStroke();
      fill(0);
      translate(52,0,0);
      sphere(10);
      pushMatrix();//waist articulation rotation
        rotateX(waistX);
        rotateY(waistY);
        rotateZ(waistZ);
        pushMatrix();//spine
          stroke(0);
          line(0,0,0,10,-70,0);
          pushMatrix();//spine articulation;
            fill(0);
            noStroke();
            translate(10,-70,0);
            sphere(10);            
            pushMatrix();//spine articulation rotation
              rotateX(spine1X);
              rotateY(spine1Y);
              rotateZ(spine1Z);
              pushMatrix();//second spine
                stroke(0);
                line(0,0,0,-20,-80,0);                
                pushMatrix();//second spine articulation
                  fill(0);
                  noStroke();
                  translate(-20,-80,0);
                  sphere(10);
                  pushMatrix();////second spine articulaton rotation
                    rotateX(spine2X);
                    rotateY(spine2Y);
                    rotateZ(spine2Z);
                    pushMatrix();//third spine
                      stroke(0);
                      line(0,0,0,5,-40,0);
                      pushMatrix();//third spine articulation
                        fill(0);
                        noStroke();
                        translate(5,-40,0);
                        sphere(10);
                        pushMatrix();//third spine articulation rotation
                          rotateX(spine3X);
                          rotateY(spine3Y);
                          rotateZ(spine3Z);
                          pushMatrix();//neck
                            stroke(0);
                            line(0,0,0,-5,-40,0);
                            pushMatrix();//neck articulation
                              fill(0);
                              noStroke();
                              translate(-5,-40,0);
                              sphere(10);
                              pushMatrix();//neck articulation rotation
                                rotateX(neckX);
                                rotateY(neckY);
                                rotateZ(neckZ);
                              popMatrix();//neck articulation rotation-end
                            popMatrix();//neck articulation-end
                          popMatrix();//neck-end
                          pushMatrix();// right shoulder
                            stroke(0);
                            line(0,0,0,70,0,0);                     
                            pushMatrix();//right shoulder articulation
                              fill(0,255,255);
                              noStroke();
                              translate(70,0,0);
                              sphere(10);
                              pushMatrix();//right shoulder articulation rotation
                                rotateX(RShoulderX);
                                rotateY(RShoulderY);
                                rotateZ(RShoulderZ);
                                pushMatrix();//right forearm
                                  stroke(0);
                                  line(0,0,0,5,100,0);
                                  pushMatrix();//right forearm articulation
                                    fill(0,255,255);
                                    noStroke();
                                    translate(5,100,0);
                                    sphere(10);
                                    pushMatrix();//right forearm articulation rotation
                                      rotateX(RForearmX);
                                      rotateY(RForearmY);
                                      rotateZ(RForearmZ);
                                      pushMatrix();//right arm
                                        stroke(0);
                                        line(0,0,0,8,70,0);
                                        pushMatrix();//right arm articulation
                                          fill(0,255,255);
                                          noStroke();
                                          translate(8,70,0);
                                          sphere(10);
                                          pushMatrix();//rotate right arm articulation
                                            rotateX(RArmX);
                                            rotateY(RArmY);
                                            rotateZ(RArmZ);
                                          popMatrix();//rotate right arm articulation-end
                                        popMatrix();//right arm articulation-end
                                      popMatrix();//right arm-end
                                     popMatrix();//right forearm articulation rotation-end
                                  popMatrix();//right forearm aticulation-end
                                popMatrix();//right forearm-end
                               popMatrix();//right shoulder articulation rotation-end
                            popMatrix();//right shoulder articulation-end
                          popMatrix();//right shoulder-end
                          pushMatrix();//left shoulder
                            stroke(0);
                            line(0,0,0,-70,0,0);
                            pushMatrix();//left shoulder articulation
                              fill(255,255,0);
                              noStroke();
                              translate(-70,0,0);
                              sphere(10);
                              pushMatrix();//left shoulder articulation rotation
                                rotateX(LShoulderX);
                                rotateY(LShoulderY);
                                rotateZ(LShoulderZ);
                                pushMatrix();//left forearm
                                  stroke(0);
                                  line(0,0,0,-5,100,0);
                                  pushMatrix();//left forearm articulation
                                    fill(255,255,0);
                                    noStroke();
                                    translate(-5,100,0);
                                    sphere(10);
                                    pushMatrix();//left forearm articulation rotation
                                      rotateX(LForearmX);
                                      rotateY(LForearmY);
                                      rotateZ(LForearmZ);
                                      pushMatrix();//left arm
                                        stroke(0);
                                        line(0,0,0,5,70,0);
                                        pushMatrix();//left arm articulation
                                          fill(255,255,0);
                                          noStroke();
                                          translate(5,70,0);
                                          sphere(10);
                                          pushMatrix();//left arm articulation rotation
                                            rotateX(LArmX);
                                            rotateY(LArmY);
                                            rotateZ(LArmZ);
                                          popMatrix();////left arm articulation rotation-end
                                        popMatrix();//left arm articulation-end
                                      popMatrix();//left arm-end
                                    popMatrix();//left forearm articulation rotation-end
                                  popMatrix();//left forearm articulation-end
                                popMatrix();//left forearm-end
                              popMatrix();//left shoulder articulation rotation
                            popMatrix();//left shoulder articulation-end
                          popMatrix();//left shoulder-end
                        popMatrix();//third spine articulation rotation-end
                      popMatrix();//third spine articulation-end
                    popMatrix();//third spine-end
                  popMatrix();//second spine articulaton rotation-end
                popMatrix();//second spine articulaton-end
              popMatrix();//second spine-end
            popMatrix();//spine articulation rotation-end
          popMatrix();//spine articulation-end
        popMatrix();//spine-end
      popMatrix();//waist articulation rotation-end
    popMatrix();//waist articulation-end
    pushMatrix();//left leg articulation
      fill(255,255,0);
      translate(0,0,0);
      noStroke();
      sphere(10);
      pushMatrix();//left leg articulation rotation
        rotateX(LLegX);
        rotateY(LLegY);
        rotateZ(LLegZ);
        pushMatrix();//left leg
          stroke(0);
          line(0,0,0,0,100,0);
          pushMatrix();//left knee articulation
            fill(255,255,0);
            noStroke();
            translate(0,100,0);
            sphere(10);
            pushMatrix();//left knee articulation rotation
              rotateX(LKneeX);
              rotateY(LKneeY);
              rotateZ(LKneeZ);
              pushMatrix();//left ankle
                stroke(0);
                line(0,0,0,0,100,0);
                pushMatrix();//left ankle articulation
                  fill(255,255,0);
                  noStroke();
                  translate(0,100,0);
                  sphere(10);
                  pushMatrix();//left ankle articulation rotation
                    rotateX(LAnkleX);
                    rotateY(LAnkleY);
                    rotateZ(LAnkleZ);
                    pushMatrix();//left foot
                      stroke(0);
                      line(0,0,0,15,40,0);
                      pushMatrix();//left foot articulation
                        fill(255,255,0);
                        noStroke();
                        translate(15,40,0);
                        sphere(10);
                        pushMatrix();//left foot articulation rotation
                          rotateX(LFootX);
                          rotateY(LFootY);
                          rotateZ(LFootZ);
                        popMatrix();//left foot articulation rotation-end
                      popMatrix();//left foot articulation-end
                    popMatrix();//left foot-end
                  popMatrix();//left ankle articulation rotation-end
                popMatrix();//left ankle articulation-end
              popMatrix();//left ankle-end
            popMatrix();////left knee articulation rotation-end
          popMatrix();//left knee articulation-end
        popMatrix();//left leg-end
      popMatrix();//left leg articulation rotation-end
    popMatrix();//left leg articulation-end
    pushMatrix();//right leg articulation
      fill(0,255,255);
      translate(100,0,0);
      sphere(10);
      noStroke();
      pushMatrix();//right leg articulation rotation
        rotateX(RLegX);
        rotateY(RLegY);
        rotateZ(RLegZ);
        pushMatrix();//right leg
          stroke(0);
          line(0,0,0,0,100,0);
          pushMatrix();//right knee articulation
            fill(0,255,255);
            noStroke();
            translate(0,100,0);
            sphere(10);
            pushMatrix();//right knee articulation rotation
              rotateX(RKneeX);
              rotateY(RKneeY);
              rotateZ(RKneeZ);
              pushMatrix();//right ankle
                stroke(0);
                line(0,0,0,0,100,0);
                pushMatrix();//right ankle articulation
                  fill(0,255,255);
                  noStroke();
                  translate(0,100,0);
                  sphere(10);
                  pushMatrix();//right ankle articulation rotation
                    rotateX(RAnkleX);
                    rotateY(RAnkleY);
                    rotateZ(RAnkleZ);
                    pushMatrix();//right foot
                      stroke(0);
                      line(0,0,0,15,40,0);
                      pushMatrix();//right foot articulation
                        fill(0,255,255);
                        translate(15,40,0);
                        noStroke();
                        sphere(10);
                        pushMatrix();//right foot articulation rotation
                          rotateX(RFootX);
                          rotateY(RFootY);
                          rotateZ(RFootZ);
                        popMatrix();//right foot articulation rotation-end
                      popMatrix();//right foot articulation-end
                    popMatrix();//right foot-end
                  popMatrix();////right ankle articulation rotation-end
                popMatrix();//right ankle articulation-end
              popMatrix();//right ankle-end
            popMatrix();////right knee articulation rotation
          popMatrix();//right knee articulation-end
         popMatrix();//right leg-end
       popMatrix();//right leg articulation rotation-end
    popMatrix();//right leg articulation-end
    
  popMatrix();//waist-end

rota = rota + 0.01;

//cintura();
//braco();
//correr();



}

void correr(){
 

  if (LForearmX > 0.2 || LForearmX < -0.2){
    moveArm = moveArm *-1;
  }
  
  if (LShoulderX > 0.8 || LShoulderX < -0.8){
    moveShoulder = moveShoulder *-1;
  }
  
  if(LLegX > 0.3){
    moveLeg = moveLeg *-1;
    LKneeX = 0;
  }
  
  if(LLegX <-1.5 ){
    moveLeg = moveLeg *-1;
    LKneeX = -0.5;
  }
  
  if(RLegX > 0.3){
    moveLegR = moveLegR *-1;
    RKneeX = 0;
  }
  if(RLegX <-1.5 ){
    moveLegR = moveLegR *-1;
    RKneeX = -0.5;
  }
  
  if(LKneeX > 1 || LKneeX < 0){
    moveKnee = moveKnee * -1;
  }
  
  
  LLegX = LLegX + moveLeg;
  RLegX = RLegX + moveLegR;
  LForearmX = -80;
  RForearmX = -80;
  LShoulderX = LShoulderX + moveShoulder;
  RShoulderX = RShoulderX - moveShoulder;


  
  if(foward > 1400){
  foward = 0;
  }

}


void cintura(){
  
  
  if (waistX > 0 || waistX < -1.8){
    moveWaist = moveWaist *-1;
  }

  waistX = waistX + moveWaist;

}


void braco(){


  if (LShoulderZ > 2.0 || LShoulderZ < -0.2){
    moveShoulder = moveShoulder *-1;
  }

 LShoulderZ = LShoulderZ + moveShoulder;
 RShoulderZ = RShoulderZ - moveShoulder;

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
