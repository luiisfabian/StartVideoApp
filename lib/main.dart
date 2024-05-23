import 'package:app_video_reproducer/config/AppTheme.dart';
import 'package:app_video_reproducer/presentation/providers/discover_provider.dart';
import 'package:app_video_reproducer/presentation/screens/discover/discover_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      
      providers: [
        
        ChangeNotifierProvider(
          lazy: false,
            create: (_) => DiscoverProvider()..LoadNextVideo())
      ],
      child: MaterialApp(
          title: 'Start Video',
          debugShowCheckedModeBanner: false,
          theme: AppTheme().getTheme(),
          home: const DiscoverScreen()),
    );
  }
}
