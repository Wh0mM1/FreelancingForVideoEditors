import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/material.dart';
import 'package:freelancing_video/model/video_model.dart';
import 'package:video_player/video_player.dart';

int count = 1;

class DetailsPage extends StatefulWidget {
  final Vids plant;
  const DetailsPage({Key? key, required this.plant}) : super(key: key);

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    final FlickManager flickManager = FlickManager(
      autoPlay: false,
      videoPlayerController: VideoPlayerController.asset(
        'assets/images/videoplayback.mp4',
      ),
    );
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              padding: EdgeInsets.all(10),
              height: MediaQuery.of(context).size.height * 0.95,
              child: ListView(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.04,
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    margin: EdgeInsets.all(15),
                    height: MediaQuery.of(context).size.height / 2.5,
                    child: AspectRatio(
                      aspectRatio: 16 / 9,
                      child: FlickVideoPlayer(
                        flickManager: flickManager,

                        // flickVideoWithControls: FlickVideoWithControls(
                        //   videoFit: BoxFit.fitWidth,
                        // ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: widget.plant.name,
                                    style: TextStyle(
                                      color: Colors.black.withOpacity(0.8),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 25.0,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              height: 30.0,
                              width: 30.0,
                              padding: const EdgeInsets.all(8.0),
                              decoration: BoxDecoration(
                                color: Colors.purple,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.purple,
                                    blurRadius: 15,
                                    offset: const Offset(0, 5),
                                  ),
                                ],
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              child: Image.asset(
                                'assets/images/heart.png',
                                color: Colors.white,
                              ),
                            )
                          ],
                        ),
                        const SizedBox(height: 20.0),
                        Text(
                          'Category: ${widget.plant.category}',
                          style: TextStyle(
                            color: Colors.black.withOpacity(0.5),
                            fontSize: 20.0,
                          ),
                        ),
                        const SizedBox(height: 20.0),
                        Container(
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Client Name: ",
                                  style: TextStyle(fontSize: 20),
                                ),
                                Text(
                                  "Shroud",
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.purple.withOpacity(0.8),
                                  ),
                                ),
                              ]),
                        ),
                        const SizedBox(height: 20.0),
                        Text(
                          "Description: ",
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          widget.plant.description,
                          style: TextStyle(
                            color: Colors.black.withOpacity(0.5),
                            fontSize: 15.0,
                            height: 1.4,
                            letterSpacing: 0.5,
                          ),
                          maxLines: 8,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.arrow_back),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
