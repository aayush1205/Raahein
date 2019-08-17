import 'package:flutter/material.dart';
import 'package:login_heptad/home_page.dart';

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData(
        accentColor: Colors.black,
        primaryColor: Color(0xFF000000),
        iconTheme: IconThemeData(
          color: Color(0xFF000000),
        ),
      ),
      home: HomePage(),
    ),
  );
}
