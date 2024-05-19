import 'package:app_video_reproducer/domain/entities/video_post.dart';

class LocalVideoModel {
  String name;
  String videoUrl;
  int? likes;
  int? views;

  LocalVideoModel({
    required this.name,
    required this.videoUrl,
    this.likes,
    this.views,
  });

  // Puedes agregar métodos adicionales como desdeJson o toJson si es necesario
  factory LocalVideoModel.fromJson(Map<String, dynamic> json) {
    return LocalVideoModel(
      name: json['name'],
      videoUrl: json['videoUrl'],
      likes: json['likes'],
      views: json['views'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'videoUrl': videoUrl,
      'likes': likes,
      'views': views,
    };
  }

  VideoPost toVideoPostEntity() {
    return VideoPost(
        name: name, videoUrl: videoUrl, likes: likes, views: views);
  }
}
