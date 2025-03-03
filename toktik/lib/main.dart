import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toktik/config/theme/app_theme.dart';
import 'package:toktik/infraestructure/datasources/local_video_datasource_impl.dart';
import 'package:toktik/infraestructure/repositories/video_posts_repository_impl.dart';
import 'package:toktik/presentation/providers/discover_provider.dart';
import 'package:toktik/presentation/screens/discover/discovery_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final videoRepository = VideoPostsRepositoryImpl(
      videoPostsDatasource: LocalVideoDataSourceImpl(),
    );
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
            lazy:
                false, //para que inmediatamente se lance el constructor y este lista
            create: (_) =>
                DiscoverProvider(videoPostsRepository: videoRepository)
                  ..loadNextPage()),
      ],
      child: MaterialApp(
          title: 'TokTik',
          debugShowCheckedModeBanner: false,
          theme: AppTheme().getThema(),
          home: DiscoveryScreen()),
    );
  }
}
