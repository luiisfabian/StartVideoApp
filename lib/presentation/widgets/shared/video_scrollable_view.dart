import 'package:app_video_reproducer/domain/entities/video_post.dart';
import 'package:app_video_reproducer/presentation/widgets/video_player.dart/video_bottons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class VideoScrollableView extends StatelessWidget {
  VideoScrollableView({super.key, required this.videos});

  List<VideoPost> videos;

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      itemCount: videos.length,
      itemBuilder: (context, index) {
        final VideoPost videoPost = videos[index];

        return Stack(
          children: [
            // video p´later + gradiente

            //botones
            
            Positioned(
                bottom: 40,
                right: 20,
                child: VideoBottons(
                  video: videoPost,
                ))
          ],
        );
      },
      scrollDirection: Axis.vertical,
      physics: BouncingScrollPhysics(),
    );
  }
}

