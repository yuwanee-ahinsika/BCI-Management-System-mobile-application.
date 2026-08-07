/// Role-specific interface for reading enrollment queries (ISP).
abstract class IEnrollmentReader {
  List<String> getEnrolledCourseIds(String studentId);
  List<String> getEnrolledStudentIds(String courseId);
  bool isEnrolled(String studentId, String courseId);
}

/// Role-specific interface for writing enrollment changes (ISP).
abstract class IEnrollmentWriter {
  void enrollStudent(String studentId, String courseId);
  void unenrollStudent(String studentId, String courseId);
  void removeAllCourseEnrollments(String courseId);
  void removeAllStudentEnrollments(String studentId);
}

/// Combined Enrollment Repository Interface (DIP / OCP).
/// Manages mapping relationships between students and courses cleanly.
abstract class IEnrollmentRepository
    implements IEnrollmentReader, IEnrollmentWriter {}
