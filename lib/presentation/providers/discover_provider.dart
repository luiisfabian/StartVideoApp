import 'package:app_video_reproducer/domain/entities/video_post.dart';
import 'package:app_video_reproducer/domain/repositories/video_post_repositories.dart';
// import 'package:app_video_reproducer/infrastructure/models/local_video_model.dart';
// import 'package:app_video_reproducer/shared/data/local_video_post.dart';
import 'package:flutter/material.dart';

class DiscoverProvider extends ChangeNotifier {
  // TODO: repository, datasource

  final VideoPostRepositories videoPostRepository;

  bool initialLoading = true;

  List<VideoPost> videos = [];

  DiscoverProvider({required this.videoPostRepository});

  Future<void> LoadNextVideo() async {
    await Future.delayed(Duration(seconds: 2));

    // final List<VideoPost> newVideos = videoPosts
    //     .map((video) => LocalVideoModel.fromJson(video).toVideoPostEntity())
    //     .toList();

    final newVideos = await videoPostRepository.getTrendingVideosByPage(1);

    videos.addAll(newVideos);
    initialLoading = false;
    notifyListeners();
  }
}
