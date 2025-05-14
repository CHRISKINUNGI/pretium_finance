# Pretium Finance Flutter App

![Pretium Finance Logo](assets/icons/pretium_icon.jpeg) 

## 📖 Overview

Pretium Finance is a Flutter-based mobile application designed to simplify cryptocurrency payments and financial services across Africa. It aims to provide users with a seamless and secure platform for managing digital assets, paying bills, accepting payments, and more.

## ✨ Features

The application includes the following key features:

* **Splash Screen**: An initial loading screen displaying the app branding.
* **User Onboarding**: A guided introduction to the app's main functionalities:
    * Direct Pay: Effortlessly pay with crypto.
    * Accept Payments: Hassle-free stablecoin payment acceptance.
    * Pay Bills: Utility bill payments with potential rewards.
* **Authentication**: Secure user registration and login:
    * Sign Up with first name, last name, email, and password.
    * Login with email and password.
    * "Remember me" and "Forgot Password?" (placeholder) functionality.
* **PIN Security**:
    * Creation of a 4-digit PIN for app access.
    * PIN confirmation step.
* **Main Dashboard (Home Screen)**:
    * Displays user's wallet balance (e.g., KES and USD).
    * Visibility toggle for balances.
    * Quick access to financial services:
        * Send Money
        * Buy Goods
        * Paybill
        * Airtime
    * Section for recent transactions (placeholder list).
* **Navigation**:
    * Bottom navigation bar for easy access to Wallet (Home), Scan QR (placeholder), and Activity (placeholder).

## 🛠️ Tech Stack

* **Framework**: Flutter
* **State Management**: GetX
* **Routing**: GetX
* **Local Storage**: `shared_preferences` (for onboarding status, PIN, etc.)
* **UI Components**:
    * Material Design
    * Custom widgets for buttons, text fields, etc.
    * `dots_indicator` for onboarding.
* **Linting**: `flutter_lints`
* **Logging**: `logger` package (for debug builds)

## ⚙️ Getting Started

### Prerequisites

* Flutter SDK: Ensure you have Flutter installed. Refer to the [official Flutter installation guide](https://flutter.dev/docs/get-started/install).
* An IDE like Android Studio or VS Code with Flutter plugins.
* A connected device (emulator or physical device) to run the app.

### Installation & Setup

1.  **Clone the repository:**
    ```bash
    git clone <your-repository-url>
    cd pretium_finance
    ```

2.  **Install dependencies:**
    ```bash
    flutter pub get
    ```

3.  **Add Assets:**
    * Ensure you have a logo image at `assets/images/pretium_logo.png`.

4.  **Run the application:**
    ```bash
    flutter run
    ```

## 📂 Project Structure (High-Level)
```

pretium_finance/
├── android/
├── ios/
├── lib/
│   ├── app_bindings.dart         # Global app bindings
│   ├── config/                   # App configuration (colors, text styles, theme)
│   │   ├── app_colors.dart
│   │   ├── app_text_styles.dart
│   │   └── app_theme.dart
│   ├── constants/                # App-wide constants (e.g., asset paths)
│   │   └── app_assets.dart
│   ├── controllers/              # GetX controllers for business logic
│   │   ├── auth_controller.dart
│   │   ├── home_controller.dart
│   │   ├── main_navigation_controller.dart
│   │   ├── onboarding_controller.dart
│   │   ├── pin_controller.dart
│   │   └── splash_controller.dart
│   ├── main.dart                 # Main application entry point
│   ├── routes/                   # GetX route definitions
│   │   ├── app_pages.dart
│   │   └── app_routes.dart
│   ├── screens/                  # UI screens/pages
│   │   ├── auth/
│   │   ├── home/
│   │   ├── main_navigation/
│   │   ├── onboarding/
│   │   ├── pin/
│   │   └── splash/
│   ├── utils/                    # Utility classes (e.g., logger)
│   │   └── logger.dart
│   └── widgets/                  # Reusable custom widgets
│       ├── custom_button.dart
│       └── custom_text_field.dart
├── assets/
│   └── images/
│       └── pretium_logo.png
├── pubspec.yaml                  # Project dependencies and metadata
└── README.md                     # This file
```
## 🤝 Contributing (Placeholder)

Contributions are welcome! If you'd like to contribute, please follow these steps:

1.  Fork the repository.
2.  Create a new branch (`git checkout -b feature/your-feature-name`).
3.  Make your changes.
4.  Commit your changes (`git commit -m 'feat: Add some amazing feature'`).
5.  Push to the branch (`git push origin feature/your-feature-name`).
6.  Open a Pull Request.

Please make sure to update tests as appropriate.

