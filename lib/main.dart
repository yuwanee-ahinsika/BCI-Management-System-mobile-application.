import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'providers/data_provider.dart';
import 'repositories/implementations/in_memory_course_repository.dart';
import 'repositories/implementations/in_memory_enrollment_repository.dart';
import 'repositories/implementations/in_memory_student_repository.dart';
import 'screens/courses/course_form_screen.dart';
import 'screens/home_screen.dart';
import 'screens/students/student_form_screen.dart';
import 'theme/app_theme.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  // Set system UI overlay style for light theme
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
      systemNavigationBarColor: Colors.white,
      systemNavigationBarIconBrightness: Brightness.dark,
    ),
  );

  runApp(const BCIManagementApp());
}

class BCIManagementApp extends StatelessWidget {
  const BCIManagementApp({super.key});

  @override
  Widget build(BuildContext context) {
    // ─── Dependency Inversion Principle (DIP) Composition Root ───
    // Instantiate concrete repository implementations
    final studentRepo = InMemoryStudentRepository();
    final courseRepo = InMemoryCourseRepository();
    final enrollmentRepo = InMemoryEnrollmentRepository(studentRepository: studentRepo);

    return ChangeNotifierProvider(
      create: (_) => DataProvider(
        studentRepo: studentRepo,
        courseRepo: courseRepo,
        enrollmentRepo: enrollmentRepo,
      )..loadSampleData(),
      child: MaterialApp(
        title: 'BCI Campus Management System',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.lightTheme,
        home: const HomeScreen(),
        routes: {
          '/add-student': (context) => const StudentFormScreen(),
          '/add-course': (context) => const CourseFormScreen(),
        },
      ),
    );
  }
}
