void drawMiddleLine(){
  stroke(0,255,0);
  line(0, -height/2, 0, height/2);
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
    line(points.get(points.size()-1)[0], points.get(points.size()-1)[1], mouseX - width/2, mouseY - height/2);
  } else if (points.size() >= 1) {
    line(points.get(points.size()-1)[0], points.get(points.size()-1)[1], mouseX - width/2, mouseY - height/2);
  }
}

void drawHUD(){
  startHUD();
  
  drawStepValue();
  drawHelp();
  
  endHUD();
}

void drawStepValue(){
  String piText = "";
  if(thetaIncrement == PI/2){
    piText = "π/2";
  } else if (thetaIncrement == PI/4) {
    piText = "π/4";
  } else if (thetaIncrement == PI/8) {
    piText = "π/8";
  } else if (thetaIncrement == PI/16) {
    piText = "π/16";
  } else if (thetaIncrement == PI/32) {
    piText = "π/32";
  } else if (thetaIncrement == PI/64) {
    piText = "π/64";
  } else if (thetaIncrement == PI/128) {
    piText = "π/128";
  }
  textSize(50);
  text(piText, width/50, height/10);
}

void drawHelp(){
  String helpText = "Press H for Help";
  textSize(20);
  text(helpText, width/50, height/5);
}

void drawHelpScreen(){
  startHUD();
  
  String line1 = "Draw - ON THE RIGHT OF THE GREEN AXIS - the profile of a figure to get a solid of revolution, rotating it around the green axis.";
  String line2 = "Once you've finished drawing, press ENTER to have the result displayed. Pressing ENTER again will let you draw another figure.";
  String line3 = "Using the arrow keys (up and down) will let you increase and decrease the accuracy of the displaying of the figure (TOP LEFT)";
  String line4 = "To move around the camera, use mouse click. And to zoom in/out use the mouse wheel.";
  String line5 = "PRESS H TO LEAVE HELP";
  textSize(20);
  text(line1, width/50, height/5);
  text(line2, width/50, height/4);
  text(line3, width/50, height/3.5);
  text(line4, width/50, height/3);
  text(line5, width/2, height/2);
  
  endHUD();
}
