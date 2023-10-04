import processing.opengl.*;
PImage img;
PImage img2;

void setup()
{
  size(1280, 720, P3D);

}

float moveArm = 0.1, moveLeg = 0.1, moveShoulder = 0.1, moveKnee = 0.1, moveWaist = 0.1;  
float foward = 1000.0;
float spine1X = 0.0, spine1Y = 0.0, spine1Z = 0.0;
float spine2X = 0.0, spine2Y = 0.0, spine2Z = 0.0; 
float neckX = 0.0, neckY = 0.0, neckZ = 0.0;
float LLegFX = 0.0, LLegFY = 0.0, LLegFZ = 0.0;
float RLegFX = 0.0, RLegFY = 0.0, RLegFZ = 0.0;
float LLegRX = 0.0, LLegRY = 0.0, LLegRZ = 0.0;
float RLegRX = 0.0, RLegRY = 0.0, RLegRZ = 0.0;
float LFootFX = 0.0, LFootFY = 0.0, LFootFZ = 0.0;
float RFootFX = 0.0, RFootFY = 0.0, RFootFZ = 0.0;
float LFootRX = 0.0, LFootRY = 0.0, LFootRZ = 0.0;
float RFootRX = 0.0, RFootRY = 0.0, RFootRZ = 0.0;
float headX = 0.0, headY = 0.0, headZ = 0.0;
float LrearX = 0.0, LrearY = 0.0, LrearZ = 0.0;
float RrearX = 0.0, RrearY = 0.0, RrearZ = 0.0;
float LfrontX = 0.0, LfrontY = 0.0, LfrontZ = 0.0;
float RfrontX = 0.0, RfrontY = 0.0, RfrontZ = 0.0; 
float rota = 0.0;



void draw()
{
  background(155);
  lights();
  pushMatrix();//neck  
    //rotateY(rota);
    fill(0);
    noStroke();
    translate(foward,200,0);
    sphere(10);
    pushMatrix();//neck-rotation
      rotateX(neckX);
      rotateY(neckY);
      rotateZ(neckZ);
      pushMatrix();//front
        stroke(0);
        line(0,30,0,0,0,0);
        pushMatrix();//front-articulation
          fill(0);
          noStroke();
          translate(0,30,0);
          sphere(10);
          pushMatrix();//neck-arm
            stroke(0);
            line(0,-30,0,-200,-30,0);
            pushMatrix();//neck-arm-articulation
              fill(0);
              noStroke();
              translate(-200,-30,0);
              sphere(10);
              pushMatrix();//neck-arm-2
                stroke(0);
                line(0,0,0,0,-30,0);
                pushMatrix();//neck-arm-2-articulation
                  fill(0);
                  noStroke();
                  translate(-0,-30,0);
                  sphere(10);
                  pushMatrix();//neck-hand
                    stroke(0);
                    line(0,0,0,200,0,0);
                    pushMatrix();//neck-hand-articulation
                      fill(0);
                      noStroke();
                      translate(200,0,0);
                      sphere(10);                    
                    popMatrix();//neck-hand-articulation
                  popMatrix();//end-neck-hand
                popMatrix();//end-neck-arm-2-articulation
              popMatrix();//end-neck-arm-2
            popMatrix();//end-neck-arm-articulation
          popMatrix();//end-neck-arm
        pushMatrix();//neck-articulation-rotation
          rotateX(neckX);
          rotateY(neckY);
          rotateZ(neckZ);
          pushMatrix();//left-front
            stroke(0);
            line(0,0,0,0,0,90);
            pushMatrix();//left-front-articulation
              fill(0,255,255);
              noStroke();
              translate(0,0,90);
              sphere(10);
              pushMatrix();//left-front-articulation-rotation
                rotateX(LfrontX);
                rotateY(LfrontY);
                rotateZ(LfrontZ);
                pushMatrix();//left-leg
                  stroke(0);
                  line(0,0,0,50,150,0);
                  pushMatrix();//left-leg-articulation
                    fill(0,255,255);
                    noStroke();
                    translate(50,150,0);
                    sphere(10);
                    pushMatrix();//left-leg-articulation-rotation
                      rotateX(LLegFX);
                      rotateY(LLegFY);
                      rotateZ(LLegFZ);
                      pushMatrix();//left-Knee,
                        stroke(0);
                        line(0,0,0,-20,100,0);
                        pushMatrix();//left-foot-articulation
                          fill(0,255,255);
                          noStroke();
                          translate(-20,100,0);
                          sphere(10);
                          pushMatrix();//left-foot-articulation-rotation
                            rotateX(LFootFX);
                            rotateY(LFootFY);
                            rotateZ(LFootFZ);
                          popMatrix();//left-foot-articulation-rotation-end
                        popMatrix();//left-foot-articulation-end
                      popMatrix();//left-Knee-end
                     popMatrix();//left-leg-articulation-rotation-end
                   popMatrix();////left-leg-articulation-end
                 popMatrix();////left-leg-end
               popMatrix();////left-rear-articulation-rotation-end
             popMatrix();//left-rear-articulation-end
            popMatrix();//left-rear-end
            pushMatrix();;//right-front
              stroke(0);
              line(0,0,0,0,0,-90);
              pushMatrix();//right-front-articulation
                fill(255,255,0);
                noStroke();
                translate(0,0,-90);
                sphere(10);
                pushMatrix();//right-front-articulation-rotation
                  rotateX(RfrontX);
                  rotateY(RfrontY);
                  rotateZ(RfrontZ);
                  pushMatrix();//right-leg
                    stroke(0);
                    line(0,0,0,50,150,0);
                    pushMatrix();//right-leg-articulation
                      fill(255,255,0);
                      noStroke();
                      translate(50,150,0);
                      sphere(10);
                      pushMatrix();//right-leg-articulation-rotation
                        rotateX(RLegFX);
                        rotateY(RLegFY);
                        rotateZ(RLegFZ);
                        pushMatrix();//Right-Knee
                          stroke(0);
                          line(0,0,0,-20,100,0);
                          pushMatrix();//Right-foot-articulation
                            fill(255,255,0);
                            noStroke();
                            translate(-20,100,0);
                            sphere(10);
                            pushMatrix();//Right-foot-articulation-rotation
                              rotateX(RFootFX);
                              rotateY(RFootFY);
                              rotateZ(RFootFZ);
                            popMatrix();//Right-foot-articulation-rotation-end
                          popMatrix();//Right-foot-articulation-end
                        popMatrix();//Right-Knee-end
                       popMatrix();//right-leg-articulation-rotation-end
                      popMatrix();////right-leg-articulation-end
                   popMatrix();////right-leg-end
                popMatrix();////right-front-articulation-rotation-end
              popMatrix();//right-front-articulation-end
            popMatrix();//right-front-end
            pushMatrix();//spine-front
            stroke(0);
            line(0,0,0,-250,0,0);
              pushMatrix();//spine-front-articulation
              fill(0);
              noStroke();
              translate(-250,0,0);
              sphere(10);
                pushMatrix();//spine-front-articulation-rotation
                  rotateX(spine1X);
                  rotateY(spine1Y);
                  rotateZ(spine1Z);
                popMatrix();//spine-front-articulation-rotation-end
              popMatrix();//end-spine-front-articulation
            popMatrix();//end-spine-front
            pushMatrix();//spine-back
            stroke(0);
            line(-250,0,0,-500,0,0);
              pushMatrix();//spine-back-articulation
              fill(0);
              noStroke();
              translate(-500,0,0);
              sphere(10);
                pushMatrix();//spine-back-articulation-rotation
                  rotateX(spine2X);
                  rotateY(spine2Y);
                  rotateZ(spine2Z);
                  pushMatrix();//left-rear
                    stroke(0);
                    line(0,0,0,0,0,90);
                    pushMatrix();//left-rear-articulation
                      fill(0,255,255);
                      noStroke();
                      translate(0,0,90);
                      sphere(10);
                      pushMatrix();//left-rear-articulation-rotation
                        rotateX(LrearX);
                        rotateY(LrearY);
                        rotateZ(LrearZ);
                        pushMatrix();//left-leg
                          stroke(0);
                          line(0,0,0,50,150,0);
                          pushMatrix();//left-leg-articulation
                            fill(0,255,255);
                            noStroke();
                            translate(50,150,0);
                            sphere(10);
                            pushMatrix();//left-leg-articulation-rotation
                              rotateX(LLegRX);
                              rotateY(LLegRY);
                              rotateZ(LLegRZ);
                              pushMatrix();//Left-Knee
                                stroke(0);
                                line(0,0,0,-20,100,0);
                                pushMatrix();//Left-foot-articulation
                                  fill(0,255,255);
                                  noStroke();
                                  translate(-20,100,0);
                                  sphere(10);
                                  pushMatrix();//Left-foot-articulation-rotation
                                    rotateX(LFootRX);
                                    rotateY(LFootRY);
                                    rotateZ(LFootRZ);
                                  popMatrix();//Left-foot-articulation-rotation-end
                                popMatrix();//Left-foot-articulation-end
                              popMatrix();//Left-Knee-end
                            popMatrix();//left-leg-articulation-rotation-end
                          popMatrix();////left-leg-articulation-end
                        popMatrix();////left-leg-end
                      popMatrix();////left-rear-articulation-rotation-end
                    popMatrix();//left-rear-articulation-end
                  popMatrix();//left-rear-end
                  pushMatrix();;//right-rear
                    stroke(0);
                    line(0,0,0,0,0,-90);
                    pushMatrix();//right-rear-articulation
                      fill(255,255,0);
                      noStroke();
                      translate(0,0,-90);
                      sphere(10);
                      pushMatrix();//right-rear-articulation-rotation
                        rotateX(RrearX);
                        rotateY(RrearY);
                        rotateZ(RrearZ);
                        pushMatrix();//right-leg
                          stroke(0);
                          line(0,0,0,50,150,0);
                          pushMatrix();//right-leg-articulation
                            fill(255,255,0);
                            noStroke();
                            translate(50,150,0);
                            sphere(10);
                            pushMatrix();//right-leg-articulation-rotation
                              rotateX(RLegRX);
                              rotateY(RLegRY);
                              rotateZ(RLegRZ);
                              pushMatrix();//Right-Knee
                                stroke(0);
                                line(0,0,0,-20,100,0);
                                pushMatrix();//Right-foot-articulation
                                  fill(255,255,0);
                                  noStroke();
                                  translate(-20,100,0);
                                  sphere(10);
                                  pushMatrix();//Right-foot-articulation-rotation
                                    rotateX(RFootRX);
                                    rotateY(RFootRY);
                                    rotateZ(RFootRZ);
                                  popMatrix();//Right-foot-articulation-rotation-end
                                popMatrix();//Right-foot-articulation-end
                              popMatrix();//Right-Knee-end
                            popMatrix();//right-leg-articulation-rotation-end
                          popMatrix();////right-leg-articulation-end
                        popMatrix();////right-leg-end
                      popMatrix();////right-rear-articulation-rotation-end
                    popMatrix();//right-rear-articulation-end
                  popMatrix();//right-rear-end
                popMatrix();//end-spine-back-articulation-rotation
              popMatrix();//spine-back-articulation-end
            popMatrix();//end-spine-back
          popMatrix();//neck-articulation-rotation-end
        popMatrix();//end-front-rotation
      popMatrix();//end-front
    popMatrix();//end-neck-rotation
  popMatrix();//end-neck
rota += 0.01;
//correr();
}


void correr(){
 

  if (LfrontZ > 0.65 || LfrontZ < -0.65){
    moveLeg = moveLeg *-1;
  }
  
  if (spine2X > 0.1 || spine2X < -0.1){
    moveWaist = moveWaist *-1;
  }

  spine2X = spine2X - moveWaist*0.1;
  neckX = neckX+ moveWaist*0.08;

  LfrontZ = LfrontZ + moveLeg*0.5; 
  RfrontZ = RfrontZ - moveLeg*0.5;
  LLegFZ =5;
  RLegFZ = 5;
  
  LrearZ = LrearZ - moveLeg*0.5;
  RrearZ = RrearZ + moveLeg*0.5;
  LLegRZ = 5;
  RLegRZ = 5;

  
  if(foward > 1400){
  foward = 0;
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
