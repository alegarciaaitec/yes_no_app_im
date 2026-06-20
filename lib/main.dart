import 'package:flutter/material.dart';
import 'package:yes_no_app_im/config/theme/app_theme.dart';
import 'package:yes_no_app_im/presentation/screens/chat_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: AppTheme(selectedColor: 0).theme(),
      home: const ChatScreen(),
    );
  }
}
