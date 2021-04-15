import 'package:better_player/better_player.dart';
import 'package:flutter/material.dart';

class Preview extends StatefulWidget {
  final String? outputVideoPath;

  Preview(this.outputVideoPath);

  @override
  _PreviewState createState() => _PreviewState();
}

class _PreviewState extends State<Preview> {
  late BetterPlayerController _controller;

  @override
  void initState() {
    _controller = BetterPlayerController(
      BetterPlayerConfiguration(fit: BoxFit.contain, autoPlay: true),
      betterPlayerDataSource:
          BetterPlayerDataSource.file(widget.outputVideoPath!),
    );
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text("Preview"),
      ),
      body: Center(
        child: _controller.videoPlayerController?.value.initialized ?? false
            ? Container(
                child: BetterPlayer(controller: _controller),
              )
            : Container(
                child: Center(
                child: CircularProgressIndicator(backgroundColor: Colors.white),
              )),
      ),
    );
  }
}
