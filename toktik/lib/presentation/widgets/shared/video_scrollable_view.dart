import 'package:flutter/material.dart';
import 'package:toktik/domain/entities/video_post.dart';
import 'package:toktik/presentation/widgets/shared/video_buttons.dart';
import 'package:toktik/presentation/widgets/video/full_screen.dart';

class VideoScrollableView extends StatelessWidget {
  final List<VideoPost> videos;
  const VideoScrollableView({super.key, required this.videos});

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      scrollDirection: Axis.vertical,
      physics: BouncingScrollPhysics(),
      itemCount: videos.length,
      itemBuilder: (context, index) {
        final VideoPost videoPost = videos[index];
        return Stack(children: [
          //video play + gradiente
          SizedBox.expand(
              child: FullScreenPlayer(
                  videoUrl: videoPost.videoUrl, caption: videoPost.caption)),
          Positioned(
              bottom: 40, right: 20, child: VideoButtons(video: videoPost))
        ]);
      },
    );
  }
}
