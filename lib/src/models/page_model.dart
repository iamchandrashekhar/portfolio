import 'package:flutter/material.dart';

class PageModel {
  final String name;
  final String svgPath;
  final Widget widget;
  PageModel({
    required this.name,
    required this.svgPath,
    required this.widget,
  });

  PageModel copyWith({String? name, String? svgPath, Widget? widget}) {
    return PageModel(
      name: name ?? this.name,
      svgPath: svgPath ?? this.svgPath,
      widget: widget ?? this.widget,
    );
  }

  @override
  String toString() =>
      'PageModel(name: $name, svgPath: $svgPath, widget: $widget)';

  @override
  bool operator ==(covariant PageModel other) {
    if (identical(this, other)) return true;

    return other.name == name &&
        other.svgPath == svgPath &&
        other.widget == widget;
  }

  @override
  int get hashCode => name.hashCode ^ svgPath.hashCode ^ widget.hashCode;
}
