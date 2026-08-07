import '../models/course.dart';
import '../models/student.dart';
import '../repositories/interfaces/course_repository_interface.dart';
import '../repositories/interfaces/enrollment_repository_interface.dart';
import '../repositories/interfaces/student_repository_interface.dart';

/// Single Responsibility: Seeding initial demo data into repositories (SRP/DIP).
class SampleDataService {
  final IStudentRepository studentRepo;
  final ICourseRepository courseRepo;
  final IEnrollmentRepository enrollmentRepo;

  SampleDataService({
    required this.studentRepo,
    required this.courseRepo,
    required this.enrollmentRepo,
  });

  /// Populates the system with realistic initial student and course records.
  void seedInitialData() {
    // Seed Courses
    final c1 = courseRepo.addCourse(Course(
      id: '',
      courseCode: 'BCI 1312',
      courseName: 'Mobile Application Development',
      description:
          'Design and develop mobile applications using modern frameworks such as Flutter and React Native.',
      credits: 3,
      lecturer: 'Mr. Kamal Perera',
    ));
    final c2 = courseRepo.addCourse(Course(
      id: '',
      courseCode: 'BCI 1314',
      courseName: 'Database Management Systems',
      description:
          'Study of relational database design, SQL, normalization, and database administration.',
      credits: 3,
      lecturer: 'Dr. Nimal Fernando',
    ));
    final c3 = courseRepo.addCourse(Course(
      id: '',
      courseCode: 'BCI 1316',
      courseName: 'Web Application Development',
      description:
          'Building modern web applications using HTML, CSS, JavaScript, and server-side technologies.',
      credits: 4,
      lecturer: 'Ms. Sachini Silva',
    ));
    final c4 = courseRepo.addCourse(Course(
      id: '',
      courseCode: 'BCI 1318',
      courseName: 'Data Structures & Algorithms',
      description:
          'Fundamental data structures including arrays, linked lists, trees, graphs, and algorithm analysis.',
      credits: 4,
      lecturer: 'Prof. Anil Jayasuriya',
    ));
    final c5 = courseRepo.addCourse(Course(
      id: '',
      courseCode: 'BCI 1320',
      courseName: 'Computer Networks',
      description:
          'Study of networking concepts, protocols, TCP/IP, network security, and cloud computing.',
      credits: 3,
      lecturer: 'Dr. Ruwan Wickrama',
    ));
    final c6 = courseRepo.addCourse(Course(
      id: '',
      courseCode: 'BCI 1322',
      courseName: 'Software Engineering',
      description:
          'Software development life cycle, agile methodologies, project management, and quality assurance.',
      credits: 3,
      lecturer: 'Mr. Dinesh Rajapakse',
    ));

    // Seed Students
    final s1 = studentRepo.addStudent(Student(
      id: '',
      name: 'Ashan Bandara',
      email: 'ashan.bandara@bci.lk',
      phone: '071-1234567',
      address: '45, Galle Road, Colombo 03',
    ));
    final s2 = studentRepo.addStudent(Student(
      id: '',
      name: 'Kavindi Perera',
      email: 'kavindi.perera@bci.lk',
      phone: '077-2345678',
      address: '12, Kandy Road, Kadawatha',
    ));
    final s3 = studentRepo.addStudent(Student(
      id: '',
      name: 'Tharindu Silva',
      email: 'tharindu.silva@bci.lk',
      phone: '076-3456789',
      address: '78, Main Street, Negombo',
    ));
    final s4 = studentRepo.addStudent(Student(
      id: '',
      name: 'Nethmi Fernando',
      email: 'nethmi.fernando@bci.lk',
      phone: '070-4567890',
      address: '23, Temple Road, Kandy',
    ));
    final s5 = studentRepo.addStudent(Student(
      id: '',
      name: 'Sahan Jayawardena',
      email: 'sahan.jayawardena@bci.lk',
      phone: '075-5678901',
      address: '56, Beach Road, Matara',
    ));

    // Seed Enrollments
    enrollmentRepo.enrollStudent(s1.id, c1.id);
    enrollmentRepo.enrollStudent(s1.id, c2.id);
    enrollmentRepo.enrollStudent(s1.id, c3.id);

    enrollmentRepo.enrollStudent(s2.id, c2.id);
    enrollmentRepo.enrollStudent(s2.id, c4.id);
    enrollmentRepo.enrollStudent(s2.id, c6.id);

    enrollmentRepo.enrollStudent(s3.id, c1.id);
    enrollmentRepo.enrollStudent(s3.id, c5.id);

    enrollmentRepo.enrollStudent(s4.id, c3.id);
    enrollmentRepo.enrollStudent(s4.id, c4.id);
    enrollmentRepo.enrollStudent(s4.id, c2.id);
    enrollmentRepo.enrollStudent(s4.id, c6.id);

    enrollmentRepo.enrollStudent(s5.id, c1.id);
    enrollmentRepo.enrollStudent(s5.id, c5.id);
    enrollmentRepo.enrollStudent(s5.id, c3.id);
  }
}
