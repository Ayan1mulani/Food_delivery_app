import 'package:flutter/material.dart';

class navbar extends StatelessWidget {
  const navbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            child: Image.network(
              'https://emojis.wiki/thumbs/emojis/man-cook.webp',
              fit: BoxFit.cover,
            ),
          ),
          Text("HII WELCOME TO THE FOOD COURT APP")
        ],
      ),
    );
  }
}
