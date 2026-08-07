import '../interfaces/enrollment_repository_interface.dart';
import '../interfaces/student_repository_interface.dart';

/// Concrete in-memory implementation of IEnrollmentRepository (LSP / SRP / DIP).
/// Single responsibility: Managing mapping between students and course IDs.
class InMemoryEnrollmentRepository implements IEnrollmentRepository {
  final IStudentRepository studentRepository;

  InMemoryEnrollmentRepository({required this.studentRepository});

  @override
  List<String> getEnrolledCourseIds(String studentId) {
    final student = studentRepository.getStudentById(studentId);
    return student != null ? List.unmodifiable(student.enrolledCourseIds) : [];
  }

  @override
  List<String> getEnrolledStudentIds(String courseId) {
    return studentRepository
        .getAllStudents()
        .where((s) => s.enrolledCourseIds.contains(courseId))
        .map((s) => s.id)
        .toList();
  }

  @override
  bool isEnrolled(String studentId, String courseId) {
    final student = studentRepository.getStudentById(studentId);
    return student != null && student.enrolledCourseIds.contains(courseId);
  }

  @override
  void enrollStudent(String studentId, String courseId) {
    final student = studentRepository.getStudentById(studentId);
    if (student != null && !student.enrolledCourseIds.contains(courseId)) {
      student.enrolledCourseIds.add(courseId);
    }
  }

  @override
  void unenrollStudent(String studentId, String courseId) {
    final student = studentRepository.getStudentById(studentId);
    if (student != null) {
      student.enrolledCourseIds.remove(courseId);
    }
  }

  @override
  void removeAllCourseEnrollments(String courseId) {
    for (final student in studentRepository.getAllStudents()) {
      student.enrolledCourseIds.remove(courseId);
    }
  }

  @override
  void removeAllStudentEnrollments(String studentId) {
    final student = studentRepository.getStudentById(studentId);
    if (student != null) {
      student.enrolledCourseIds.clear();
    }
  }
}
