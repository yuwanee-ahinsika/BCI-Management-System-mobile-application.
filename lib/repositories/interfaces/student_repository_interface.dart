import '../../models/student.dart';

/// Role-specific interface for reading student records (ISP).
abstract class IStudentReader {
  List<Student> getAllStudents();
  Student? getStudentById(String id);
  List<Student> searchStudents(String query);
}

/// Role-specific interface for writing student records (ISP).
abstract class IStudentWriter {
  Student addStudent(Student student);
  void updateStudent(String id, Student student);
  void deleteStudent(String id);
}

/// Combined Student Repository Interface (DIP / OCP).
/// High-level modules depend on this abstraction rather than concrete storage details.
abstract class IStudentRepository implements IStudentReader, IStudentWriter {}
