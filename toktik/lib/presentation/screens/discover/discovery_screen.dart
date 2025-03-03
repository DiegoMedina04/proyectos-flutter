import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toktik/presentation/providers/discover_provider.dart';
import 'package:toktik/presentation/widgets/shared/video_scrollable_view.dart';

class DiscoveryScreen extends StatelessWidget {
  const DiscoveryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final discoveryProvider = context.watch<DiscoverProvider>();
    return Scaffold(
      body: discoveryProvider.initialLoading
          ? Center(child: CircularProgressIndicator(strokeWidth: 2))
          : VideoScrollableView(videos: discoveryProvider.videos),
    );
  }
}
