Spinner spinner;

void setup() {
  size(displayWidth, displayHeight);

  spinner = new Spinner(400, 400, 200, 1, 6, 1);
}

void draw() {
  background(255);

  spinner.display();
}