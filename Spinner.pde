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
    for (int i = 0; i < sections; i++) {
      if (i % 2 == 0) fill(0);
      else fill(255);
      arc(x, y, radius, radius, 2 * PI * (i/sections), 2 * PI * ((i + 1)/sections));
    }
  }
}
