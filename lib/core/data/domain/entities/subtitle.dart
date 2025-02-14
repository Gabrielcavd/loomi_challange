class Subtitle {
  final int id;
  final String name;
  final String language;
  final String url;

  Subtitle({
    required this.id,
    required this.name,
    required this.language,
    required this.url,
  });

  factory Subtitle.fromMap(Map<String, dynamic> json) {
    final jsonAtributes = json['attributes'];
    final jsonFile = jsonAtributes['file']['data']['attributes'];
    return Subtitle(
      id: json['id'] ?? 0,
      name: jsonFile['name'] ?? '',
      language: jsonAtributes['language'] ?? '',
      url: jsonFile['url'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'language': language,
      'url': url,
    };
  }

  @override
  String toString() {
    return 'Subtitle(id: $id, name: $name, language: $language, url: $url)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Subtitle &&
        other.id == id &&
        other.name == name &&
        other.language == language &&
        other.url == url;
  }

  @override
  int get hashCode {
    return id.hashCode ^ name.hashCode ^ language.hashCode ^ url.hashCode;
  }
}
