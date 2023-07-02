import 'package:portfolio/src/utils/enums.dart';

late Device currentDevice;

initCurrentDevice(double width) {
  if (isMobile(width)) {
    currentDevice = Device.mobile;
  } else if (isTablet(width)) {
    currentDevice = Device.tablet;
  } else {
    currentDevice = Device.desktop;
  }
}

bool isMobile(double width) {
  return width < 768;
}

bool isTablet(double width) {
  return width < 1023;
}

T responsive<T>(T mobile, T tablet, T desktop) {
  switch (currentDevice) {
    case Device.mobile:
      return mobile;
    case Device.tablet:
      return tablet;
    case Device.desktop:
      return desktop;
  }
}
