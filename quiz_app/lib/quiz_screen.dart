import 'package:flutter/material.dart';
import 'package:quiz_app/model/question_model.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizAppState();
}

class _QuizAppState extends State<QuizScreen> {
  List<Question> questionList = getQuestions();
  int currentQuestionIndex = 0;
  int score = 0;
  Answer? selectedAnswer;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 61, 30, 113),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 18, vertical: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const Text("Quiz App",
                style: TextStyle(color: Colors.white, fontSize: 30)),
            _questionWidget(),
            const SizedBox(
              height: 20,
            ),
            _answerList(),
            const SizedBox(
              height: 20,
            ),
            _nextButton()
          ],
        ),
      ),
    );
  }

  _questionWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Question ${currentQuestionIndex + 1}/${questionList.length.toString()}",
          style: const TextStyle(
              color: Color.fromARGB(255, 255, 255, 255),
              fontSize: 20,
              fontWeight: FontWeight.w600),
        ),
        const SizedBox(
          height: 20,
        ),
        Container(
          decoration: BoxDecoration(
              color: const Color.fromARGB(255, 255, 255, 255),
              borderRadius: BorderRadius.circular(15)),
          width: double.infinity,
          padding: const EdgeInsets.all(25),
          child: Text(
            questionList[currentQuestionIndex].questionText,
            style: const TextStyle(
                color: Color.fromARGB(255, 0, 0, 0),
                fontSize: 18,
                fontWeight: FontWeight.w600),
          ),
        )
      ],
    );
  }

  _answerList() {
    return Column(
      children: questionList[currentQuestionIndex]
          .answerList
          .map(
            (e) => _answerButton(e),
          )
          .toList(),
    );
  }

  Widget _answerButton(Answer answer) {
    bool isSelected = answer == selectedAnswer;

    return Container(
      margin: EdgeInsets.symmetric(vertical: 8),
      width: double.infinity,
      height: 45,
      child: ElevatedButton(
          onPressed: () {
            if (selectedAnswer == null) {
              if (answer.isCorrect) {
                score++;
              }
              setState(() {
                selectedAnswer = answer;
              });
            }
          },
          child: Text(answer.answerText),
          style: ElevatedButton.styleFrom(
              shape: const StadiumBorder(),
              primary: isSelected ? Colors.green : Colors.white,
              onPrimary: isSelected ? Colors.white : Colors.black)),
    );
  }

  _nextButton() {
    bool isLastQuestion = false;
    if (currentQuestionIndex == questionList.length - 1) {
      isLastQuestion = true;
    }

    return Container(
      width: MediaQuery.of(context).size.width * 0.5,
      height: 45,
      child: ElevatedButton(
          onPressed: () {
            if (isLastQuestion) {
              showDialog(context: context, builder: (_) => _showScoreDialog());
            } else {
              setState(() {
                selectedAnswer = null;
                currentQuestionIndex++;
              });
            }
          },
          child: Text(isLastQuestion ? "Submit" : "Next"),
          style: ElevatedButton.styleFrom(
              shape: const StadiumBorder(),
              primary: Colors.blueAccent,
              onPrimary: Colors.white)),
    );
  }

  _showScoreDialog() {
    return AlertDialog(
      title: Text("Your Score is: " + score.toString()),
      content: ElevatedButton(
        child: Text(
          "Restart",
          style: TextStyle(color: Colors.black),
        ),
        onPressed: () {
          Navigator.pop(context);
          currentQuestionIndex = 0;
          score = 0;
          selectedAnswer = null;
        },
      ),
    );
  }
}
