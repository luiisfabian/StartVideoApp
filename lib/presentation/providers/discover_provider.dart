import 'package:app_video_reproducer/domain/entities/video_post.dart';
import 'package:app_video_reproducer/infrastructure/models/local_video_model.dart';
import 'package:app_video_reproducer/shared/data/local_video_post.dart';
import 'package:flutter/material.dart';

class DiscoverProvider extends ChangeNotifier {
  // TODO: repository, datasource

  bool initialLoading = true;

  List<VideoPost> videos = [];

  Future<void> LoadNextVideo() async {
    await Future.delayed(Duration(seconds: 2));

    final List<VideoPost> newVideos = videoPosts
        .map((video) => LocalVideoModel.fromJson(video).toVideoPostEntity())
        .toList();

    videos.addAll(newVideos);
    initialLoading = false;
    notifyListeners();
  }
}
