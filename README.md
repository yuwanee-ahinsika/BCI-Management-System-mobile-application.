# 🎓 BCI Campus Management System

> **Mobile Application for Student & Course Administration**  
> *Developed with Flutter & Provider State Management*

---
## 🛠️ Tech Stack & Dependencies

- **Framework**: [Flutter SDK](https://flutter.dev/) (Dart 3+)
- **State Management**: [`provider`](https://pub.dev/packages/provider) (`^6.1.2`)
- **Icons**: Material Icons (`uses-material-design: true`)
- **Assets**: Custom BCI Campus branding (`assets/images/bci_logo.png`)

---

## 🚀 Getting Started

### Prerequisites

- [Flutter SDK](https://docs.flutter.dev/get-started/install) (v3.0.0 or higher)
- Dart SDK (v3.0.0 or higher)
- Android Studio / VS Code with Flutter extension
- An Android Emulator, iOS Simulator, or Chrome browser for testing

### Installation & Setup

1. **Clone or navigate to the project directory**:
   ```bash
   cd "path/to/assignment"
   ```

2. **Install dependencies**:
   ```bash
   flutter pub get
   ```

3. **Run the application**:
   ```bash
   # Run on default connected device/emulator
   flutter run

   # Or run explicitly on Web / Desktop:
   flutter run -d chrome
   flutter run -d windows
   ```

---

## ✅ Verification & Quality Assurance

The codebase passes all static analysis checks:

```bash
flutter analyze
# Output: Analyzing assignment...
# No issues found!
```

---

## 📄 License

This project is created for educational and administrative assessment purposes for **BCI Campus**.


## 📌 Table of Contents

- [Overview](#-overview)
- [Key Features](#-key-features)
- [Screenshots & UI Design](#-screenshots--ui-design)
- [Project Architecture](#-project-architecture)
- [Folder Structure](#-folder-structure)
- [Pre-Loaded Sample Data](#-pre-loaded-sample-data)
- [Tech Stack & Dependencies](#-tech-stack--dependencies)
- [Getting Started](#-getting-started)
- [Verification & Quality Assurance](#-verification--quality-assurance)

---

## 📖 Overview

The **BCI Campus Management System** is a mobile application developed with **Flutter** designed to streamline academic administrative tasks at BCI Campus. The app enables university administrators to manage student profiles, course catalogs, and student-to-course enrollments through a responsive interface.

### Key Highlights:
- **Complete CRUD Operations** for both Students and Courses.
- **Bi-directional Course Enrollment System** with real-time course counter updates.
- **Search Capabilities** across student records and course catalogs.
- **Premium Light Theme Design System** featuring academic navy, emerald green, and warm amber color schemes.

---

## ✨ Key Features

### 📊 1. Executive Dashboard
- **Overview Stat Cards**: Displays real-time counts for Total Students, Total Courses, and Active Enrollments.
- **Gradient Quick Actions**: One-tap shortcuts to add new students, create courses, or manage enrollments.
- **Recent Activity**: Quick access lists showing recently registered students and active courses.

### 👨‍🎓 2. Student Record Management (CRUD)
- **Add Student**: Register new students with Full Name, Email Address, Phone Number, and Physical Address.
- **View Student Details**: Profile page displaying personal information and all currently enrolled courses.
- **Edit Student**: Update student contact details and personal info with form validation.
- **Delete Student**: Remove student records with confirmation dialogs.
- **Live Search**: Instant filtering by student name, ID, or email address.

### 📚 3. Course Record Management (CRUD)
- **Add Course**: Create new courses with Course Code (e.g., `BCI 1312`), Course Name, Description, Credit Units (1–6), and Lecturer Name.
- **View Course Details**: Breakdown of course information along with a list of enrolled students.
- **Edit Course**: Modify course details, credit allocation, or assigned lecturer.
- **Delete Course**: Remove courses with cascade handling for enrolled students.
- **Live Search**: Filter courses by course code, name, or lecturer.

### 📝 4. Course Enrollment System
- **Interactive Enrollment Flow**:
  1. Select a student from a searchable dropdown menu.
  2. Toggle course enrollment on/off with immediate state feedback.
- **Enrollment Overview Tab**: Accordion view displaying all students and their enrolled courses.

---

## 🎨 UI & Design System

The application follows a **Premium Academic Light Theme**:

- **Color Palette**:
  - `Scaffold Background`: `#F7F8FC` (Soft light gray)
  - `Primary Navy`: `#162447` – `#2A4494` (BCI Campus Brand Colors)
  - `Emerald Green`: `#065F46` – `#0D9F6F` (Courses & Success indicators)
  - `Warm Amber`: `#B45309` – `#E8841A` (Enrollment System)
  - `Surface Cards`: `#FFFFFF` with multi-layered subtle drop shadows (`BoxShadow`)
- **Typography & Components**:
  - Rounded cards (`BorderRadius: 16px - 24px`) with subtle borders.
  - Interactive ripple inkwells and micro-animations.
  - Animated bottom navigation bar with active indicators.

---

## 🏗️ Project Architecture

The project follows a modular structure separated into models, providers, screens, and themes:

```
lib/
├── main.dart                       # App entry point & Provider configuration
├── models/
│   ├── student.dart                # Student data model
│   └── course.dart                 # Course data model
├── providers/
│   └── data_provider.dart          # Centralized State Management (ChangeNotifier)
├── theme/
│   └── app_theme.dart              # Light theme design tokens & visual styles
└── screens/
    ├── home_screen.dart            # Dashboard & Bottom Navigation
    ├── students/
    │   ├── student_list_screen.dart  # Student catalog & search
    │   ├── student_form_screen.dart  # Add/Edit student form
    │   └── student_detail_screen.dart# Student profile & enrollments
    ├── courses/
    │   ├── course_list_screen.dart   # Course catalog & search
    │   ├── course_form_screen.dart   # Add/Edit course form
    │   └── course_detail_screen.dart # Course details & student list
    └── enrollment/
        └── enrollment_screen.dart  # Enrollment management (Enroll + View tabs)
```

---

## 📦 Pre-Loaded Sample Data

On first startup, the app loads pre-configured sample data via `DataProvider.loadSampleData()`:

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


