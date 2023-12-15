import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary(this.summaryData, {super.key});

  final List<Map<String, Object>> summaryData;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map((e) {
            return Padding(
              padding: const EdgeInsets.all(2),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 30,
                    width: 30,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: e['user_answer'] == e['correct_answer']
                          ? const Color.fromARGB(255, 150, 198, 241)
                          : const Color.fromARGB(255, 249, 133, 241),
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: Text(
                      ((e['question_index'] as int) + 1).toString(),
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 22, 2, 56),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  // takes the max width of the parent Row
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          (e['question']).toString(),
                          style: GoogleFonts.lato(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          height: 2,
                        ),
                        Text(
                          (e['user_answer']).toString(),
                          style: const TextStyle(
                            color: Color.fromARGB(255, 202, 171, 252),
                          ),
                        ),
                        Text(
                          (e['correct_answer']).toString(),
                          style: const TextStyle(
                            color: Color.fromARGB(255, 181, 254, 246),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
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
