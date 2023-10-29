class Category {
  final int id;
  final String name;
  final String description;

  Category({
    required this.id,
    required this.name,
    required this.description,
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['id'] as int,
      name: json['name'] as String,
      description: json['description'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
    };
  }
}

List<Category> dummyCategories = [
  Category(
    id: 1,
    name: "General Practitioner",
    description:
        "Provides primary healthcare services and general medical care.",
  ),
  Category(
    id: 2,
    name: "Pediatrician",
    description: "Specializes in the care of children and adolescents.",
  ),
  Category(
    id: 3,
    name: "Cardiologist",
    description:
        "Specializes in the diagnosis and treatment of heart and cardiovascular system disorders.",
  ),
  Category(
    id: 4,
    name: "Dermatologist",
    description:
        "Specializes in the diagnosis and treatment of skin, hair, and nail conditions.",
  ),
  Category(
    id: 5,
    name: "Orthopedic Surgeon",
    description:
        "Specializes in the musculoskeletal system and performs orthopedic surgeries.",
  ),
  Category(
    id: 6,
    name: "Neurologist",
    description:
        "Specializes in the diagnosis and treatment of disorders of the nervous system.",
  ),
  Category(
    id: 7,
    name: "Psychiatrist",
    description: "Specializes in mental health and psychiatric disorders.",
  ),
  Category(
    id: 8,
    name: "Ophthalmologist",
    description: "Deals with eye and vision care, including surgery.",
  ),
];
