import 'package:app_video_reproducer/domain/datasources/video_post_datasource.dart';
import 'package:app_video_reproducer/domain/entities/video_post.dart';
import 'package:app_video_reproducer/infrastructure/models/local_video_model.dart';
import 'package:app_video_reproducer/shared/data/local_video_post.dart';

class LocalVideoDatasourceImp implements VideoPostDatasource {
  @override
  Future<List<VideoPost>> getFavoriteVideosByUser(String iserId) {
    throw UnimplementedError();
  }

  @override
  Future<List<VideoPost>> getTrendingVideosByPage(int page) async {
    await Future.delayed(const Duration(seconds: 2));

    final List<VideoPost> newVideos = videoPosts
        .map((video) => LocalVideoModel.fromJson(video).toVideoPostEntity())
        .toList();

        
    return newVideos;
  }
}
