/// Course model for the BCI Management System.
class Course {
  final String id;
  String courseCode;
  String courseName;
  String description;
  int credits;
  String lecturer;

  Course({
    required this.id,
    required this.courseCode,
    required this.courseName,
    required this.description,
    required this.credits,
    required this.lecturer,
  });

  Course copyWith({
    String? id,
    String? courseCode,
    String? courseName,
    String? description,
    int? credits,
    String? lecturer,
  }) {
    return Course(
      id: id ?? this.id,
      courseCode: courseCode ?? this.courseCode,
      courseName: courseName ?? this.courseName,
      description: description ?? this.description,
      credits: credits ?? this.credits,
      lecturer: lecturer ?? this.lecturer,
    );
  }
}
