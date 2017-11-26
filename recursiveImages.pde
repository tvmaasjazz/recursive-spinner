Spinner spinner;

void setup() {
  size(displayWidth, displayHeight);

  spinner = new Spinner(width/2, height/2, 400, 1, 10, 0.00005);
}

void draw() {
  background(255);

  displaySpinner(width/2, height/2, 600, 0.00005);
}

void displaySpinner(float x, float y, float radius, float spinRate) {
  Spinner s = new Spinner(x, y, radius, 1, 10, spinRate);
  s.display();

  if (radius > 200) {
    displaySpinner(x + radius / 2, y, radius / 2, spinRate * 3);
    displaySpinner(x, y + radius / 2, radius / 2, spinRate * 3);
    displaySpinner(x - radius / 2, y, radius / 2, spinRate * 3);
    displaySpinner(x, y - radius / 2, radius / 2, spinRate * 3);
  }
}