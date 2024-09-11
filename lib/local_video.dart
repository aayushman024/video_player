// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

void main(){
  runApp(const LocalVideo());
}

class LocalVideo extends StatefulWidget {
  const LocalVideo({super.key});

  @override
  State<LocalVideo> createState() => _LocalVideoState();
}
class _LocalVideoState extends State<LocalVideo> {

  late VideoPlayerController  _localVideoController;

  @override
  void initState() {
    super.initState();
    _localVideoController = VideoPlayerController.asset('assets/testVideo.mp4')
    ..addListener(() => setState(() {} ) )
      ..setLooping(true)
      ..initialize().then((_) => _localVideoController.play());
  }

  @override
  Widget build(BuildContext context) {

    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 10,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: Icon(
                Icons.arrow_back,
                color: Colors.white,
              ))
        ],
        backgroundColor: Color(0xff005AFF),
        leading: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Image.asset('assets/logo.png'),
        ),
        leadingWidth: 80,
      ),
      body: ListView(
        children: [

        ],
      ),
    );
  }
}
