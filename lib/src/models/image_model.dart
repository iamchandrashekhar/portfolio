class ImageModel {
  final String svgSource;
  String? link;
  String? title;
  ImageModel({
    required this.svgSource,
    this.link,
    this.title,
  });

  ImageModel copyWith({
    String? svgSource,
    String? link,
    String? title,
  }) {
    return ImageModel(
      svgSource: svgSource ?? this.svgSource,
      link: link ?? this.link,
      title: title ?? this.title,
    );
  }

  @override
  String toString() =>
      'ImageModel(svgSource: $svgSource, link: $link, semanticLabel: $title)';

  @override
  bool operator ==(covariant ImageModel other) {
    if (identical(this, other)) return true;

    return other.svgSource == svgSource &&
        other.link == link &&
        other.title == title;
  }

  @override
  int get hashCode => svgSource.hashCode ^ link.hashCode ^ title.hashCode;
}
