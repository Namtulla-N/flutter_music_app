import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_music_app/models/song_model.dart';
import 'package:flutter_music_app/provider/provider_widget.dart';
import 'package:provider/provider.dart';

class RotatePlayer extends AnimatedWidget {
  RotatePlayer({Key key, Animation<double> animation})
      : super(key: key, listenable: animation);

  Widget build(BuildContext context) {
    final Animation<double> animation = listenable;
    SongModel songModel = Provider.of(context);
    return ProviderWidget<SongListModel>(
        model: SongListModel(),
        onModelReady: (model) {},
        builder: (context, model, child) {
          return GestureDetector(
            onTap: () {
              
            },
            child: RotationTransition(
                turns: animation,
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.5,
                  height: MediaQuery.of(context).size.width * 0.5,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: NetworkImage(songModel.currentSong.pic),
                    ),
                  ),
                ),
              ),
          );
        });
  }
}