import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() {
  runApp(XylophoneApp());
}

class XylophoneApp extends StatelessWidget {
  final AudioCache player = AudioCache();

  void playSound(int soundNumber) {
    player.play('note$soundNumber.wav');
  }

  Expanded buildKey({int soundNumber = 1, Color color = Colors.red}) {
    return Expanded(
      child: TextButton(
        onPressed: () {
          playSound(soundNumber);
        },
        style: TextButton.styleFrom(backgroundColor: color),
        child: Text(
          'Sound $soundNumber',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Xylophone App'),
        ),
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              buildKey(soundNumber: 1, color: Colors.red),
              buildKey(soundNumber: 2, color: Colors.green),
              buildKey(soundNumber: 3, color: Colors.black),
              buildKey(soundNumber: 4, color: Colors.blue),
              buildKey(soundNumber: 5, color: Colors.pink),
              buildKey(soundNumber: 6, color: Colors.yellow),
              buildKey(soundNumber: 7, color: Colors.brown),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextFormField(
                  decoration: InputDecoration(),
                  onFieldSubmitted: (value) {
                    int soundNumber = int.tryParse(value) ?? 1;
                    if (soundNumber >= 1 && soundNumber <= 7) {
                      playSound(soundNumber);
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
