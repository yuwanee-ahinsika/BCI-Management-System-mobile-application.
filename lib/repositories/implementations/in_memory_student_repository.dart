import '../../models/student.dart';
import '../interfaces/student_repository_interface.dart';

/// Concrete in-memory implementation of IStudentRepository (LSP / SRP).
/// Single responsibility: Managing student storage and query logic.
class InMemoryStudentRepository implements IStudentRepository {
  final List<Student> _students = [];
  int _studentIdCounter = 0;

  @override
  List<Student> getAllStudents() {
    return List.unmodifiable(_students);
  }

  @override
  Student? getStudentById(String id) {
    try {
      return _students.firstWhere((s) => s.id == id);
    } catch (_) {
      return null;
    }
  }

  @override
  List<Student> searchStudents(String query) {
    if (query.trim().isEmpty) return getAllStudents();
    final lowerQuery = query.toLowerCase().trim();
    return _students
        .where((s) =>
            s.name.toLowerCase().contains(lowerQuery) ||
            s.id.toLowerCase().contains(lowerQuery) ||
            s.email.toLowerCase().contains(lowerQuery))
        .toList();
  }

  @override
  Student addStudent(Student student) {
    _studentIdCounter++;
    final assignedId = 'STU${_studentIdCounter.toString().padLeft(4, '0')}';
    final newStudent = Student(
      id: assignedId,
      name: student.name,
      email: student.email,
      phone: student.phone,
      address: student.address,
      enrolledCourseIds: student.enrolledCourseIds,
    );
    _students.add(newStudent);
    return newStudent;
  }

  @override
  void updateStudent(String id, Student student) {
    final index = _students.indexWhere((s) => s.id == id);
    if (index != -1) {
      _students[index] = Student(
        id: id,
        name: student.name,
        email: student.email,
        phone: student.phone,
        address: student.address,
        enrolledCourseIds: student.enrolledCourseIds,
      );
    }
  }

  @override
  void deleteStudent(String id) {
    _students.removeWhere((s) => s.id == id);
  }
}
