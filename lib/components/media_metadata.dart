import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class MediaMetadata extends StatelessWidget {
  const MediaMetadata(
      {super.key,
      required this.title,
      required this.artist,
      required this.image});

  final String title;
  final String artist;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DecoratedBox(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: const Offset(0, 3),
              )
            ],
            borderRadius: BorderRadius.circular(10),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              image,
              width: 250,
              height: 250,
              fit: BoxFit.cover,
            ),
          ),
        ),
        const Gap(20),
        Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
        const Gap(10),
        Text(
          artist,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 18,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
