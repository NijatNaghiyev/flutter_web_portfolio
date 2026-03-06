# 🌐 Flutter Web Portfolio

<div align="center">

[![Flutter](https://img.shields.io/badge/Flutter-v3.10+-02569B?logo=flutter&logoColor=white)](https://flutter.dev)
[![Firebase](https://img.shields.io/badge/Firebase-Hosting-FFCA28?logo=firebase&logoColor=black)](https://firebase.google.com)
[![License](https://img.shields.io/badge/License-MIT-blue.svg)](LICENSE)
[![Live Demo](https://img.shields.io/badge/Demo-Live-success)](https://nijat-naghiyev.web.app)

**A modern, responsive portfolio website built with Flutter Web**

[Live Demo](https://nijat-naghiyev.web.app) • [Report Bug](../../issues) • [Request Feature](../../issues)

</div>

---

## 📸 Preview

Visit the live website: **[nijat-naghiyev.web.app](https://nijat-naghiyev.web.app)**

---

## ✨ Features

### 🎨 Design & UI

- **Responsive Design** - Optimized for desktop, tablet, and mobile devices
- **Dark/Light Theme** - Seamless theme switching with persistent state
- **Smooth Animations** - Engaging user interactions and transitions
- **Modern UI/UX** - Clean, professional design with custom typography (Inter & Outfit fonts)

### 🚀 Technical Highlights

- **Clean Architecture** - Separation of concerns with Data, Domain, and Presentation layers
- **State Management** - BLoC pattern with Hydrated BLoC for state persistence
- **Dependency Injection** - Get_it and Injectable for clean dependency management
- **Firebase Integration** - Firestore, Analytics, Storage, Authentication, and App Check
- **Real-time Data** - Dynamic content management through Firestore
- **Code Generation** - Freezed for immutable models and JSON serialization

### 📄 Portfolio Sections

- **About Me** - Professional introduction and biography
- **Skills** - Technical skills with custom icons
- **Projects** - Showcase of projects with descriptions, tags, and links
- **Contact** - Social media links and email contact

---

## 🛠️ Tech Stack

### Frontend

- **Framework:** Flutter Web 3.10+
- **Language:** Dart
- **State Management:** flutter_bloc, hydrated_bloc
- **Navigation:** go_router
- **UI Components:** Custom widgets with Material Design

### Backend & Services

- **Database:** Cloud Firestore
- **Hosting:** Firebase Hosting
- **Analytics:** Firebase Analytics
- **Storage:** Firebase Storage
- **Authentication:** Firebase Auth
- **Security:** Firebase App Check

### Development Tools

- **Dependency Injection:** get_it, injectable
- **Code Generation:** build_runner, freezed, json_serializable
- **Linting:** very_good_analysis, flutter_lints

---

## 📁 Project Structure

```
lib/
├── app/
│   ├── config/          # Firebase configuration
│   ├── di/              # Dependency injection setup
│   └── router/          # App routing configuration
│
├── core/
│   ├── const/           # Constants (strings, assets, sizes)
│   ├── cubits/          # Base cubits and observers
│   ├── enums/           # App-wide enumerations
│   ├── extensions/      # Dart extensions
│   ├── network/         # Network layer and result handling
│   ├── services/        # Core services (analytics, auth, storage)
│   ├── theme/           # Theme configuration and cubit
│   ├── utils/           # Utility functions
│   └── widgets/         # Reusable widgets
│
└── features/
    ├── error/           # Error handling
    └── main/
        ├── data/
        │   ├── datasources/    # Data sources
        │   ├── dtos/           # Data transfer objects
        │   └── repositories/   # Repository implementations
        ├── domain/
        │   ├── entities/       # Business entities
        │   ├── repositories/   # Repository interfaces
        │   └── usecases/       # Business logic
        └── presentation/
            ├── cubits/         # State management
            ├── pages/          # Page widgets
            └── widgets/        # Feature-specific widgets
```

---

## 🚀 Getting Started

### Prerequisites

- Flutter SDK (≥3.10.0)
- Dart SDK (≥3.10.0)
- Firebase CLI
- A Firebase project

### Installation

1. **Clone the repository**

   ```bash
   git clone https://github.com/yourusername/flutter_web_portfolio.git
   cd flutter_web_portfolio
   ```

2. **Install dependencies**

   ```bash
   flutter pub get
   ```

3. **Configure Firebase**
   - Create a new Firebase project at [Firebase Console](https://console.firebase.google.com)
   - Enable Firestore, Storage, Analytics, and App Check
   - Download `google-services.json` (Android) and `GoogleService-Info.plist` (iOS) if needed
   - Run FlutterFire CLI to configure:

     ```bash
     flutterfire configure
     ```

4. **Generate code**

   ```bash
   dart run build_runner build --delete-conflicting-outputs
   ```

5. **Run the app**

   ```bash
   flutter run -d chrome
   ```

---

## 🔥 Firebase Setup

### Firestore Collections Structure

Create the following collections in your Firestore database:

**`profile` Collection**

```json
{
  "main": {
    "aboutMe": "Your bio text here...",
    "cvPath": "path/to/cv.pdf",
    "email": "your.email@example.com",
    "github": "https://github.com/yourusername",
    "linkedin": "https://linkedin.com/in/yourusername"
  }
}
```

**`skills` Collection**

```json
{
  "main": {
    "skills": [
      {
        "title": "Flutter",
        "icon": "flutter"
      },
      {
        "title": "Firebase",
        "icon": "firebase"
      }
    ]
  }
}
```

**`projects` Collection**

```json
{
  "main": {
    "projects": [
      {
        "title": "Project Name",
        "description": "Project description...",
        "imageUrl": "https://example.com/image.jpg",
        "githubUrl": "https://github.com/user/repo",
        "websiteUrl": "https://example.com",
        "iosUrl": "https://apps.apple.com/...",
        "androidUrl": "https://play.google.com/...",
        "tags": "Flutter, Firebase, BLoC"
      }
    ]
  }
}
```

### Firestore Security Rules

```javascript
rules_version = '2';
service cloud.firestore {
  match /databases/{database}/documents {
    // Public read access, authenticated write
    match /{document=**} {
      allow read: if true;
      allow write: if request.auth != null;
    }
  }
}
```

---

## 📦 Deployment

### Deploy to Firebase Hosting

1. **Build the web app**

   ```bash
   flutter build web
   ```

2. **Initialize Firebase (first time only)**

   ```bash
   firebase init hosting
   ```

   - Select your Firebase project
   - Set `build/web` as your public directory
   - Configure as a single-page app: Yes
   - Don't overwrite index.html

3. **Deploy**

   ```bash
   firebase deploy
   ```

4. **Quick deploy** (build + deploy)

   ```bash
   flutter build web && firebase deploy
   ```

Your site will be live at `https://your-project-id.web.app`

---

## 🎨 Customization

### Update Content

Edit your portfolio content in Firestore Console:

- Profile information in `profile/main`
- Skills in `skills/main`
- Projects in `projects/main`

### Change Theme Colors

Edit [lib/core/theme/app_colors.dart](lib/core/theme/app_colors.dart):

```dart
class AppColors {
  static const Color primary = Color(0xff3B82F6); // Your brand color
  // ... other colors
}
```

### Modify Typography

Edit [lib/core/theme/app_textstyle.dart](lib/core/theme/app_textstyle.dart):

```dart
static const TextStyle heroHeading = TextStyle(
  fontFamily: 'Outfit',
  fontSize: 72,
  fontWeight: FontWeight.bold,
);
```

---

## 📱 Responsive Breakpoints

The portfolio is optimized for different screen sizes:

| Device | Breakpoint |
|--------|-----------|
| Mobile | < 768px |
| Tablet | 768px - 1024px |
| Desktop Small | 1024px - 1440px |
| Desktop | > 1440px |

---

## 🧪 Testing

Run tests:

```bash
flutter test
```

---

## 📝 Scripts

Common commands are available:

```bash
# Generate code
dart run build_runner build --delete-conflicting-outputs

# Watch for changes
dart run build_runner watch --delete-conflicting-outputs

# Clean and rebuild
flutter clean && flutter pub get && dart run build_runner build --delete-conflicting-outputs

# Build for web
flutter build web --release

# Analyze code
flutter analyze

# Format code
dart format .
```

---

## 🤝 Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

1. Fork the project
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

---

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

---

## 👨‍💻 Author

**Nijat Naghiyev**

- Portfolio: [nijat-naghiyev.web.app](https://nijat-naghiyev.web.app)
- GitHub: [@NijatNaghiyev](https://github.com/NijatNaghiyev)
- LinkedIn: [Nijat Naghiyev](https://linkedin.com/in/nijat-naghiyev)

---

## 🙏 Acknowledgments

- [Flutter](https://flutter.dev) - Google's UI toolkit
- [Firebase](https://firebase.google.com) - Backend services
- [Very Good Analysis](https://pub.dev/packages/very_good_analysis) - Lint rules
- [BLoC Library](https://bloclibrary.dev) - State management
- [Google Fonts](https://fonts.google.com) - Inter & Outfit typography

---

## 📊 Project Stats

- **Lines of Code:** ~5000+
- **Widgets:** 50+ custom widgets
- **State Management:** BLoC pattern
- **Architecture:** Clean Architecture with 3 layers
- **Performance:** Lighthouse Score 95+

---

<div align="center">

### ⭐ Star this repo if you found it helpful

**Built with ❤️ using Flutter**

</div>
