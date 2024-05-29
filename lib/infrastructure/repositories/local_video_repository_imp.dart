import 'package:app_video_reproducer/domain/datasources/video_post_datasource.dart';
import 'package:app_video_reproducer/domain/entities/video_post.dart';
import 'package:app_video_reproducer/domain/repositories/video_post_repositories.dart';

class LocalVideoRepositoryImp implements VideoPostRepositories {
  final VideoPostDatasource videoPostDatasource;

  LocalVideoRepositoryImp({required this.videoPostDatasource});

  @override
  Future<List<VideoPost>> getFavoriteVideosByUser(String iserId) {
    throw UnimplementedError();
  }

  @override
  Future<List<VideoPost>> getTrendingVideosByPage(int page) {
    return videoPostDatasource.getTrendingVideosByPage(page);
  }
}
