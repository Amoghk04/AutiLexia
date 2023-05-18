import 'package:spectramind/storylines/txt/dailychallenge_txt.dart';

List<String> questionFromIndex(int dc, int index) {
  List<String> question;
  if (dc == 1) {
    switch (index) {
      case 1:
        question = dailychallenge1question1;
        break;
      case 2:
        question = dailychallenge1question2;
        break;
      default:
        question = dailychallenge1question1;
    }
  } else {
    switch (index) {
      default:
        question = dailychallenge1question2;
    }
  }
  return question;
}

List<String> optionsFromIndex(int dc, int index) {
  List<String> options;
  if (dc == 1) {
    switch (index) {
      case 1:
        options = dailychallenge1options1;
        break;
      case 2:
        options = dailychallenge1options2;
        break;
      default:
        options = dailychallenge1options1;
    }
  } else {
    switch (index) {
      case 1:
        options = dailychallenge1options1;
        break;
      case 2:
        options = dailychallenge1options2;
        break;
      default:
        options = dailychallenge1options2;
    }
  }
  return options;
}

String replyFromIndex(
    int dc, int selectedOption, int correctOption, int index) {
  String reply = "";
  if (dc == 1) {
    if (selectedOption == correctOption) {
      switch (index) {
        case 1:
          reply = dailychallenge1question1Correct;
          break;
        case 2:
          reply = dailychallenge1question2Correct;
          break;
        default:
          reply = dailychallenge1question1Correct;
      }
    } else {
      switch (index) {
        case 1:
          reply = dailychallenge1question1Wrong;
          break;
        case 2:
          reply = dailychallenge1question2Wrong;
          break;
        default:
          reply = dailychallenge1question1Wrong;
      }
    }
  }
  return reply;
}
