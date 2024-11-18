import 'package:flutter/material.dart';
import 'questions.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class question_bank {
  int item = 0;
  List<Question> qobj = [
    Question('Some cats are actually allergic to humans', true),
    Question('You can lead a cow down stairs but not up stairs.', false),
    Question('Approximately one quarter of human bones are in the feet.', true),
    Question('A slug\'s blood is green.', true),
    Question('Buzz Aldrin\'s mother\'s maiden name was \"Moon\".', true),
    Question('It is illegal to pee in the Ocean in Portugal.', true),
    Question(
        'No piece of square dry paper can be folded in half more than 7 times.',
        false),
    Question(
        'In London, UK, if you happen to die in the House of Parliament, you are technically entitled to a state funeral, because the building is considered too sacred a place.',
        true),
    Question(
        'The loudest sound produced by any animal is 188 decibels. That animal is the African Elephant.',
        false),
    Question(
        'The total surface area of two human lungs is approximately 70 square metres.',
        true),
    Question('Google was originally called \"Backrub\".', true),
    Question(
        'Chocolate affects a dog\'s heart and nervous system; a few ounces are enough to kill a small dog.',
        true),
    Question(
        'In West Virginia, USA, if you accidentally hit an animal with your car, you are free to take it home to eat.',
        true),
  ];
  List<Icon> scorekeeper = [];

  String getQuestion() {
    return qobj[item].tanong;
  }

  bool getAnswer() {
    return qobj[item].sagot;
  }

  void nextItem() {
    if (item < 12) {
      item++;
    }
  }

  bool isQuizFinished(){
    return item >= qobj.length - 1;
  }

  void checkAnswer(bool A, BuildContext B) {
    if (scorekeeper.length < 13) {
      if (getAnswer() == A) {
        scorekeeper.add(
          const Icon(Icons.check, color: Colors.green),
        );
      }
      else {
        scorekeeper.add(
          const Icon(Icons.close, color: Colors.red),
        );
      }
    }
    nextItem();

    if (scorekeeper.length == qobj.length) {
      Alert(
        context: B,
        title: "Quiz Completed",
        desc: "You've finished the quiz!",
        buttons: [
          DialogButton(
            onPressed: () {
              resetQuiz();
              Navigator.pop(B);
            },
            width: 120,
            child: const Text(
              "RESET",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          )
        ],
      ).show();
    }
  }

  void resetQuiz() {
    item = 0;
    scorekeeper.clear();
  }
}