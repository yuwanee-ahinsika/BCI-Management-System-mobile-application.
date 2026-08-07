import '../../models/course.dart';

/// Role-specific interface for reading course records (ISP).
abstract class ICourseReader {
  List<Course> getAllCourses();
  Course? getCourseById(String id);
  List<Course> searchCourses(String query);
}

/// Role-specific interface for writing course records (ISP).
abstract class ICourseWriter {
  Course addCourse(Course course);
  void updateCourse(String id, Course course);
  void deleteCourse(String id);
}

/// Combined Course Repository Interface (DIP / OCP).
/// High-level modules depend on this abstraction rather than concrete storage details.
abstract class ICourseRepository implements ICourseReader, ICourseWriter {}
