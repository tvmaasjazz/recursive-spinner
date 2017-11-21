import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class recursiveImages extends PApplet {

Spinner spinner;

public void setup() {
  

  spinner = new Spinner(400, 400, 200, 1, 6, 1);
}

public void draw() {
  background(255);

  spinner.display();
}
class Spinner {
  float x, y, radius, spinRate;
  float depth, sections;

  Spinner(float _x, float _y, float _radius, float _depth, float _sections, float _spinRate) {
    x = _x;
    y = _y;
    radius = _radius;
    depth = _depth;
    sections = _sections;
    spinRate = _spinRate;
  }

  public void display() {
    for (int i = 0; i < sections; i++) {
      if (i % 2 == 0) fill(0);
      else fill(255);
      arc(x, y, radius, radius, 2 * PI * (i/sections), 2 * PI * ((i + 1)/sections));
    }
  }
}

// display one spinner, no levels deep
  public void settings() {  size(displayWidth, displayHeight); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "--present", "--window-color=#000000", "--hide-stop", "recursiveImages" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
