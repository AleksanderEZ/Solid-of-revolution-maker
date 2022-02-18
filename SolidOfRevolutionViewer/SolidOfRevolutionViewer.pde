import java.util.List;
import java.util.LinkedList;

int width = 1280;
int height = 720;
int black = 0;
int white = 255;

float pointRadius = 10;

boolean drawingPhase = true;
boolean viewingPhase = false;
boolean helpPhase = false;

void settings() {
  size(width, height, P3D);
}

void setup() {
  stroke(white);
  surface.setResizable(false);
  surface.setTitle("Solid of revolution viewer");
  frameRate(120);
  initCamera();
}

void draw() {
  background(black);
  if(!helpPhase){
    translate(width/2, height/2, 0);
    if(drawingPhase){
      drawMiddleLine();
      drawSavedPoints();
      drawLinesBetweenPoints();
    } else if(viewingPhase){
      shape(object3D);
    }
    drawHUD();
  } else {
    drawHelpScreen();
  }
}

void mousePressed(){
  if(drawingPhase && !helpPhase){
    float x = mouseX - width/2;
    float y = mouseY - height/2;
    if(x >= 0){
      Float [] savedPointsCopy = {x, y, 0f};
      points.add(savedPointsCopy);
      mousePressed = false;
    }
  }
}

void keyPressed(){
  if(!helpPhase){
    if(keyCode == ENTER || keyCode == RETURN){
      if(drawingPhase){
        if(!points.isEmpty()){
          drawingPhase = false;
          viewingPhase = true;
          buildShape();
          playCamera();
        }
      } else if(viewingPhase){
        drawingPhase = true;
        viewingPhase = false;
        resetPoints();
        stopCamera();
      }
    }
    if(keyCode == UP){
      incrementStep();
    }
    if(keyCode == DOWN){
      decrementStep();
    }
  }
  if(key == 'H' || key == 'h'){
    helpPhase = !helpPhase; 
  }
}
