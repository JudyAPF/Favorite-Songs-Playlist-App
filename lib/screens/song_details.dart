// screens/song_details_screen.dart

import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:flores_favsongs_assignment5/components/media_metadata.dart';
import 'package:flores_favsongs_assignment5/models/position_data.dart';
import 'package:flores_favsongs_assignment5/screens/controls.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:just_audio/just_audio.dart';
import 'package:just_audio_background/just_audio_background.dart';
import 'package:rxdart/rxdart.dart';

class SongDetailsScreen extends StatelessWidget {
  final AudioPlayer audioPlayer;
  final int songIndex;

  const SongDetailsScreen({
    super.key,
    required this.audioPlayer,
    required this.songIndex,
  });

  Stream<PositionData> get positionDataStream =>
      Rx.combineLatest3<Duration, Duration, Duration?, PositionData>(
        audioPlayer.positionStream,
        audioPlayer.bufferedPositionStream,
        audioPlayer.durationStream,
        (position, bufferedPosition, duration) =>
            PositionData(position, bufferedPosition, duration ?? Duration.zero),
      );

  @override
  Widget build(BuildContext context) {
    final audioSources = audioPlayer.sequence;
    final audioSource = audioSources![songIndex];
    final metadata = audioSource.tag as MediaItem?;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xFF273ea5),
                Color(0xFF586cc3),
              ],
            ),
          ),
          child: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(
                Icons.keyboard_arrow_down_rounded,
                color: Colors.white,
              ),
            ),
            actions: [
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.more_horiz,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF586cc3),
              Color(0xFF273ea5),
            ],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (metadata != null)
              MediaMetadata(
                title: metadata.title,
                artist: metadata.artist ?? '',
                image: metadata.artUri?.toString() ?? '',
              ),
            const Gap(20),
            StreamBuilder<PositionData>(
              stream: positionDataStream,
              builder: (context, snapshot) {
                final positionData = snapshot.data;
                return ProgressBar(
                  barHeight: 8,
                  baseBarColor: Colors.grey,
                  bufferedBarColor: Colors.grey,
                  progressBarColor: Colors.red,
                  thumbColor: Colors.red,
                  timeLabelTextStyle: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 12),
                  progress: positionData?.position ?? Duration.zero,
                  buffered: positionData?.bufferedPosition ?? Duration.zero,
                  total: positionData?.duration ?? Duration.zero,
                  onSeek: audioPlayer.seek,
                );
              },
            ),
            const Gap(20),
            ControlsScreen(audioPlayer: audioPlayer),
          ],
        ),
      ),
    );
  }
}
