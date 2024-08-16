import 'package:flores_favsongs_assignment5/screens/home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyFavSongs());
}

class MyFavSongs extends StatelessWidget {
  const MyFavSongs({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}















