import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sqlcheatcode/model/quiz_model.dart';
import 'package:sqlcheatcode/notifier/theme_notifier.dart';
import 'package:sqlcheatcode/pages/quizApp/widget/custom_progress_bar.dart';

class ResultScreen extends ConsumerWidget {
  const ResultScreen({
    super.key,
    required this.selectedAnswer,
    required this.allQuestion,
  });
  final List<String> selectedAnswer;
  final List<QuizQuestionModel> allQuestion;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    int correctAnswerCount = 0;
    int totalAnswer = selectedAnswer.length;
    bool isDark = ref.watch(themeChangerNotifierProvider.notifier).getValue();

    for (int index = 0; index < allQuestion.length; index++) {
      if (selectedAnswer[index].trim().toLowerCase() ==
          allQuestion[index].answers[0].trim().toLowerCase()) {
        correctAnswerCount++;
      }
    }

    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Text(
            "Number of Correct Answer $correctAnswerCount out of $totalAnswer",
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: CustomProgressBar(
              width: 400,
              height: 20,
              progress: (correctAnswerCount / totalAnswer),
              color: isDark ? Colors.green : Colors.blue,
            ),
          ),
          const SizedBox(height: 10),
          SizedBox(
            height: 500,
            child: ListView.builder(
              itemCount: allQuestion.length,
              itemBuilder: (BuildContext context, int index) {
                bool isCorrect =
                    allQuestion[index].answers[0].toLowerCase().trim() ==
                        selectedAnswer[index].toLowerCase().trim();
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: Stack(
                    children: [
                      Card(
                        // color: allQuestion[index].answers[0].toLowerCase().trim() ==
                        //         selectedAnswer[0].toLowerCase().trim()
                        //     ? Colors.green
                        //     : const Color.fromARGB(255, 232, 79, 68),
                        child: ListTile(
                          title: Text(
                            allQuestion[index].question,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16.0,
                            ),
                          ),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 8.0),
                              const Text(
                                'Your Answer:',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey,
                                ),
                              ),
                              Text(
                                selectedAnswer[index],
                                style: TextStyle(
                                  fontSize: 14.0,
                                  color: isCorrect
                                      ? Colors.green
                                      : const Color.fromARGB(255, 232, 79, 68),
                                ),
                              ),
                              const SizedBox(height: 8.0),
                              const Text(
                                'Correct Answer:',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey,
                                ),
                              ),
                              Text(
                                allQuestion[index].answers[0],
                                style: const TextStyle(
                                  fontSize: 14.0,
                                  color: Colors.green,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        top: 15,
                        right: 15,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: isCorrect ? Colors.green : Colors.redAccent,
                          ),
                          width: 15,
                          height: 15,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 10),
          OutlinedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text(
              "Go Back",
              style: TextStyle(
                fontSize: 18,
                color: isDark ? Colors.white : Colors.blue,
              ),
            ),
          )
        ],
      ),
    );
  }
}
