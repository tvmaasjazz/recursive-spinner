void setup() {
  size(displayWidth, displayHeight);
  noCursor();
}

void draw() {
  background(0);

  // create spinners array and add to it recursively
  Spinner[] spinners = {};
  spinners = (Spinner[]) concat(spinners, createSpinner(width/2, height/2, 400, 0.00005, spinners));

  // loop through to display them
  for(int i = 0; i < spinners.length; i++) {
    spinners[i].display();
  }
}

Spinner[] createSpinner(float x, float y, float radius, float spinRate, Spinner[] spinners) {
  // add new spinner
  Spinner newSpinner = new Spinner(x, y, radius, 1, 10, spinRate);
  spinners = (Spinner[]) append(spinners, newSpinner);

  // recurse through all four sides and concat them to the spinner array  
  if (radius > 20) {
    spinners = (Spinner[]) concat(concat(concat(
      concat(createSpinner(x + radius / 2, y, radius / 2, spinRate * 3, spinners), spinners),
      concat(createSpinner(x, y + radius / 2, radius / 2, spinRate * 3, spinners), spinners)),
      concat(createSpinner(x - radius / 2, y, radius / 2, spinRate * 3, spinners), spinners)),
      concat(createSpinner(x, y - radius / 2, radius / 2, spinRate * 3, spinners), spinners));
  }

  return spinners;
}