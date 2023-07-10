import 'package:flutter/material.dart';
import'package:quizeapp/data/questions.dart';

class SummuryData extends StatelessWidget {
   SummuryData(this.summuryData, {super.key});
  final List<Map<String, Object>> summuryData;
     Color changeColor = Colors.blue;
  @override
  Widget build(context) {
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
          children: summuryData.map((data) {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    backgroundColor:data['user_answer'] == data['correct_answer'] ? changeColor:const Color.fromARGB(255, 255, 157, 190),
                    radius: 15,
                    child:
                        Text(((data['questions_index'] as int) + 1).toString(),style:const TextStyle(color:Colors.black) ,),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          data['question'] as String,
                          style: const TextStyle(
                              color: Colors.white, fontSize: 16),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          data['user_answer'] as String,
                          style: const TextStyle(
                              color: Color.fromARGB(255, 216, 128, 233),
                              fontSize: 16),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(((data['correct_answer'] as String)),
                            style: const TextStyle(
                                color: Color.fromARGB(255, 77, 172, 223),
                                fontSize: 16)),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
