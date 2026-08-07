# 🎓 BCI Campus Management System

> **Mobile Application for Student & Course Administration**  
> *Developed with Flutter, Provider State Management, & SOLID Software Engineering Principles*

---

## 📌 Table of Contents

- [Overview](#-overview)
- [SOLID Principles Implementation](#-solid-principles-implementation)
- [Key Features](#-key-features)
- [Project Architecture](#-project-architecture)
- [Folder Structure](#-folder-structure)
- [Pre-Loaded Sample Data](#-pre-loaded-sample-data)
- [Tech Stack & Dependencies](#-tech-stack--dependencies)
- [Getting Started](#-getting-started)
- [Verification & Quality Assurance](#-verification--quality-assurance)

---

## 📖 Overview

The **BCI Campus Management System** is a mobile application developed with **Flutter** designed to streamline academic administrative tasks at BCI Campus. The app enables university administrators to manage student profiles, course catalogs, and student-to-course enrollments through an intuitive, responsive interface.

---

## 🧩 SOLID Principles Implementation

The codebase is refactored to strictly follow the **SOLID** design principles for maintainability, testability, and scalability:

### 1. Single Responsibility Principle (SRP)
- **Repositories**: Storage & query logic is encapsulated inside dedicated classes (`InMemoryStudentRepository`, `InMemoryCourseRepository`, `InMemoryEnrollmentRepository`).
- **Services**: Initial demo data seeding is isolated inside `SampleDataService`.
- **UI Components**: UI screens delegate search bars (`CustomSearchBar`), headers (`SectionHeader`), delete dialogs (`ConfirmDeleteDialog`), and empty states (`EmptyStateView`) to reusable single-responsibility widgets in `lib/widgets/`.

### 2. Open/Closed Principle (OCP)
- Systems can be extended with new storage mechanisms (e.g., SQLite, Hive, REST API) by creating a new class that implements the repository interfaces (`IStudentRepository`, `ICourseRepository`, `IEnrollmentRepository`), without altering state providers or UI screens.

### 3. Liskov Substitution Principle (LSP)
- All concrete repository implementations (`InMemoryStudentRepository`, etc.) fulfill the contracts defined by their abstract interfaces and can replace each other seamlessly without breaking application expectations.

### 4. Interface Segregation Principle (ISP)
- Large monolithic interfaces are segregated into focused role-based contracts (`IStudentReader`, `IStudentWriter`, `ICourseReader`, `ICourseWriter`, `IEnrollmentReader`, `IEnrollmentWriter`). Clients depend only on methods they actually consume.

### 5. Dependency Inversion Principle (DIP)
- High-level modules (`DataProvider`, `SampleDataService`) and state management controllers depend on abstract interfaces (`IStudentRepository`, `ICourseRepository`, `IEnrollmentRepository`), not on concrete implementations.
- Dependencies are injected via constructors in `main.dart` (Composition Root).

---

## ✨ Key Features

### 📊 1. Executive Dashboard
- **Overview Stat Cards**: Real-time counters for Total Students, Total Courses, and Active Enrollments.
- **Gradient Quick Actions**: One-tap shortcuts to register students, add courses, or manage enrollments.
- **Recent Activity**: Quick access lists showing recently added students and available courses.

### 👨‍🎓 2. Student Record Management (CRUD)
- **Add Student**: Register new students with Full Name, Email, Phone, and Address.
- **View Student Details**: Profile page displaying personal information and enrolled courses.
- **Edit Student**: Update student contact details with full form validation.
- **Delete Student**: Remove student records with confirm dialogs.
- **Live Search**: Instant filtering by student name, ID, or email address.

### 📚 3. Course Record Management (CRUD)
- **Add Course**: Create courses with Course Code (e.g., `BCI 1312`), Name, Description, Credits, and Lecturer.
- **View Course Details**: Detailed course info plus enrolled student roster.
- **Edit Course**: Modify course details, credit allocation, or assigned lecturer.
- **Delete Course**: Remove courses with automatic cleanup of student enrollments.
- **Live Search**: Filter courses by course code, name, or lecturer.

### 📝 4. Course Enrollment System
- **Interactive Enrollment Flow**: 2-step enrollment flow with instant visual toggle indicators.
- **Enrollment Overview Tab**: Accordion view showing all students and their enrolled courses.

---

## 🎨 UI & Design System

The application follows a **Premium Academic Light Theme**:

- **Color Palette**:
  - `Scaffold Background`: `#F7F8FC` (Soft light gray)
  - `Primary Navy`: `#162447` – `#2A4494` (BCI Campus Brand Colors)
  - `Emerald Green`: `#065F46` – `#0D9F6F` (Courses & Success indicators)
  - `Warm Amber`: `#B45309` – `#E8841A` (Enrollment System)
  - `Surface Cards`: `#FFFFFF` with multi-layered subtle drop shadows (`BoxShadow`)

---

## 📁 Folder Structure

```
lib/
├── main.dart                       # Composition Root & App entry point
├── models/
│   ├── student.dart                # Student data model
│   └── course.dart                 # Course data model
├── repositories/
│   ├── interfaces/                 # Abstractions (ISP / DIP)
│   │   ├── student_repository_interface.dart
│   │   ├── course_repository_interface.dart
│   │   └── enrollment_repository_interface.dart
│   └── implementations/            # Concrete storage (LSP / SRP)
│       ├── in_memory_student_repository.dart
│       ├── in_memory_course_repository.dart
│       └── in_memory_enrollment_repository.dart
├── services/
│   └── sample_data_service.dart    # Demo data seeding (SRP)
├── providers/
│   └── data_provider.dart          # Central State Coordinator (DIP)
├── theme/
│   └── app_theme.dart              # Light theme design tokens
├── widgets/                        # Modular UI components (SRP)
│   ├── custom_search_bar.dart
│   ├── section_header.dart
│   ├── confirm_delete_dialog.dart
│   └── empty_state_view.dart
└── screens/
    ├── home_screen.dart            # Dashboard & Bottom Navigation
    ├── students/                   # Student CRUD screens
    ├── courses/                    # Course CRUD screens
    └── enrollment/                 # Enrollment management screens
```

---

## 📦 Pre-Loaded Sample Data

On startup, `SampleDataService` populates realistic demo records:

### Students (5 Records):
- `STU0001` - Ashan Bandara (`ashan.bandara@bci.lk`)
- `STU0002` - Kavindi Perera (`kavindi.perera@bci.lk`)
- `STU0003` - Tharindu Silva (`tharindu.silva@bci.lk`)
- `STU0004` - Nethmi Fernando (`nethmi.fernando@bci.lk`)
- `STU0005` - Sahan Jayawardena (`sahan.jayawardena@bci.lk`)

### Courses (6 Records):
- `BCI 1312` - Mobile Application Development (3 Credits) — Mr. Kamal Perera
- `BCI 1314` - Database Management Systems (3 Credits) — Dr. Nimal Fernando
- `BCI 1316` - Web Application Development (4 Credits) — Ms. Sachini Silva
- `BCI 1318` - Data Structures & Algorithms (4 Credits) — Prof. Anil Jayasuriya
- `BCI 1320` - Computer Networks (3 Credits) — Dr. Ruwan Wickrama
- `BCI 1322` - Software Engineering (3 Credits) — Mr. Dinesh Rajapakse

---

## 🛠️ Tech Stack & Dependencies

- **Framework**: [Flutter SDK](https://flutter.dev/) (Dart 3+)
- **State Management**: [`provider`](https://pub.dev/packages/provider) (`^6.1.2`)
- **Icons**: Material Icons (`uses-material-design: true`)
- **Assets**: Custom BCI Campus branding (`assets/images/bci_logo.png`)

---

## 🚀 Getting Started

### Installation & Setup

1. **Install dependencies**:
   ```bash
   flutter pub get
   ```

2. **Run the application**:
   ```bash
   flutter run
   ```

---

## ✅ Verification & Quality Assurance

The codebase passes all static analysis checks cleanly:

```bash
flutter analyze
# Output: Analyzing assignment...
# No issues found!
```

---

## 📄 License

This project is created for educational and administrative assessment purposes for **BCI Campus**.
