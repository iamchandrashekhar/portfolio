enum Device {
  mobile(isMobile: true),
  tablet(isTablet: true),
  desktop(isDesktop: true);

  const Device(
      {this.isMobile = false, this.isTablet = false, this.isDesktop = false});
  final bool isMobile;
  final bool isTablet;
  final bool isDesktop;
}
