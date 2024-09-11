// ignore_for_file: prefer_const_constructors, prefer_const_declarations, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

void main() {
  runApp(const VideoScreen());
}

class VideoScreen extends StatefulWidget {
  const VideoScreen({super.key});

  @override
  State<VideoScreen> createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
  final videoURL = "https://youtu.be/H5VeQ9d_Q88?si=9mTfCuLq1uZLIpQ3";
  late YoutubePlayerController ytController;

  @override
  void initState() {
    final videoID = YoutubePlayer.convertUrlToId(videoURL);
    ytController = YoutubePlayerController(
        initialVideoId: videoID!,
        flags: YoutubePlayerFlags(
          autoPlay: true,
          loop: true,
          enableCaption: true,
          controlsVisibleAtStart: true,
        ));
    super.initState();
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
          YoutubePlayerBuilder(
            player: YoutubePlayer(
              bottomActions: [
                FullScreenButton(),
                RemainingDuration(),
                ProgressBar(
                  isExpanded: true,
                ),
                CurrentPosition(),
              ],
              topActions: [
                PlaybackSpeedButton(),
              ],
              controller: ytController,
            ),
            builder: (context, player) {
              return Column(
                children: [
                  player,
                ],
              );
            },
          ),
          Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Container(
                height: screenHeight*0.08,
                width: screenWidth,
                decoration: BoxDecoration(
                    color: Colors.white70, boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    spreadRadius: 0,
                    blurRadius: 18,
                    offset: Offset(0, 15)
                  )
                ]),
                child: Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      '#24. Video title will be shown like this',
                      style: GoogleFonts.poppins(
                          fontSize: 20, fontWeight: FontWeight.w400),
                    ),
                  ),
                ),
              )),
          Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Container(
                height: screenHeight*0.4,
                width: screenWidth,
                decoration: BoxDecoration(
                    color: Colors.white70, boxShadow: [
                  BoxShadow(
                      color: Colors.black12,
                      spreadRadius: 0,
                      blurRadius: 18,
                      offset: Offset(0, 15)
                  )
                ]),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Video description and other information related to video or guide can be shown here.',
                      style: GoogleFonts.poppins(
                          fontSize: 15, fontWeight: FontWeight.w200),
                    ),
                  ),
                ),
              )),
        ],
      ),
    );
  }
}
