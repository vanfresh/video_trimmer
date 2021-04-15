import 'package:better_player/better_player.dart';
import 'package:flutter/material.dart';
import 'package:video_trimmer/src/trim_editor.dart';

class VideoViewer extends StatefulWidget {
  /// For specifying the color of the video
  /// viewer area border. By default it is set to `Colors.transparent`.
  final Color borderColor;

  /// For specifying the border width around
  /// the video viewer area. By default it is set to `0.0`.
  final double borderWidth;

  /// For specifying a padding around the video viewer
  /// area. By default it is set to `EdgeInsets.all(0.0)`.
  final EdgeInsets padding;

  /// For showing the video playback area.
  ///
  /// This only contains optional parameters. They are:
  ///
  /// * [borderColor] for specifying the color of the video
  /// viewer area border. By default it is set to `Colors.transparent`.
  ///
  ///
  /// * [borderWidth] for specifying the border width around
  /// the video viewer area. By default it is set to `0.0`.
  ///
  ///
  /// * [padding] for specifying a padding around the video viewer
  /// area. By default it is set to `EdgeInsets.all(0.0)`.
  ///
  VideoViewer({
    this.borderColor = Colors.transparent,
    this.borderWidth = 0.0,
    this.padding = const EdgeInsets.all(0.0),
  });

  @override
  _VideoViewerState createState() => _VideoViewerState();
}

class _VideoViewerState extends State<VideoViewer> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: widget.padding,
        child: AspectRatio(
          aspectRatio: playerController.getAspectRatio() ?? 9.0 / 16.0,
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(
                width: widget.borderWidth,
                color: widget.borderColor,
              ),
            ),
            child: BetterPlayer(controller: playerController),
          ),
        ),
      ),
    );
  }
}
