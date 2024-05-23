import 'package:app_video_reproducer/domain/entities/video_post.dart';
import 'package:flutter/material.dart';

class VideoBottons extends StatelessWidget {

    final VideoPost video;


  const VideoBottons({super.key,  required this.video});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _CustomIconButton(
            value: video.likes!, iconData: Icons.favorite, iconColor: Colors.red),
            _CustomIconButton(
            value: video.views!, iconData: Icons.remove_red_eye_outlined, iconColor: Colors.red),
      ],
    );
  }
}

class _CustomIconButton extends StatelessWidget {
  final int value;
  final IconData iconData;
  final Color? color;

  _CustomIconButton({required this.value, required this.iconData, iconColor })
      : color = iconColor ?? Colors.white;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IconButton(
          onPressed: () {},
          icon: Icon(
            iconData,
            color: color,
          ),
        ),
        Text('$value')
      ],
    );
  }
}
