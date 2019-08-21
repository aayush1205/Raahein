import 'package:flutter/material.dart';
import 'package:login_page_with_indicator_slider/home_page.dart';

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData(
        accentColor: Colors.white,
        primaryColor: Color(0xFF000000),
        iconTheme: IconThemeData(
          color: Color(0xFF000000),
        ),
      ),
      home: HomePage(),
    ),
  );
}
