import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:intl/intl.dart';
import 'package:spectramind/components/app_bar.dart';
import 'package:spectramind/components/custom_container.dart';
import 'package:spectramind/components/from_index_dc.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:animated_text_kit/animated_text_kit.dart';

class DailyChallenge extends HookWidget {
  final String? currentUser;

  const DailyChallenge({super.key, required this.currentUser});

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

  Future<Map<String, dynamic>?> fetchDailyChallengeData(int dayId) async {
    final response = await http.get(Uri.parse('http://127.0.0.1:5000/daily_challenge/$dayId'));
    if (response.statusCode == 200) {
      return json.decode(response.body);
    }
    return null;
  }

  Future<Map<String, dynamic>?> fetchUserData(String? currentUser) async {
    final response = await http.get(Uri.parse('http://127.0.0.1:5000/user?name=$currentUser'));
    if (response.statusCode == 200) {
      return json.decode(response.body);
    }
    return null;
  }

  Future<void> updateUserData(String? currentUser, Map<String, dynamic> updates) async {
    await http.put(
      Uri.parse('http://127.0.0.1:5000/user?name=$currentUser'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(updates),
    );
  }

  Widget _startDailyChallenge(BuildContext context, int dayId, String currentDate) {
    String question = questionFromIndex(dayId + 1);
    List<dynamic> options = optionsFromIndex(dayId + 1);
    final selectedOption = useState(0);
    final displayOptions = useState(false);
    final submitted = useState(false);
    final answer = useState(-1);

    List<ListTile> opts = [];
    for (var i = 1; i <= options.length; i++) {
      opts.add(ListTile(
          tileColor: getOptionColor(i, selectedOption.value, answer.value),
          onTap: () => selectedOption.value = i,
          title: Column(children: [
            Text(
              options[i - 1],
              style: const TextStyle(
                  fontSize: 20,
                  fontFamily: 'Hind',
                  fontWeight: FontWeight.w400),
            ),
            const Divider(),
          ])));
    }
    return Column(
      children: [
        const SizedBox(height: 40),
        const Text("Daily Challenge",
            style: TextStyle(
              fontFamily: 'LuckiestGuy',
              fontSize: 20,
            )),
        const SizedBox(height: 10),
        const CircleAvatar(
            backgroundImage: AssetImage("lib/images/Kitsune.png"), radius: 50),
        const SizedBox(height: 5),
        (dayId != -1)
            ? Container(
                width: MediaQuery.of(context).size.width - 20,
                decoration: BoxDecoration(
                    color: Colors.lightBlue[50],
                    borderRadius: const BorderRadius.all(Radius.circular(10))),
                child: AnimatedTextKit(
                  animatedTexts: [
                    TypewriterAnimatedText(
                      question,
                      cursor: '',
                      speed: const Duration(milliseconds: 50),
                      textAlign: TextAlign.center,
                      textStyle: const TextStyle(
                          fontSize: 20,
                          fontFamily: 'Hind',
                          fontWeight: FontWeight.w400),
                    )
                  ],
                  displayFullTextOnTap: true,
                  repeatForever: false,
                  stopPauseOnTap: true,
                  pause: const Duration(seconds: 2),
                  totalRepeatCount: 1,
                  onFinished: () {
                    displayOptions.value = true;
                  },
                ))
            : const SizedBox(height: 10),
        const SizedBox(height: 10),
        (displayOptions.value)
            ? Column(children: [
                ListBody(children: opts),
                (!submitted.value)
                    ? ElevatedButton(
                        onPressed: () async {
                          submitted.value = true;
                          var challenge = await fetchDailyChallengeData(dayId);
                          answer.value = challenge?['answer'] ?? -1;
                        },
                        child: const Text("Submit"))
                    : ElevatedButton(
                        onPressed: () async {
                          var user = await fetchUserData(currentUser);
                          int userTokens = user?['tokens'] ?? 0;
                          int inc = 5;
                          int mult = user?['multiplier'] ?? 1;
                          if (answer.value == selectedOption.value) inc = 10;
                          await updateUserData(currentUser, {
                            'tokens': userTokens + inc * mult,
                            'completed_dc': dayId,
                            'last_challenge': currentDate
                          });
                          Navigator.of(context).pop();
                        },
                        child: const Text("Finish"))
              ])
            : const SizedBox(height: 10)
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final challengeCompleted = useState(false);
    final formattedCurrentDate = useState("");
    final dayId = useState(-1);

    useEffect(() {
      DateTime currentDate = DateTime.now();
      formattedCurrentDate.value = DateFormat.yMMMd().format(currentDate);
      fetchUserData(currentUser).then((user) async {
        String? lastDailyChallenge = user?['last_challenge'];
        if (lastDailyChallenge == null || lastDailyChallenge != formattedCurrentDate.value) {
          challengeCompleted.value = false;
          dayId.value = (user?['completed_dc'] ?? -1) + 1;
          await updateUserData(currentUser, {
            'last_challenge': formattedCurrentDate.value
          });
        } else {
          challengeCompleted.value = true;
        }
      });
      return null;
    }, []);

    return customContainer(
      Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: Column(children: [
            Container(
              padding: const EdgeInsets.only(left: 5, right: 5),
              child: customAppBar(Colors.lightBlue[50], Colors.black, currentUser),
            ),
            (!challengeCompleted.value)
                ? _startDailyChallenge(
                    context, dayId.value, formattedCurrentDate.value)
                : Column(children: const [
                    SizedBox(height: 50),
                    Text("Daily Challenge Completed!",
                        style: TextStyle(
                          fontFamily: 'LuckiestGuy',
                          fontSize: 20,
                        )),
                    Text("Come back tomorrow!",
                        style: TextStyle(
                          fontFamily: 'LuckiestGuy',
                          fontSize: 20,
                        ))
                  ])
          ]),
        ),
      ),
    );
  }
}
