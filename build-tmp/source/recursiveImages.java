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
  

  spinner = new Spinner(width/2, height/2, 400, 1, 10, 0.00005f);
}

public void draw() {
  background(255);

  // generate an array of all of them
  createSpinner(width/2, height/2, 600, 0.00005f);

  // loop through and display them
}

public void createSpinner(float x, float y, float radius, float spinRate) {
  Spinner s = new Spinner(x, y, radius, 1, 10, spinRate);
  s.display();

  if (radius > 200) {
    createSpinner(x + radius / 2, y, radius / 2, spinRate * 3);
    createSpinner(x, y + radius / 2, radius / 2, spinRate * 3);
    createSpinner(x - radius / 2, y, radius / 2, spinRate * 3);
    createSpinner(x, y - radius / 2, radius / 2, spinRate * 3);
  }
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
    float tempSpinRate = spinRate;
    float tempRadius = radius;

    while (tempRadius > 10  ) {
      float spinPosition = millis() * tempSpinRate;

      for (int i = 0; i < sections; i++) {
        if (i % 2 == 0) fill(0);
        else fill(255);
        arc(x, y, tempRadius, tempRadius,
          2 * PI * (i/sections) + spinPosition,
          2 * PI * ((i + 1)/sections) + spinPosition);
      }

      tempRadius *= 0.75f;
      tempSpinRate *= 1.3f;
    }
  }
}

// go down in size while radius greater than ___
// only difference with smaller one is radius and each one faster spinRate
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
