import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

// ignore: must_be_immutable
class ControlsScreen extends StatelessWidget {
  ControlsScreen({super.key, required this.audioPlayer});

  late AudioPlayer audioPlayer;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          icon: const Icon(Icons.skip_previous_rounded, color: Colors.white),
          iconSize: 64.0,
          onPressed: audioPlayer.seekToPrevious,
        ),
        StreamBuilder<PlayerState>(
          stream: audioPlayer.playerStateStream,
          builder: (context, snapshot) {
            final playerState = snapshot.data;
            final processingState = playerState?.processingState;
            final playing = playerState?.playing;
            if (processingState == ProcessingState.loading ||
                processingState == ProcessingState.buffering) {
              return const CircularProgressIndicator();
            } else if (playing != true) {
              return IconButton(
                icon: const Icon(Icons.play_arrow_rounded, color: Colors.white),
                iconSize: 64.0,
                onPressed: audioPlayer.play,
              );
            } else if (processingState != ProcessingState.completed) {
              return IconButton(
                icon: const Icon(Icons.pause_rounded, color: Colors.white),
                iconSize: 64.0,
                onPressed: audioPlayer.pause,
              );
            }
            return const Icon(
              Icons.play_arrow_rounded,
              size: 64.0,
              color: Colors.white,
            );
          },
        ),
        IconButton(
          icon: const Icon(Icons.skip_next_rounded, color: Colors.white),
          iconSize: 64.0,
          onPressed: audioPlayer.seekToNext,
        ),
      ],
    );
  }
}
