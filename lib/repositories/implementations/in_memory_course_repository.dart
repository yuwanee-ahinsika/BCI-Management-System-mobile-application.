import '../../models/course.dart';
import '../interfaces/course_repository_interface.dart';

/// Concrete in-memory implementation of ICourseRepository (LSP / SRP).
/// Single responsibility: Managing course storage and query logic.
class InMemoryCourseRepository implements ICourseRepository {
  final List<Course> _courses = [];
  int _courseIdCounter = 0;

  @override
  List<Course> getAllCourses() {
    return List.unmodifiable(_courses);
  }

  @override
  Course? getCourseById(String id) {
    try {
      return _courses.firstWhere((c) => c.id == id);
    } catch (_) {
      return null;
    }
  }

  @override
  List<Course> searchCourses(String query) {
    if (query.trim().isEmpty) return getAllCourses();
    final lowerQuery = query.toLowerCase().trim();
    return _courses
        .where((c) =>
            c.courseName.toLowerCase().contains(lowerQuery) ||
            c.courseCode.toLowerCase().contains(lowerQuery) ||
            c.lecturer.toLowerCase().contains(lowerQuery))
        .toList();
  }

  @override
  Course addCourse(Course course) {
    _courseIdCounter++;
    final assignedId = 'CRS${_courseIdCounter.toString().padLeft(4, '0')}';
    final newCourse = Course(
      id: assignedId,
      courseCode: course.courseCode,
      courseName: course.courseName,
      description: course.description,
      credits: course.credits,
      lecturer: course.lecturer,
    );
    _courses.add(newCourse);
    return newCourse;
  }

  @override
  void updateCourse(String id, Course course) {
    final index = _courses.indexWhere((c) => c.id == id);
    if (index != -1) {
      _courses[index] = Course(
        id: id,
        courseCode: course.courseCode,
        courseName: course.courseName,
        description: course.description,
        credits: course.credits,
        lecturer: course.lecturer,
      );
    }
  }

  @override
  void deleteCourse(String id) {
    _courses.removeWhere((c) => c.id == id);
  }
}
