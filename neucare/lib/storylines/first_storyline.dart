import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:neucare/components/base_storyline.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:neucare/storylines/txt/story1_txt.dart';

class FirstStoryLine extends HookWidget {
  final User? user;
  const FirstStoryLine({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return baseWidget(context, "First Story Line", "", _body(context), user);
  }

  Widget _body(BuildContext context) {
    // TODO: Add the story contents and the option buttons with their handlers.
    final displayOptions = useState(false);
    final startStory = useState(false);
    final displayText = useState("Start");
    List<TypewriterAnimatedText> text = story
        .map((paragraph) => TypewriterAnimatedText(
              paragraph,
              speed: const Duration(milliseconds: 50),
              textAlign: TextAlign.center,
              textStyle: const TextStyle(fontSize: 20),
            ))
        .toList();
    return Column(children: [
      const CircleAvatar(radius: 20),
      const SizedBox(height: 10),
      const Text("Name of the pet", style: TextStyle(fontSize: 15)),
      const SizedBox(height: 20),
      (startStory.value)
          ? Container(
              width: MediaQuery.of(context).size.width - 20,
              height: MediaQuery.of(context).size.height / 10,
              decoration: BoxDecoration(
                  color: Colors.lightBlue[50],
                  borderRadius: const BorderRadius.all(Radius.circular(10))),
              child: AnimatedTextKit(
                animatedTexts: text,
                repeatForever: false,
                pause: const Duration(seconds: 3),
                totalRepeatCount: 1,
                onFinished: () {
                  displayOptions.value = true;
                  displayText.value = "Restart";
                },
              ))
          : const SizedBox(height: 0, width: 0),
      const SizedBox(height: 10),
      (displayOptions.value)
          ? Column(children: [
              Container(
                  width: MediaQuery.of(context).size.width - 20,
                  height: MediaQuery.of(context).size.height / 6,
                  decoration: BoxDecoration(
                      color: Colors.lightBlue[50],
                      borderRadius:
                          const BorderRadius.all(Radius.circular(10))),
                  child: const Text("Options",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 17))),
              const SizedBox(height: 10),
              ElevatedButton(
                  onPressed: () {
                    startStory.value = false;
                    displayText.value = "Start";
                    displayOptions.value = false;
                  },
                  child: Text(displayText.value)),
            ])
          : const SizedBox(height: 0, width: 0),
      const SizedBox(height: 40),
      (!startStory.value)
          ? Column(children: [
              const Text("Title of the story.",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25)),
              const SizedBox(height: 20),
              Container(
                  width: MediaQuery.of(context).size.width - 20,
                  height: MediaQuery.of(context).size.height / 4,
                  decoration: BoxDecoration(
                      color: Colors.lightBlue[50],
                      borderRadius:
                          const BorderRadius.all(Radius.circular(10))),
                  child: const Text("Description of the story.",
                      textAlign: TextAlign.center)),
              ElevatedButton(
                  onPressed: () {
                    startStory.value = true;
                  },
                  child: Text(displayText.value)),
            ])
          : const SizedBox(height: 0, width: 0),
    ]);
  }
}
