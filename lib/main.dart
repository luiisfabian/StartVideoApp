import 'package:app_video_reproducer/config/AppTheme.dart';
import 'package:app_video_reproducer/domain/repositories/video_post_repositories.dart';
import 'package:app_video_reproducer/infrastructure/datasources/local_video_datasource_imp.dart';
import 'package:app_video_reproducer/infrastructure/repositories/local_video_repository_imp.dart';
import 'package:app_video_reproducer/presentation/providers/discover_provider.dart';
import 'package:app_video_reproducer/presentation/screens/discover/discover_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final videoPostRepository =
        LocalVideoRepositoryImp(videoPostDatasource: LocalVideoDatasourceImp());

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
            lazy: false, create: (_) => DiscoverProvider(videoPostRepository: videoPostRepository)..LoadNextVideo())
      ],
      child: MaterialApp(
          title: 'Start Video',
          debugShowCheckedModeBanner: false,
          theme: AppTheme().getTheme(),
          home: const DiscoverScreen()),
    );
  }
}
