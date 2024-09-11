// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'home_page.dart';

void main(){
  runApp(const VideoTest());
}

class VideoTest extends StatefulWidget {
  const VideoTest({super.key});

  @override
  State<VideoTest> createState() => _VideoTestState();
}

class _VideoTestState extends State<VideoTest> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent),
        useMaterial3: true
        ),
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
