class MoviePoster {
  final String name;
  final int? width;
  final int? height;
  final double size;
  final String url;

  MoviePoster({
    required this.name,
    this.width,
    this.height,
    required this.size,
    required this.url,
  });

  factory MoviePoster.fromJson(Map<String, dynamic> json) {
    return MoviePoster(
      name: json['name'] ?? '',
      width: json['width'] ?? 0,
      height: json['height'] ?? 0,
      size: json['size'] ?? 0,
      url: json['url'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'width': width,
      'height': height,
      'size': size,
      'url': url,
    };
  }

  @override
  String toString() {
    return 'MoviePoster(name: $name, width: $width, height: $height, size: $size, url: $url)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is MoviePoster &&
        other.name == name &&
        other.width == width &&
        other.height == height &&
        other.size == size &&
        other.url == url;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        width.hashCode ^
        height.hashCode ^
        size.hashCode ^
        url.hashCode;
  }
}
