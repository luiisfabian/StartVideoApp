import 'package:app_video_reproducer/presentation/widgets/video/gradient_video_background.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class FullScreenPlayer extends StatefulWidget {
  final String videoUrl;
  final String name;
  const FullScreenPlayer(
      {super.key, required this.videoUrl, required this.name});

  @override
  State<FullScreenPlayer> createState() => _FullScreenPlayerState();
}

class _FullScreenPlayerState extends State<FullScreenPlayer> {
  late VideoPlayerController controller;

  @override
  void initState() {
    // TODO: implement initState
    controller = VideoPlayerController.asset(widget.videoUrl)
      ..setVolume(0)
      ..setLooping(true)
      ..play();

    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: controller.initialize(),
      builder: (context, snapshot) {
        if (snapshot.connectionState != ConnectionState.done) {
          return const Center(
            child: CircularProgressIndicator(
              strokeWidth: 2,
            ),
          );
        } else {
          return GestureDetector(
            onTap: () {
              setState(() {
            // If the video is playing, pause it.
            if (controller.value.isPlaying) {
              controller.pause();
            } else {
              // If the video is paused, play it.
              controller.play();
            }
          });
            },
            child: AspectRatio(
                aspectRatio: controller.value.aspectRatio,
                // Use the VideoPlayer widget to display the video.
                child: Stack(
                  children: [
                    VideoPlayer(controller),
            
                    //gradient

                    GradientVideoBackground(stops: [0.8, 1],),
            
                    //text
                    Positioned(
                      bottom: 50,
                      left: 20,
                      child: _videoName(name: widget.name),
                    )
                  ],
                )),
          );
        }
      },
    );
  }
}

class _videoName extends StatelessWidget {
  final String name;
  const _videoName({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    final titleStyle = Theme.of(context).textTheme.titleLarge;

    return SizedBox(
      width: _size.width * 0.6,
      child: Text(
        name,
        maxLines: 2,
        style: titleStyle,
      ),
    );
  }
}
