import java.util.List;

List<Float[]> points = new ArrayList<Float[]>();
List<Float[]> pointBuffer = new ArrayList<Float[]>();

PShape object3D;
float thetaIncrement = PI/8; //angle step between rotated faces. the smaller the more defined the figure

void buildShape() {
  object3D = createShape();
    
  object3D.beginShape(TRIANGLE_STRIP);
  object3D.stroke(white);
  object3D.fill(150, 255, 50, 255);
  object3D.strokeWeight(2);
  
  pointBuffer.addAll(points);
  for(float theta = 0; theta < TWO_PI; theta += thetaIncrement){
    for(int i = 0; i < points.size(); i++){
      float x = pointBuffer.get(i)[0];
      float y = pointBuffer.get(i)[1];
      float z = pointBuffer.get(i)[2];
      float x2 = x * cos(thetaIncrement) - z * sin(thetaIncrement);
      float z2 = x * sin(thetaIncrement) + z * cos(thetaIncrement);
      triangleSide(new Float[] {x, y, z}, new Float[] {x2, y, z2});
      pointBuffer.set(i, new Float[] {x2, y, z2});
    }  
  }
  closeFinalGap();
  object3D.endShape(CLOSE);
}

void triangleSide(Float[] vertex1, Float[] vertex2){
  object3D.vertex(vertex1[0],vertex1[1],vertex1[2]);
  object3D.vertex(vertex2[0],vertex2[1],vertex2[2]);
}

void closeFinalGap(){
  float x = pointBuffer.get(0)[0];
  float y = pointBuffer.get(0)[1];
  float z = pointBuffer.get(0)[2];
  float x2 = x * cos(thetaIncrement) - z * sin(thetaIncrement);
  float z2 = x * sin(thetaIncrement) + z * cos(thetaIncrement);
  triangleSide(new Float[] {x, y, z}, new Float[] {x2, y, z2});
}

void resetPoints(){
  points.clear();
  pointBuffer.clear();
}

void incrementStep(){
  if (thetaIncrement * 2 <= PI/2){
    thetaIncrement *= 2;
  }
  if (viewingPhase){
    buildShape();
  }
}

void decrementStep(){
  if (thetaIncrement / 2 >= PI/128){
    thetaIncrement /= 2;
  }
  if (viewingPhase){
    buildShape();
  }
}
