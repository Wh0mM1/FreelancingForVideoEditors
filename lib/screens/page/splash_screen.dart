import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    final FlickManager flickManager = FlickManager(
      autoPlay: true,
      onVideoEnd: () {
        Navigator.pushNamed(context, '/onboarding');
        dispose();
      },
      videoPlayerController: VideoPlayerController.asset(
        'assets/images/splash_ani.mp4',
        videoPlayerOptions: VideoPlayerOptions(allowBackgroundPlayback: false),
      ),
      autoInitialize: true,
    );
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: MediaQuery.of(context).size.height,
          child: AspectRatio(
            aspectRatio: 9 / 16,
            child: FlickVideoPlayer(
              flickManager: flickManager,
            ),
          ),
        ),
      ),
    );
  }
}
