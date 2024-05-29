import 'package:app_video_reproducer/domain/entities/video_post.dart';

abstract class VideoPostDatasource {

    Future<List<VideoPost>> getFavoriteVideosByUser(String iserId);


  Future<List<VideoPost>> getTrendingVideosByPage(int page);
}
