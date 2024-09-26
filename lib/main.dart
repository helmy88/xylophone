import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatelessWidget {
  final player = AudioPlayer(); // Initialize AudioPlayer

  // Function to play a specific note
  void playSound(int noteNumber) async {
    print('Attempting to play note$noteNumber.mp3'); // Debugging print

    try {
      await player.setSource(AssetSource('note$noteNumber.mp3')); // Set the source to the asset
      await player.resume(); // Resume playing after setting the source
      print('Successfully played note$noteNumber.mp3');
    } catch (e) {
      print('Error playing note$noteNumber.mp3: $e'); // Error handling
    }
  }

  // Function to build a container for each note
  Expanded buildKey({required Color color, required int noteNumber}) {
    return Expanded(
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: color,
        ),
        onPressed: () {
          playSound(noteNumber);
        },
        child: Container(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              buildKey(color: Colors.red, noteNumber: 1),
              buildKey(color: Colors.orange, noteNumber: 2),
              buildKey(color: Colors.yellow, noteNumber: 3),
              buildKey(color: Colors.green, noteNumber: 4),
              buildKey(color: Colors.teal, noteNumber: 5),
              buildKey(color: Colors.blue, noteNumber: 6),
            ],
          ),
        ),
      ),
    );
  }
}
