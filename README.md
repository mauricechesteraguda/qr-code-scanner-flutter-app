# QR Code Scanner Flutter App

This repository contains a Flutter mobile app template that utilizes a QR code scanner. The app is designed as a simple demonstration of integrating QR code scanning functionality into a Flutter application.

## Features

  QR Code Scanner: Scan QR codes and display the scanned data.
  
  Drawer Navigation: Simple drawer menu with customizable options.
  
  Bottom Navigation Bar: Navigate between Home, Scan, and Settings screens using a bottom navigation bar.
  
  Dialog and Modal Sheets: Includes basic UI elements like dialogs and modal bottom sheets for user interactions.
  
  Customizable UI: Easily modify the UI components to fit your needs.

## Getting Started

To run the project locally, follow the steps below:
Prerequisites

## Ensure that you have the following installed on your machine:

  Flutter SDK
  
  Android Studio or Visual Studio Code with Flutter plugin
  
  A connected mobile device or emulator

## Installation

  Clone this repository:

    git clone https://github.com/mauricechesteraguda/qr-code-scanner-flutter-app.git

## Navigate to the project directory:

    cd qr-code-scanner-flutter-app

## Fetch dependencies:

    flutter pub get

## Running the App

To run the app on an emulator or connected device:

  Make sure a device is connected or an emulator is running.
  Use the following command to run the app:
  
    flutter run

## How it Works

  Home Screen: Displays the initial interface with options to open the scanner, navigate settings, or handle other drawer options.
  
  QR Code Scanner: Clicking the scan button in the bottom navigation opens the QR code scanner. Scanned data is processed and displayed in real-time.
  
  Drawer and Settings: Provides additional options through the side drawer and settings modal.

## App Structure

    main.dart: Main entry point of the app.
    QRViewExample: Main stateful widget for handling QR code scanning.
    Key Components:
        QRView: Handles camera and QR scanning functionality.
        BottomNavigationBar: Provides a navigation method between screens.
        Drawer: Navigation drawer with additional options.
        AlertDialog: Displays scan results.

## Code Snippet for QR Scanning

  dart
    
    QRView(
    key: qrKey,
    onQRViewCreated: _onQRViewCreated,
    );

The QRView widget from the qr_code_scanner package is used to initialize the camera and handle the QR scanning process. Scanned data is processed in the scannedDataStream.
Screenshots

## Dependencies

This project uses the following package:

  qr_code_scanner: A Flutter plugin for scanning QR codes with mobile device cameras.

## Contributing

Contributions are welcome! If you wish to contribute to the project:

  Fork the repository.
  
  Create a new branch for your feature or bug fix.
  
  Submit a pull request.

License

This project is licensed under the MIT License. See the LICENSE file for details.

## Contact

For any questions or inquiries, please reach out to https://www.linkedin.com/in/maurice-chester-aguda-09b93981/.

## Support

If you find this project helpful and would like to support its ongoing development, consider buying me a coffee! Your support helps me keep working on this project and developing more features.

[![Buy Me a Coffee](https://www.buymeacoffee.com/assets/img/custom_images/yellow_img.png)](https://www.buymeacoffee.com/mauriceague)
