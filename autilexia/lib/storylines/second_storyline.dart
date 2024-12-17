import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:spectramind/components/base_storyline.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:spectramind/components/from_index.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:spectramind/mongodb_auth.dart'; // Import MongoDB authentication

class SecondStoryLine extends HookWidget {
  final String? username;
  const SecondStoryLine({super.key, required this.username});

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
    return baseWidget(context, "Second Story Line", _body(context), username);
  }

  Widget _body(BuildContext context) {
    late FlutterTts tts = FlutterTts();
    final displayOptions = useState(false);
    final startStory = useState(false);
    final displayText = useState("Start");
    final selectedOption = useState(-1);
    final questionIndex = useState(1);
    final correctOption = useState(-1);
    final submitted = useState(false);
    final displayReply = useState(false);
    final displayQuestion = useState(false);
    tts.setSpeechRate(0.6);

    final parsableText = questionFromIndex(2, questionIndex.value);
    final text = parsableText
        .map((paragraph) => TypewriterAnimatedText(
              paragraph,
              cursor: '',
              speed: const Duration(milliseconds: 75),
              textStyle: const TextStyle(
                  fontSize: 20,
                  fontFamily: 'Hind',
                  fontWeight: FontWeight.w400),
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
                  fontFamily: 'Hind',
                  fontWeight: FontWeight.w400),
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
                pause: const Duration(seconds: 5),
                totalRepeatCount: 1,
                onFinished: () {
                  displayOptions.value = true;
                  displayText.value = "Restart";
                },
                onNextBeforePause: (idx, b) async {
                  await tts.speak(parsableText[idx]);
                },
                onNext: (idx, b) async {
                  await tts.awaitSpeakCompletion(true);
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
                              replyFromIndex(2, selectedOption.value, correctOption.value, questionIndex.value), // Positional argument
                              cursor: '', // Optional named argument
                              speed: const Duration(milliseconds: 75), // Optional named argument
                              textStyle: const TextStyle(
                                fontSize: 20,
                                fontFamily: 'Hind',
                                fontWeight: FontWeight.w400,
                              ), // Optional named argument
                            ),
                          ],
                          pause: const Duration(seconds: 5),
                          repeatForever: false,
                          totalRepeatCount: 1,
                          onFinished: () {
                            submitted.value = true;
                          },
                          onNextBeforePause: (idx, b) async {
                            await tts.speak(replyFromIndex(
                                2,
                                selectedOption.value,
                                correctOption.value,
                                questionIndex.value));
                          },
                          onNext: (idx, b) async {
                            await tts.awaitSpeakCompletion(true);
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
                          if (selectedOption.value != -1) {
                            MongoDBAuth()
                                .getQuestionData(questionIndex.value)
                                .then((value) {
                              correctOption.value = value?['answer'] ?? -1; 
                              int inc = correctOption.value == selectedOption.value ? 5 : 1;

                              if (username != null) {
                                MongoDBAuth()
                                    .getUserData(username!)
                                    .then((userData) {
                                  int multiplier = userData?['multiplier'] ?? 1;
                                  int tokens = userData?['tokens'] ?? 0;

                                  MongoDBAuth()
                                      .updateUserTokens(
                                          username!, tokens + inc * multiplier)
                                      .then((_) {
                                    displayReply.value = true;
                                    displayQuestion.value = false;
                                    submitted.value = true;
                                  });
                                });
                              }
                            });
                          }
                        },
                        child: const Text("Submit",
                            style:
                                TextStyle(backgroundColor: Colors.transparent)))
                    : ElevatedButton(
                        onPressed: () {
                          questionIndex.value++;
                          if (questionIndex.value <= 4) {
                            displayOptions.value = false;
                            selectedOption.value = -1;
                            correctOption.value = -1;
                            displayReply.value = false;
                            displayQuestion.value = true;
                            submitted.value = false;
                          } else if (questionIndex.value == 5) {
                            displayReply.value = false;
                            displayQuestion.value = true;
                          } else {
                            if (username != null) {
                              MongoDBAuth()
                                  .getUserData(username!)
                                  .then((matches) {
                                int completed = matches?['completed'] ?? 0;
                                MongoDBAuth()
                                    .updateUserModules(username!, [(completed + 1).toString()])
                                    .then((_) {
                                  if (completed + 1 == 2) {
                                    showDialog(
                                        context: context,
                                        builder: (context) {
                                          return AlertDialog(
                                            title:
                                                const Text("Congratulations!"),
                                            content: const SingleChildScrollView(
                                                child: Text(
                                                    "You have unlocked your token multiplier for the day!")),
                                            actions: <Widget>[
                                              ElevatedButton(
                                                  child: const Text("Ok"),
                                                  onPressed: () {
                                                    MongoDBAuth()
                                                        .updateUserMultiplier(
                                                            username!, 2)
                                                        .then((_) {
                                                      Navigator.of(context)
                                                          .pop();
                                                      Navigator.of(context)
                                                          .pop();
                                                    });
                                                  })
                                            ],
                                          );
                                        });
                                  } else {
                                    Navigator.of(context).pop();
                                  }
                                });
                              });
                            }
                          }
                        },
                        child: Text(
                            (questionIndex.value + 1 <= 5) ? "Next" : "Finish",
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
                      "\nThis is the story about Claudio, a turtle in the pet world of Spectramind, "
                      "an engaging learning journey that makes users more aware of dyslexia. "
                      "By helping Claudio learn, users gain knowledge while earning tokens in the Spectramind pet world.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontFamily: 'Hind',
                          fontSize: 20,
                          fontWeight: FontWeight.w400))),
              const SizedBox(height: 10),
              ElevatedButton(
                  onPressed: () {
                    startStory.value = true;
                    displayText.value = "Restart";
                    displayOptions.value = false;
                    selectedOption.value = -1;
                    correctOption.value = -1;
                    displayReply.value = false;
                    displayQuestion.value = true;
                    submitted.value = false;
                  },
                  child: Text(displayText.value))
            ])
          : const SizedBox(height: 0, width: 0),
    ]);
  }
}
