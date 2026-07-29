/// Student model for the BCI Management System.
class Student {
  final String id;
  String name;
  String email;
  String phone;
  String address;
  List<String> enrolledCourseIds;

  Student({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.address,
    List<String>? enrolledCourseIds,
  }) : enrolledCourseIds = enrolledCourseIds ?? [];

  Student copyWith({
    String? id,
    String? name,
    String? email,
    String? phone,
    String? address,
    List<String>? enrolledCourseIds,
  }) {
    return Student(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      address: address ?? this.address,
      enrolledCourseIds: enrolledCourseIds ?? List.from(this.enrolledCourseIds),
    );
  }
}
