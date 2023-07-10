import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quizeapp/data/questions.dart';
import 'package:quizeapp/start_screen.dart';
import 'package:quizeapp/summury_data.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key, required this.choosenAnswers});
  final List<String> choosenAnswers;
  List<Map<String, Object>> getSummry() {
    final List<Map<String, Object>> summury = [];

    for (var i = 0; i < choosenAnswers.length; i++) {
      summury.add({
        'questions_index': i,
        'question': questions[i].text,
        'correct_answer': questions[i].answer[0],
        'user_answer': choosenAnswers[i]
      });
    }
    return summury;
  }
  
  @override
  Widget build(BuildContext context) {
    final summaryData = getSummry();
    final totalQuestion = questions.length;
    final correctQuestion = summaryData.where((data) {
      return data['user_answer'] == data['correct_answer'];
    }).length;
    return SizedBox(
        width: double.infinity,
        child: Container(
            margin: const EdgeInsets.all(40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'You answered $correctQuestion out of $totalQuestion questions correctly!',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.lato(
                    color: const Color.fromARGB(255, 234, 197, 226),
                    fontSize: 20,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                SummuryData(summaryData),
                const SizedBox(
                  height: 30,
                ),
                TextButton.icon(
                  icon: const Icon(Icons.refresh),
                  onPressed: () {
                    
                  },
                  label: const Text('Restart Quize!'),
                )
              ],
            )));
  }
}
