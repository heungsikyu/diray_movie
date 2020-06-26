import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class YoutubePlayerWidget extends StatefulWidget {
  @override
  _YoutubePlayerWidgetState createState() => _YoutubePlayerWidgetState();
}

class _YoutubePlayerWidgetState extends State<YoutubePlayerWidget> {

  String videoUrl = "https://www.youtube.com/watch?v=6pxRHBw-k8M";
  YoutubePlayerController _controller ;

  @override
  void initState() {
    // TODO: implement initState
    _controller = YoutubePlayerController(
        initialVideoId: YoutubePlayer.convertUrlToId(videoUrl),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          YoutubePlayer(
            controller: _controller,
          ),
        ],
      ),
    );
  }
}
