import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:neucare/components/base_storyline.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:neucare/components/from_index.dart';

class SecondStoryLine extends HookWidget {
  final User? user;
  const SecondStoryLine({super.key, required this.user});

  Color? getOptionColor(int index, int selectedOption, int correctOption) {
    if (selectedOption == index) {
      if (correctOption == index) return Colors.greenAccent;
      if (correctOption == -1) return Colors.orangeAccent;
      return Colors.redAccent;
    } else {
      if (correctOption == index) return Colors.greenAccent;
      return Colors.lightBlue[50];
    }
  }

  @override
  Widget build(BuildContext context) {
    return baseWidget(context, "Second Story Line", "", _body(context), user);
  }

  Widget _body(BuildContext context) {
    final displayOptions = useState(false);
    final startStory = useState(false);
    final displayText = useState("Start");
    final selectedOption = useState(-1);
    final questionIndex = useState(1);
    final correctOption = useState(-1);
    final submitted = useState(false);
    final displayReply = useState(false);
    final displayQuestion = useState(false);

    final text = questionFromIndex(2, questionIndex.value)
        .map((paragraph) => TypewriterAnimatedText(
              paragraph,
              cursor: '',
              speed: const Duration(milliseconds: 50),
              textAlign: TextAlign.center,
              textStyle: const TextStyle(
                  fontSize: 23,
                  fontFamily: 'AmaticSC',
                  fontWeight: FontWeight.w900),
            ))
        .toList();
    List<ListTile> options = [];
    List<String> parsableOptions = optionsFromIndex(2, questionIndex.value);
    for (var i = 1; i <= parsableOptions.length; i++) {
      options.add(ListTile(
          tileColor:
              getOptionColor(i, selectedOption.value, correctOption.value),
          onTap: () => selectedOption.value = i,
          title: Column(children: [
            Text(
              parsableOptions[i - 1],
              style: const TextStyle(
                  fontSize: 20,
                  fontFamily: 'AmaticSC',
                  fontWeight: FontWeight.w900),
            ),
            const Divider(),
          ])));
    }
    return Column(children: [
      const Text("Claudio: The Dyslexic Turtle",
          style: TextStyle(
            fontFamily: 'LuckiestGuy',
            fontSize: 20,
          )),
      const SizedBox(height: 10),
      const CircleAvatar(
          backgroundImage: AssetImage("lib/images/Unicorndalle.png"),
          radius: 50),
      const SizedBox(height: 5),
      (displayQuestion.value)
          ? Container(
              width: MediaQuery.of(context).size.width - 20,
              decoration: BoxDecoration(
                  color: Colors.lightBlue[50],
                  borderRadius: const BorderRadius.all(Radius.circular(10))),
              child: AnimatedTextKit(
                animatedTexts: text,
                displayFullTextOnTap: true,
                repeatForever: false,
                stopPauseOnTap: true,
                pause: const Duration(seconds: 2),
                totalRepeatCount: 1,
                onFinished: () {
                  displayOptions.value = true;
                  displayText.value = "Restart";
                },
              ),
            )
          : const SizedBox(height: 0, width: 0),
      const SizedBox(height: 10),
      (displayOptions.value)
          ? Column(children: [
              (displayReply.value)
                  ? Container(
                      width: MediaQuery.of(context).size.width - 20,
                      decoration: BoxDecoration(
                          color: Colors.lightBlue[50],
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10))),
                      child: AnimatedTextKit(
                          animatedTexts: [
                            TypewriterAnimatedText(
                                cursor: '',
                                speed: const Duration(milliseconds: 50),
                                textAlign: TextAlign.center,
                                textStyle: const TextStyle(
                                    fontSize: 23,
                                    fontFamily: 'AmaticSC',
                                    fontWeight: FontWeight.w900),
                                replyFromIndex(2, selectedOption.value,
                                    correctOption.value, questionIndex.value))
                          ],
                          repeatForever: false,
                          totalRepeatCount: 1,
                          onFinished: () {
                            submitted.value = true;
                          }),
                    )
                  : const SizedBox(height: 0, width: 0),
              const SizedBox(height: 10),
              Column(children: [
                ListBody(children: options),
              ]),
              const SizedBox(height: 10),
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                (!submitted.value)
                    ? ElevatedButton(
                        onPressed: () {
                          startStory.value = false;
                          displayText.value = "Start";
                          displayOptions.value = false;
                          selectedOption.value = -1;
                          correctOption.value = -1;
                          displayReply.value = false;
                          displayQuestion.value = false;
                          submitted.value = false;
                        },
                        child: Text(displayText.value,
                            style: const TextStyle(
                                backgroundColor: Colors.transparent)))
                    : const SizedBox(height: 0, width: 0),
                (!submitted.value)
                    ? ElevatedButton(
                        onPressed: () {
                          // TODO: vaildate option
                          if (selectedOption.value != -1) {
                            correctOption.value =
                                4; // TODO: replace line with correct option validation from database.
                            displayReply.value = true;
                            displayQuestion.value = false;
                          }
                        },
                        child: const Text("Submit",
                            style:
                                TextStyle(backgroundColor: Colors.transparent)))
                    : ElevatedButton(
                        onPressed: () {
                          questionIndex.value++;
                          // TODO: replace 2 down here with the total number of questions.
                          if (questionIndex.value <= 2) {
                            displayOptions.value = false;
                            selectedOption.value = -1;
                            correctOption.value = -1;
                            displayReply.value = false;
                            displayQuestion.value = true;
                            submitted.value = false;
                          } else {
                            Navigator.of(context).pop();
                          }
                        },
                        child: Text(
                            (questionIndex.value + 1 <= 2)
                                ? "Next"
                                : "Finish", // TODO: replace 2 here with the total number of questions.
                            style: const TextStyle(
                                backgroundColor: Colors.transparent))),
              ]),
            ])
          : const SizedBox(height: 0, width: 0),
      const SizedBox(height: 20),
      (!startStory.value)
          ? Column(children: [
              Container(
                  width: MediaQuery.of(context).size.width - 20,
                  height: MediaQuery.of(context).size.height / 4,
                  decoration: BoxDecoration(
                      color: Colors.lightBlue[50],
                      borderRadius:
                          const BorderRadius.all(Radius.circular(10))),
                  child: const Text(
                      "\nThis is the story about Claudio, a turtle in the pet world, diagnosed with dyslexia and the hardships as well as the positives it experienced throughout its life.  We learn how people with dyslexia are affected from this story.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontFamily: "Raleway",
                          fontWeight: FontWeight.w400,
                          fontSize: 20))),
              const SizedBox(height: 20),
              ElevatedButton(
                  onPressed: () {
                    startStory.value = true;
                    displayQuestion.value = true;
                  },
                  child: Text(displayText.value)),
            ])
          : const SizedBox(height: 0, width: 0),
    ]);
  }
}
