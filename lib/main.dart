import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'providers/data_provider.dart';
import 'theme/app_theme.dart';
import 'screens/home_screen.dart';
import 'screens/students/student_form_screen.dart';
import 'screens/courses/course_form_screen.dart';

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
    return ChangeNotifierProvider(
      create: (_) => DataProvider()..loadSampleData(),
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
