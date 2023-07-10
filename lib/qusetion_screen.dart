import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quizeapp/answer_button.dart';
import 'package:quizeapp/data/questions.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({super.key, required this.answerdQuestion});

  final void Function(String answer)answerdQuestion;
  @override
  State<QuestionScreen> createState() {
    return _QuestionScreenState();
  }
}

class _QuestionScreenState extends State<QuestionScreen> {
  int currentQuestionIndex = 0;
  void changeQuestionIndex(String answer) {
    widget.answerdQuestion(answer);
    setState(() {
      currentQuestionIndex++;
    });
  }

  @override
  Widget build(context) {
    final currentQuestion = questions[currentQuestionIndex];
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              currentQuestion.text,
              style: GoogleFonts.lato(
                color: const Color.fromARGB(255, 246, 171, 229),
                fontWeight: FontWeight.bold,
                fontSize: 26,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 50,
            ),
            ...currentQuestion.shuffledAnswers().map((answer) {
              return AnswerButton(answerText: answer, onTap: (){

                changeQuestionIndex(answer);
              });
            }),
          ],
        ),
      ),
    );
  }
}
