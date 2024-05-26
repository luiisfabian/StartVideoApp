import 'package:animate_do/animate_do.dart';
import 'package:app_video_reproducer/config/helpers/human_helpers.dart';
import 'package:app_video_reproducer/domain/entities/video_post.dart';
import 'package:flutter/material.dart';

class VideoBottons extends StatelessWidget {
  final VideoPost video;

  const VideoBottons({super.key, required this.video});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _CustomIconButton(
            value: video.likes!,
            iconData: Icons.favorite,
            iconColor: Colors.red),
        const SizedBox(
          height: 20,
        ),
        _CustomIconButton(
            value: video.views!,
            iconData: Icons.remove_red_eye_outlined,
            iconColor: Colors.white),
        const SizedBox(
          height: 20,
        ),
        SpinPerfect(
          infinite: true,
          duration: const Duration(seconds: 5),
          child: _CustomIconButton(
              value: 0,
              iconData: Icons.play_circle_outline,
              iconColor: Colors.white),
        ),
       
      ],
    );
  }
}

class _CustomIconButton extends StatelessWidget {
  final int value;
  final IconData iconData;
  final Color? color;

  _CustomIconButton({required this.value, required this.iconData, iconColor})
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
        if (value > 0)
          Text(' ${HumanHelpers.humanReadbleNumber(value.toDouble())}')
      ],
    );
  }
}
