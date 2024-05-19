import 'package:app_video_reproducer/domain/entities/video_post.dart';
import 'package:flutter/material.dart';

class DiscoverProvider extends ChangeNotifier {
  bool initialLoading = true;

  List<VideoPost> videos = [];

  Future<void> LoadNextVideo() async {


    notifyListeners();
  }
}
