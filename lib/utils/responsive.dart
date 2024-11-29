class Responsive {
  static double width(double maxWidth) {
    double wFactor = 0.0;

    if (maxWidth < 600) {
      wFactor = 0.95;
    } else if (maxWidth < 1024) {
      wFactor = 0.6;
    } else {
      wFactor = 0.35;
    }
    return wFactor * maxWidth;
  }

  static double widthLogin(double maxWidth) {
    double wFactor = 0.0;

    if (maxWidth < 600) {
      wFactor = 0.9;
    } else if (maxWidth < 1024) {
      wFactor = 0.6;
    } else {
      wFactor = 0.25;
    }
    return wFactor * maxWidth;
  }

  static double height(double maxHeight) {
    double hFactor = 0.0;

    if (maxHeight < 600) {
      hFactor = 0.45;
    } else if (maxHeight < 900) {
      hFactor = 0.7;
    } else {
      hFactor = 0.5;
    }
    return hFactor * maxHeight;
  }
}
