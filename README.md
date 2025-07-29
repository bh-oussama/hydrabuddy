# HydraBuddy 💧

A modern Flutter mobile application for tracking daily water intake, designed to help users maintain proper hydration habits with beautiful UI and comprehensive insights.

> **⚠️ Demo Project Notice**  
> This is a portfolio/demonstration project created for educational and showcase purposes only.

[<img width="231" height="500" alt="HydraBuddy - Screenshot" src="https://github.com/user-attachments/assets/deda2a83-5566-4fc5-908a-c4be3ee95468" />](https://drive.google.com/file/d/1rjJrFwbXnYfmVYkkWDpzjhuxr6hpbCmB/view?usp=sharing)

## 📱 Features

### Core Functionality
- **Daily Water Tracking**: Log water intake with customizable volumes and drink types
- **Smart Goals**: Automatic daily hydration goal calculation based on user profile
- **Quick Add**: Fast water intake logging with preset volumes
- **Recent History**: View recent water intake entries

### Insights
- **Daily Insights**: Track today's progress with comparisons to yesterday
- **Weekly Overview**: Analyze weekly patterns, streaks, and performance
- **Monthly Calendar**: Visual monthly progress grid with goal achievement tracking

### Customization
- **Theme Support**: Light and dark theme modes
- **Custom Volumes**: Add and edit personalized drink volumes with icons
- **Unit Preferences**: Support for different volumetric units
- **Profile Management**: User profile with weight and personal preferences

### User Experience
- **Onboarding Flow**: Guided setup for new users
- **Modern UI**: Clean, gradient-based design with smooth animations
- **Responsive Design**: Optimized for both Android and iOS
- **Localization Ready**: Multi-language support infrastructure

## 🛠️ Tech Stack

- **Framework**: Flutter 3.32.1+
- **State Management**: Riverpod with code generation
- **Navigation**: GoRouter for declarative routing
- **Database**: SQLite with sqflite
- **Forms**: Flutter Form Builder
- **Storage**: SharedPreferences for user settings
- **Localization**: Flutter's built-in internationalization

## 🚀 Getting Started

### Prerequisites
- Flutter SDK 3.32.3
- Android Studio / VS Code with Flutter extensions
- iOS development setup (for iOS builds)

### Installation

1. **Clone the repository**
   ```bash
   git clone <repository-url>
   cd hydrabuddy
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Generate code (for Riverpod providers)**
   ```bash
   dart run build_runner build
   ```
   
4. **Insert WeatherAPI Key into `lib/providers/weather.dart` line:27**

5. **Run the app**
   ```bash
   flutter run
   ```

### Platform Setup

#### Android
- Minimum SDK: API level 21 (Android 5.0)
- Target SDK: Latest stable version

#### iOS
- Minimum iOS version: 12.0
- Xcode 14.0 or higher required
- No special permissions required

## 📁 Project Structure

```
lib/
├── UI/                # Theme and UI configurations
├── dialogs/           # Modal dialogs and overlays
├── enum/              # Application enumerations
├── extensions/        # Dart extensions for utilities
├── l10n/              # Localization files
├── models/            # Data models and entities
├── pages/             # Screen/page widgets
├── providers/         # Riverpod state providers
├── router/            # Navigation configuration
├── utils/             # Utility functions and helpers
├── widgets/           # Reusable UI components
├── app.dart           # Main app configuration
├── main.dart          # Application entry point
└── storage.dart       # Database configuration
```

## 🎨 Design System

The app follows a cohesive design system with:
- **Primary Color**: Blue (#0570E1) with water-themed variations
- **Typography**: Material Design 3 text styles
- **Layout**: Consistent spacing (4px, 10px, 12px, 16px, 20px, 24px) and border radius
- **Components**: Gradient containers, cards with shadows, and modern form elements

## 🔧 Development

### Code Generation
The project uses code generation for Riverpod providers. Run the following command when adding new providers:

```bash
dart run build_runner build --delete-conflicting-outputs
```

### Localization
To add new languages or update translations:

1. Update `l10n.yaml` configuration
2. Add new `.arb` files in `lib/l10n/`
3. Run `flutter gen-l10n`

### Database Migrations
The app uses SQLite with custom migration handling. Database schema changes should be managed through the storage layer.

## 📊 Features in Detail

### Goal Management
- Automatic daily goal calculation
- Progress tracking with percentage completion

### Analytics Dashboard
- Daily, weekly, and monthly insights
- Streak tracking and performance metrics
- Comparative analysis with previous periods

## 🤝 Contributing

This is a portfolio project, but feedback and suggestions are welcome! Please feel free to:
- Report bugs or issues
- Suggest new features
- Provide UI/UX feedback

## 📄 License

This project is created for educational and portfolio purposes. Please respect the demo nature of this application.

## 🙏 Acknowledgments

- Flutter team for the amazing framework
- Material Design for UI guidelines
- Riverpod community for state management patterns

---

**Built with ❤️ using Flutter**
