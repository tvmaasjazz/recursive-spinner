Spinner spinner;

void setup() {
  size(displayWidth, displayHeight);

  spinner = new Spinner(width/2, height/2, 400, 1, 10, 0.00005);
}

void draw() {
  background(255);

  // generate an array of all of them
  createSpinner(width/2, height/2, 600, 0.00005);

  // loop through and display them
}

void createSpinner(float x, float y, float radius, float spinRate) {
  Spinner s = new Spinner(x, y, radius, 1, 10, spinRate);
  s.display();

  if (radius > 200) {
    createSpinner(x + radius / 2, y, radius / 2, spinRate * 3);
    createSpinner(x, y + radius / 2, radius / 2, spinRate * 3);
    createSpinner(x - radius / 2, y, radius / 2, spinRate * 3);
    createSpinner(x, y - radius / 2, radius / 2, spinRate * 3);
  }
}