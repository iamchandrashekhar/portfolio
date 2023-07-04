bool isMobile(double width) {
  return width < 700;
}

bool isTablet(double width) {
  return width < 1023;
}

bool isDesktop(double width) {
  return width > 1023;
}
