import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class HomeVideoItem extends StatefulWidget {
  const HomeVideoItem({Key? key}) : super(key: key);

  @override
  State<HomeVideoItem> createState() => _HomeVideoItemState();
}

class _HomeVideoItemState extends State<HomeVideoItem> {
  late VideoPlayerController _controller;
  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset('assets/video/video1.mp4')
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        _controller.play();
        _controller.setLooping(true);
        setState(() {});
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(child: LayoutBuilder(builder: (ctx, constraints) {
      return Container(
        clipBehavior: Clip.none,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
        ),
        height: constraints.maxWidth * 2 > 600 ? 600 : constraints.maxWidth * 2,
        child: Column(
          children: [
            Expanded(
              child: _controller.value.isInitialized
                  ? Row(
                      children: [
                        AspectRatio(
                          aspectRatio: _controller.value.aspectRatio,
                          child: VideoPlayer(
                            _controller,
                          ),
                        ),
                      ],
                    )
                  : Container(),
            ),
          ],
        ),
      );
    }));
  }
}
