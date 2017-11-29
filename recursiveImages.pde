void setup() {
  size(displayWidth, displayHeight);
  noCursor();
}

void draw() {
  background(120, 180, 255, 100);

  // create spinners array and add to it recursively
  Spinner[] spinners = {};
  spinners = (Spinner[]) concat(spinners, createSpinner(width/2, height/2, 200, 0.00005, spinners));

  // loop through to display them
  for(int i = 0; i < spinners.length; i++) {
    spinners[i].display();
  }
}

Spinner[] createSpinner(float x, float y, float radius, float spinRate, Spinner[] spinners) {
  // add new spinner
  Spinner newSpinner = new Spinner(x, y, radius, 1, 50, spinRate);
  spinners = (Spinner[]) append(spinners, newSpinner);

  // recurse through all four sides and concat them to the spinner array 
  if (radius > 60) {
    spinners = (Spinner[]) concat(concat(concat(
      concat(createSpinner(x + (radius / 1.5 + radius / 1.1), y, radius / 1.5, spinRate * 3, spinners), spinners),
      concat(createSpinner(x, y + (radius / 1.5 + radius / 1.1), radius / 1.5, spinRate * 3, spinners), spinners)),
      concat(createSpinner(x - (radius / 1.5 + radius / 1.1), y, radius / 1.5, spinRate * 3, spinners), spinners)),
      concat(createSpinner(x, y - (radius / 1.5 + radius / 1.1), radius / 1.5, spinRate * 3, spinners), spinners));
  }

  return spinners;
}