import 'package:flutter/material.dart';

class TitleDefault extends StatelessWidget {
  final String title;

  const TitleDefault(this.title, {super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(
        fontWeight: FontWeight.bold,
        fontFamily: 'Oswald',
        fontSize: 26.0,
      ),
    );
  }
}
