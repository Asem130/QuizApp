import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
 const AnswerButton({required this.answerText, required this.onTap, super.key});
  final void Function() onTap;
  final String answerText;
  @override
  Widget build(context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
         
          foregroundColor: Colors.white,
          backgroundColor: const Color.fromARGB(255, 34, 2, 91),
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(40))),
      onPressed:onTap,
      child: Text(answerText,textAlign: TextAlign.center,),
    );
  }
}
