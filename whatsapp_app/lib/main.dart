import 'package:flutter/material.dart';
import 'package:whatsapp_app/screens/welcomepage.dart';
// Import the login screen

void main() {
  runApp(const WhatsChatApp());
}

class WhatsChatApp extends StatelessWidget {
  const WhatsChatApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WhatsChat',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.teal,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: const Welcomepage(), // Set LoginScreen as the first screen
    );
  }
}
