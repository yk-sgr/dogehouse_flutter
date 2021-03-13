import 'package:dogehouse_flutter/screens/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle());
  runApp(DogeHouseApp());
}

class DogeHouseApp extends StatefulWidget {
  @override
  _DogeHouseAppState createState() => _DogeHouseAppState();
}

class _DogeHouseAppState extends State<DogeHouseApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Color(0xFFfc4e4c),
        backgroundColor: Color(0xFF151a21),
        scaffoldBackgroundColor: Color(0xFF0c0e11),
      ),
      home: HomeScreen(),
    );
  }
}
