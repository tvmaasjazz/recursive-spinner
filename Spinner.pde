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

  void display() {
    float tempSpinRate = spinRate;
    float tempRadius = radius;

    while (tempRadius > 10) {
      float spinPosition = millis() * tempSpinRate;

      for (int i = 0; i < sections; i++) {
        if (i % 2 == 0) fill(0);
        else fill(255);
        arc(x, y, tempRadius, tempRadius,
          2 * PI * (i/sections) + spinPosition,
          2 * PI * ((i + 1)/sections) + spinPosition);
      }

      tempRadius *= 0.75;
      tempSpinRate *= 1.3;
    }
  }
}

// go down in size while radius greater than ___
// only difference with smaller one is radius and each one faster spinRate