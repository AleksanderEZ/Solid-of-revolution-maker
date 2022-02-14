import java.util.List;
import java.util.LinkedList;

int width = 800;
int height = 600;
int black = 0;
int white = 255;
List<Float[]> points = new LinkedList<Float[]>();
float pointRadius = 10;

boolean drawingPhase;
boolean viewingPhase = false;

void settings() {
  size(width, height);
}

void setup() {
  background(black);
  stroke(white);
  drawingPhase = true;
}

void draw() {
  background(black);
  if(drawingPhase){
    drawMiddleLine();
    drawSavedPoints();
    drawLinesBetweenPoints();
  }
}

void drawMiddleLine(){
  stroke(0,255,0);
  line(width/2, 0, width/2, height);
  stroke(white);
}

void drawSavedPoints(){
  for(Float [] point: points){
    circle(point[0], point[1], pointRadius);
  }
}

void drawLinesBetweenPoints(){
  if(points.size() >= 2){
    for(int i = 0; i < points.size()-1; i++){
      line(points.get(i)[0], points.get(i)[1], points.get(i+1)[0], points.get(i+1)[1]);
    }
    line(points.get(points.size()-1)[0], points.get(points.size()-1)[1], mouseX, mouseY);
  }
}

void mousePressed(){
  float x = mouseX;
  float y = mouseY;
  if(x >= width/2){
    Float [] savedPointsCopy = {x, y};
    points.add(savedPointsCopy);
    mousePressed = false;
  }
}

void keyPressed(){
  if(keyCode == ENTER){
    drawingPhase = false;
    viewingPhase = true;
  }
}
