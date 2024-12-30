import "package:flutter/material.dart";
import "package:flutter_tts/flutter_tts.dart";
import 'package:spectramind/components/app_bar.dart';
import 'package:spectramind/components/custom_container.dart';

class SpeechPractice extends StatefulWidget {
  final String? currentUser;
  SpeechPractice({super.key, required this.currentUser});

  @override
  State<SpeechPractice> createState() => _SpeechPracticeState();
}

enum TtsState { playing, stopped }

class _SpeechPracticeState extends State<SpeechPractice> {
  late FlutterTts _flutterTts;
  String? _tts;
  TtsState _ttsState = TtsState.stopped;

  @override
  void initState() {
    super.initState();
    initTts();
  }

  @override
  void dispose() {
    super.dispose();
    _flutterTts.stop();
  }

  void initTts() {
  _flutterTts = FlutterTts();

  _flutterTts.setStartHandler(() {
    setState(() {
      _ttsState = TtsState.playing;
    });
  });

  _flutterTts.setCompletionHandler(() {
    setState(() {
      _ttsState = TtsState.stopped;
    });
  });

  _flutterTts.setErrorHandler((message) {
    setState(() {
      _ttsState = TtsState.stopped;
    });
    print("Error: $message");
  });
}

  @override
  Widget build(BuildContext context) {
    return customContainer(Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
            child: Container(
                padding: const EdgeInsets.all(10.0),
                child: Column(children: [
                  Container(
                    padding: const EdgeInsets.only(left: 5, right: 5),
                    child: customAppBar(
                        Colors.lightBlue[50], Colors.black, widget.currentUser),
                  ),
                  const SizedBox(height: 15),
                  const Text("Text-To-Speech",
                      style: TextStyle(
                          fontSize: 30,
                          fontFamily: 'Hind',
                          fontWeight: FontWeight.w900)),
                  const SizedBox(height: 10),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.lightBlue[50],
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10))),
                    child: Column(children: [input(), button()]),
                  )
                ])))));
  }

  Widget input() => Container(
        alignment: Alignment.topCenter,
        padding: const EdgeInsets.all(25.0),
        child: TextField(
          onChanged: (String value) {
            setState(() {
              _tts = value;
            });
          },
        ),
      );

  Widget button() {
    if (_ttsState == TtsState.stopped) {
      return TextButton(onPressed: speak, child: const Text('Play'));
    } else {
      return TextButton(onPressed: stop, child: const Text('Stop'));
    }
  }

  Future speak() async {
    try {
      print("Setting volume...");
      await _flutterTts.setVolume(1);
      print("Setting speech rate...");
      await _flutterTts.setSpeechRate(0.5);
      print("Setting pitch...");
      await _flutterTts.setPitch(1);
      print("Speaking...");
      if (_tts != null && _tts!.isNotEmpty) {
        await _flutterTts.speak(_tts!);
      }
    } catch (e) {
      print("Error during TTS: $e");
    }
  }



  Future stop() async {
    var result = await _flutterTts.stop();
    if (result == 1) {
      setState(() {
        _ttsState = TtsState.stopped;
      });
    }
  }
}
