import 'package:flores_favsongs_assignment5/data/playlist.dart';
import 'package:flores_favsongs_assignment5/models/position_data.dart';
import 'package:flores_favsongs_assignment5/screens/song_details.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:just_audio_background/just_audio_background.dart';
import 'package:rxdart/rxdart.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late AudioPlayer audioPlayer;
  int? selectedIndex; // Track selected song index

  Stream<PositionData> get positionDataStream =>
      Rx.combineLatest3<Duration, Duration, Duration?, PositionData>(
        audioPlayer.positionStream,
        audioPlayer.bufferedPositionStream,
        audioPlayer.durationStream,
        (position, bufferedPosition, duration) =>
            PositionData(position, bufferedPosition, duration ?? Duration.zero),
      );

  @override
  void initState() {
    super.initState();
    audioPlayer = AudioPlayer();
    init();
  }

  Future<void> init() async {
    await audioPlayer.setLoopMode(LoopMode.all);
    await audioPlayer.setAudioSource(playlist);
  }

  @override
  void dispose() {
    audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final audioSources = playlist.children;

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
            title: const Text('My Fav Songs', style: TextStyle(color: Colors.white)),
            centerTitle: true,
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: audioSources.length,
              itemBuilder: (context, index) {
                final audioSource = audioSources[index];
                final mediaItem = (audioSource as UriAudioSource).tag as MediaItem;

                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage: AssetImage(mediaItem.artUri.toString()),
                  ),
                  title: Text(mediaItem.title),
                  subtitle: Text(mediaItem.artist ?? 'Unknown artist'),
                  onTap: () async {
                    setState(() {
                      selectedIndex = index;
                    });
                    await audioPlayer.seek(Duration.zero, index: index);
                    audioPlayer.play();

                    Navigator.push(
                      // ignore: use_build_context_synchronously
                      context,
                      MaterialPageRoute(
                        builder: (context) => SongDetailsScreen(
                          audioPlayer: audioPlayer,
                          songIndex: index,
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
