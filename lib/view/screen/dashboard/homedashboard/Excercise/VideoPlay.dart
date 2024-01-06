import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class PalyVideoYoutubeScreen extends StatefulWidget {
  final String url;
  final Function callback;
  const PalyVideoYoutubeScreen({
    super.key,
    required this.url,
    required this.callback,
  });

  @override
  State<PalyVideoYoutubeScreen> createState() => _PalyVideoYoutubeScreenState();
}

class _PalyVideoYoutubeScreenState extends State<PalyVideoYoutubeScreen> {
  late YoutubePlayerController _controller;
  bool _isPlayerReady = false;
  bool fullScreen = false;

  @override
  void initState() {
    super.initState();
    String urlLink = YoutubePlayer.convertUrlToId(widget.url).toString();

    _controller = YoutubePlayerController(
        initialVideoId: urlLink,
        flags: YoutubePlayerFlags(
            autoPlay: true,
            mute: false,
            disableDragSeek: false,
            loop: false,
            isLive: false,
            forceHD: false,
            showLiveFullscreenButton: false))
      ..addListener(listener);
  }

  bool fullscreen = false;
  void listener() {
    if (_isPlayerReady && mounted && fullscreen) {
      setState(() {});
    }
  }

  @override
  void dispose() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    _controller.dispose();
    super.dispose();
  }

  @override
  void deactivate() {
    _controller.pause();
    super.deactivate();
  }

  @override
  Widget build(BuildContext context) {
    return YoutubePlayerBuilder(
      onEnterFullScreen: () {
        widget.callback(true);
        this.fullScreen = true;
      },
      onExitFullScreen: () {
        widget.callback(false);
        this.fullScreen = false;
      },
      player: YoutubePlayer(
        aspectRatio: 16 / 9,
        controller: _controller,
        showVideoProgressIndicator: true,
        onReady: () {},
        progressColors: ProgressBarColors(
          playedColor: Colors.amber,
          handleColor: Colors.amberAccent,
        ),
      ),
      builder: (context, player) {
        return Scaffold(
          body: player,
        );
      },
    );
  }
}
