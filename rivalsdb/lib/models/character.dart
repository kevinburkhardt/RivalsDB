class Character {
  final String name;
  final String role;
  final String url;
  final List<String> images;
  final List<String> paragraphs;
  final List<Map<String, dynamic>> abilities;

  Character({
    required this.name,
    required this.role,
    required this.url,
    required this.images,
    required this.paragraphs,
    required this.abilities,
  });

  factory Character.fromFirestore(Map<String, dynamic> data) {
    return Character(
      name: data['Name'] ?? '',
      role: data['Role'] ?? '',
      url: data['URL'] ?? '',
      images: List<String>.from(data['Images'] ?? []),
      paragraphs: List<String>.from(data['Paragraphs'] ?? []),
      abilities: List<Map<String, dynamic>>.from(data['Abilities'] ?? []),
    );
  }
}
