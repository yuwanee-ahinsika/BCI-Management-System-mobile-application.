import 'package:flutter/material.dart';
import '../models/student.dart';
import '../models/course.dart';

/// Data provider that manages all student and course data in-memory.
class DataProvider extends ChangeNotifier {
  final List<Student> _students = [];
  final List<Course> _courses = [];
  int _studentIdCounter = 0;
  int _courseIdCounter = 0;

  // ─── Student Getters ───
  List<Student> get students => List.unmodifiable(_students);

  Student? getStudentById(String id) {
    try {
      return _students.firstWhere((s) => s.id == id);
    } catch (_) {
      return null;
    }
  }

  // ─── Course Getters ───
  List<Course> get courses => List.unmodifiable(_courses);

  Course? getCourseById(String id) {
    try {
      return _courses.firstWhere((c) => c.id == id);
    } catch (_) {
      return null;
    }
  }

  // ─── Student CRUD ───
  void addStudent(Student student) {
    _studentIdCounter++;
    final newStudent = Student(
      id: 'STU${_studentIdCounter.toString().padLeft(4, '0')}',
      name: student.name,
      email: student.email,
      phone: student.phone,
      address: student.address,
      enrolledCourseIds: student.enrolledCourseIds,
    );
    _students.add(newStudent);
    notifyListeners();
  }

  void updateStudent(String id, Student updatedStudent) {
    final index = _students.indexWhere((s) => s.id == id);
    if (index != -1) {
      _students[index] = Student(
        id: id,
        name: updatedStudent.name,
        email: updatedStudent.email,
        phone: updatedStudent.phone,
        address: updatedStudent.address,
        enrolledCourseIds: updatedStudent.enrolledCourseIds,
      );
      notifyListeners();
    }
  }

  void deleteStudent(String id) {
    _students.removeWhere((s) => s.id == id);
    notifyListeners();
  }

  // ─── Course CRUD ───
  void addCourse(Course course) {
    _courseIdCounter++;
    final newCourse = Course(
      id: 'CRS${_courseIdCounter.toString().padLeft(4, '0')}',
      courseCode: course.courseCode,
      courseName: course.courseName,
      description: course.description,
      credits: course.credits,
      lecturer: course.lecturer,
    );
    _courses.add(newCourse);
    notifyListeners();
  }

  void updateCourse(String id, Course updatedCourse) {
    final index = _courses.indexWhere((c) => c.id == id);
    if (index != -1) {
      _courses[index] = Course(
        id: id,
        courseCode: updatedCourse.courseCode,
        courseName: updatedCourse.courseName,
        description: updatedCourse.description,
        credits: updatedCourse.credits,
        lecturer: updatedCourse.lecturer,
      );
      notifyListeners();
    }
  }

  void deleteCourse(String id) {
    // Also remove this course from all enrolled students
    for (final student in _students) {
      student.enrolledCourseIds.remove(id);
    }
    _courses.removeWhere((c) => c.id == id);
    notifyListeners();
  }

  // ─── Enrollment ───
  void enrollStudentInCourse(String studentId, String courseId) {
    final student = getStudentById(studentId);
    if (student != null && !student.enrolledCourseIds.contains(courseId)) {
      student.enrolledCourseIds.add(courseId);
      notifyListeners();
    }
  }

  void unenrollStudentFromCourse(String studentId, String courseId) {
    final student = getStudentById(studentId);
    if (student != null) {
      student.enrolledCourseIds.remove(courseId);
      notifyListeners();
    }
  }

  List<Course> getEnrolledCourses(String studentId) {
    final student = getStudentById(studentId);
    if (student == null) return [];
    return _courses
        .where((c) => student.enrolledCourseIds.contains(c.id))
        .toList();
  }

  List<Student> getEnrolledStudents(String courseId) {
    return _students
        .where((s) => s.enrolledCourseIds.contains(courseId))
        .toList();
  }

  // ─── Search ───
  List<Student> searchStudents(String query) {
    if (query.isEmpty) return students;
    final lowerQuery = query.toLowerCase();
    return _students
        .where((s) =>
            s.name.toLowerCase().contains(lowerQuery) ||
            s.id.toLowerCase().contains(lowerQuery) ||
            s.email.toLowerCase().contains(lowerQuery))
        .toList();
  }

  List<Course> searchCourses(String query) {
    if (query.isEmpty) return courses;
    final lowerQuery = query.toLowerCase();
    return _courses
        .where((c) =>
            c.courseName.toLowerCase().contains(lowerQuery) ||
            c.courseCode.toLowerCase().contains(lowerQuery) ||
            c.lecturer.toLowerCase().contains(lowerQuery))
        .toList();
  }

  // ─── Sample Data ───
  void loadSampleData() {
    // Sample courses
    addCourse(Course(
      id: '',
      courseCode: 'BCI 1312',
      courseName: 'Mobile Application Development',
      description:
          'Design and develop mobile applications using modern frameworks such as Flutter and React Native.',
      credits: 3,
      lecturer: 'Mr. Kamal Perera',
    ));
    addCourse(Course(
      id: '',
      courseCode: 'BCI 1314',
      courseName: 'Database Management Systems',
      description:
          'Study of relational database design, SQL, normalization, and database administration.',
      credits: 3,
      lecturer: 'Dr. Nimal Fernando',
    ));
    addCourse(Course(
      id: '',
      courseCode: 'BCI 1316',
      courseName: 'Web Application Development',
      description:
          'Building modern web applications using HTML, CSS, JavaScript, and server-side technologies.',
      credits: 4,
      lecturer: 'Ms. Sachini Silva',
    ));
    addCourse(Course(
      id: '',
      courseCode: 'BCI 1318',
      courseName: 'Data Structures & Algorithms',
      description:
          'Fundamental data structures including arrays, linked lists, trees, graphs, and algorithm analysis.',
      credits: 4,
      lecturer: 'Prof. Anil Jayasuriya',
    ));
    addCourse(Course(
      id: '',
      courseCode: 'BCI 1320',
      courseName: 'Computer Networks',
      description:
          'Study of networking concepts, protocols, TCP/IP, network security, and cloud computing.',
      credits: 3,
      lecturer: 'Dr. Ruwan Wickrama',
    ));
    addCourse(Course(
      id: '',
      courseCode: 'BCI 1322',
      courseName: 'Software Engineering',
      description:
          'Software development life cycle, agile methodologies, project management, and quality assurance.',
      credits: 3,
      lecturer: 'Mr. Dinesh Rajapakse',
    ));

    // Sample students
    addStudent(Student(
      id: '',
      name: 'Ashan Bandara',
      email: 'ashan.bandara@bci.lk',
      phone: '071-1234567',
      address: '45, Galle Road, Colombo 03',
    ));
    addStudent(Student(
      id: '',
      name: 'Kavindi Perera',
      email: 'kavindi.perera@bci.lk',
      phone: '077-2345678',
      address: '12, Kandy Road, Kadawatha',
    ));
    addStudent(Student(
      id: '',
      name: 'Tharindu Silva',
      email: 'tharindu.silva@bci.lk',
      phone: '076-3456789',
      address: '78, Main Street, Negombo',
    ));
    addStudent(Student(
      id: '',
      name: 'Nethmi Fernando',
      email: 'nethmi.fernando@bci.lk',
      phone: '070-4567890',
      address: '23, Temple Road, Kandy',
    ));
    addStudent(Student(
      id: '',
      name: 'Sahan Jayawardena',
      email: 'sahan.jayawardena@bci.lk',
      phone: '075-5678901',
      address: '56, Beach Road, Matara',
    ));

    // Sample enrollments
    // Ashan → Mobile App Dev, DBMS, Web Dev
    enrollStudentInCourse('STU0001', 'CRS0001');
    enrollStudentInCourse('STU0001', 'CRS0002');
    enrollStudentInCourse('STU0001', 'CRS0003');

    // Kavindi → DBMS, Data Structures, Software Eng
    enrollStudentInCourse('STU0002', 'CRS0002');
    enrollStudentInCourse('STU0002', 'CRS0004');
    enrollStudentInCourse('STU0002', 'CRS0006');

    // Tharindu → Mobile App Dev, Computer Networks
    enrollStudentInCourse('STU0003', 'CRS0001');
    enrollStudentInCourse('STU0003', 'CRS0005');

    // Nethmi → Web Dev, Data Structures, DBMS, Software Eng
    enrollStudentInCourse('STU0004', 'CRS0003');
    enrollStudentInCourse('STU0004', 'CRS0004');
    enrollStudentInCourse('STU0004', 'CRS0002');
    enrollStudentInCourse('STU0004', 'CRS0006');

    // Sahan → Mobile App Dev, Computer Networks, Web Dev
    enrollStudentInCourse('STU0005', 'CRS0001');
    enrollStudentInCourse('STU0005', 'CRS0005');
    enrollStudentInCourse('STU0005', 'CRS0003');

    notifyListeners();
  }
}

