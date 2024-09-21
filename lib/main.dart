import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: QRViewExample(),
    );
  }
}

class QRViewExample extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _QRViewExampleState();
}

class _QRViewExampleState extends State<QRViewExample> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  late QRViewController controller;
  late BuildContext context;
  bool isCameraOpen = false;
  bool canScanAgain = true;
  String scannedData = '';
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    this.context = context;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text('QR Code Scanner'),
        actions: [
          IconButton(
            icon: Icon(Icons.person),
            onPressed: () {
              _showUserOptions();
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Drawer Header',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              title: Text('Option 1'),
              onTap: () {
                // Handle Option 1
              },
            ),
            ListTile(
              title: Text('Option 2'),
              onTap: () {
                // Handle Option 2
              },
            ),
            ListTile(
              title: Text('Option 3'),
              onTap: () {
                // Handle Option 3
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            if (isCameraOpen)
              Container(
                height: screenHeight / 2,
                child: QRView(
                  key: qrKey,
                  onQRViewCreated: _onQRViewCreated,
                ),
              ),
            if (scannedData.isNotEmpty)
              Column(
                children: [
                  Text(
                    'Scanned Data: $scannedData',
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      // Clear the scanned data
                      setState(() {
                        scannedData = '';
                      });
                    },
                    child: Text('Clear'),
                  ),
                ],
              ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
            _handleBottomNavigationBarTaps(index);
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.qr_code),
            label: 'Scan',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      _processScanData(scanData);
    });
  }

  void _processScanData(Barcode scanData) {
    if (!canScanAgain) {
      // Don't process the scan if canScanAgain is false
      return;
    }

    // Handle the scanned data
    setState(() {
      scannedData = scanData.code!;
    });

    // Show success alert and set canScanAgain to false
    _showSuccessAlert();
    setState(() {
      canScanAgain = false;
    });
  }

  void _showSuccessAlert() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Scan Success'),
        content: Text('Scanned Data: $scannedData'),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              // Set canScanAgain to true after the "OK" button is pressed
              setState(() {
                canScanAgain = true;
              });
            },
            child: Text('OK'),
          ),
        ],
      ),
    );
  }

  void _showUserOptions() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                leading: Icon(Icons.settings),
                title: Text('Settings'),
                onTap: () {
                  // Handle Settings
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(Icons.exit_to_app),
                title: Text('Sign Out'),
                onTap: () {
                  // Handle Sign Out
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  void _handleBottomNavigationBarTaps(int index) {
    switch (index) {
      case 0:
        // Handle Home
        break;
      case 1:
        // Handle Scan
        if (canScanAgain) {
          setState(() {
            isCameraOpen = !isCameraOpen;
          });
        }
        break;
      case 2:
        // Handle Settings
        _showUserOptions();
        break;
    }
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
