class SocialModel {
  final String svgPath;
  final String link;
  SocialModel({
    required this.svgPath,
    required this.link,
  });

  SocialModel copyWith({
    String? imgPath,
    String? link,
  }) {
    return SocialModel(
      svgPath: imgPath ?? svgPath,
      link: link ?? this.link,
    );
  }

  @override
  String toString() => 'SocialModel(imgPath: $svgPath, link: $link)';

  @override
  bool operator ==(covariant SocialModel other) {
    if (identical(this, other)) return true;

    return other.svgPath == svgPath && other.link == link;
  }

  @override
  int get hashCode => svgPath.hashCode ^ link.hashCode;
}
