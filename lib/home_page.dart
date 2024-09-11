// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:video_player_test/local_video.dart';
import 'package:video_player_test/video_screen.dart';

void main(){
  runApp(const HomePage());
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {

    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 10,
        backgroundColor: Color(0xff005AFF),
        leading: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Image.asset('assets/logo.png'),
        ),
        leadingWidth: 80,
      ),
      body: Center(
        child: SizedBox(
          height: screenHeight*0.95,
          width: screenWidth*0.95,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ElevatedButton(
                style: ButtonStyle(
                  elevation: WidgetStateProperty.all(8),
                  shape: WidgetStateProperty.all(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)))
                ),
                onPressed: (){
                  setState(() {
                    Navigator.push(context, CupertinoPageRoute(builder: (_)=> VideoScreen()));
                  });
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 30, bottom: 30),
                      child: Text('Play video from YouTube', style: GoogleFonts.poppins(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w400
                      ),),
                    ),
                    Icon(Icons.arrow_forward_ios_outlined)
                  ],
                ),
              ),
              ElevatedButton(
                style: ButtonStyle(
                    elevation: WidgetStateProperty.all(8),
                    shape: WidgetStateProperty.all(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)))
                ),
                onPressed: (){
                  Navigator.push(context, CupertinoPageRoute(builder: (_) => LocalVideo()));
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 30, bottom: 30),
                      child: Text('Play video from Local Storage', style: GoogleFonts.poppins(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.w400
                      ),),
                    ),
                    Icon(Icons.arrow_forward_ios_outlined)
                  ],
                ),
              ),
              ElevatedButton(
                style: ButtonStyle(
                    elevation: WidgetStateProperty.all(8),
                    shape: WidgetStateProperty.all(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)))
                ),
                onPressed: (){
                  //Navigator.push(context, CupertinoPageRoute(builder: (_) => LocalVideo()));
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 30, bottom: 30),
                      child: Text('Play video from Cloud Server', style: GoogleFonts.poppins(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.w400
                      ),),
                    ),
                    Icon(Icons.arrow_forward_ios_outlined)
                  ],
                ),
              ),
              SizedBox(
                height: screenHeight*0.5,
              )
            ],
          ),
        ),
      ),
    );
  }
}
