import 'package:just_audio/just_audio.dart';
import 'package:just_audio_background/just_audio_background.dart';

final playlist = ConcatenatingAudioSource(children: [
    AudioSource.uri(
      Uri.parse("asset:///assets/audio/Fireflies.mp3"),
      tag: MediaItem(
        id: "0",
        title: "Fireflies",
        artist: "Owl City",
        artUri: Uri.parse("assets/images/owlcity.jpeg"),
      ),
    ),
    AudioSource.uri(
      Uri.parse("asset:///assets/audio/Like I Do.mp3"),
      tag: MediaItem(
        id: "1",
        title: "Like I Do",
        artist: "J. Tajor",
        artUri: Uri.parse("assets/images/j_tajor.jpeg"),
      ),
    ),
    AudioSource.uri(
      Uri.parse("asset:///assets/audio/Daylight.mp3"),
      tag: MediaItem(
        id: "2",
        title: "Daylight",
        artist: "Taylor Swift",
        artUri: Uri.parse("assets/images/daylight.jpg"),
      ),
    ),
    AudioSource.uri(
      Uri.parse("asset:///assets/audio/Something Just Like This.mp3"),
      tag: MediaItem(
        id: "3",
        title: "Something Just Like This",
        artist: "The Chainsmokers & Coldplay",
        artUri: Uri.parse("assets/images/something_just_like_this.png"),
      ),
    ),
    AudioSource.uri(
      Uri.parse("asset:///assets/audio/711.mp3"),
      tag: MediaItem(
        id: "4",
        title: "711",
        artist: "TONEEJAY",
        artUri: Uri.parse("assets/images/toneejay.jpeg"),
      ),
    ),
    AudioSource.uri(
      Uri.parse("asset:///assets/audio/Panaginip Lang.mp3"),
      tag: MediaItem(
        id: "5",
        title: "Panaginip Lang",
        artist: "Alex Gonzaga",
        artUri: Uri.parse("assets/images/alex_gonzaga.jpeg"),
      ),
    ),
    AudioSource.uri(
      Uri.parse("asset:///assets/audio/Sinta.mp3"),
      tag: MediaItem(
        id: "6",
        title: "Sinta",
        artist: "Rob Deniel",
        artUri: Uri.parse("assets/images/rob_deniel.jpeg"),
      ),
    ),
    AudioSource.uri(
      Uri.parse("asset:///assets/audio/Tingin.mp3"),
      tag: MediaItem(
        id: "7",
        title: "Tingin",
        artist: "Cup of Joe",
        artUri: Uri.parse("assets/images/cup_of_joe.jpeg"),
      ),
    ),
    AudioSource.uri(
      Uri.parse("asset:///assets/audio/Mahika.mp3"),
      tag: MediaItem(
        id: "8",
        title: "Mahika",
        artist: "TJ Monterde",
        artUri: Uri.parse("assets/images/tj_monterde.jpeg"),
      ),
    ),
  ]);