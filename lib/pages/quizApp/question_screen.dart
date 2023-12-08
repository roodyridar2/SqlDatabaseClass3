import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sqlcheatcode/model/quiz_model.dart';
import 'package:sqlcheatcode/notifier/theme_notifier.dart';
import 'package:sqlcheatcode/pages/quizApp/widget/Answer_button.dart';

class QuestionsScreen extends ConsumerStatefulWidget {
  const QuestionsScreen({
    super.key,
    required this.questions,
    required this.onSelectAnswer,
  });
  final List<QuizQuestionModel> questions;

  final void Function(String answer) onSelectAnswer;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _QuestionsScreenState();
}

class _QuestionsScreenState extends ConsumerState<QuestionsScreen> {
  int currentQuestionIndex = 0;

  void answerQuestion(String selectedAnswer) {
    widget.onSelectAnswer(selectedAnswer);
    setState(() {
      if (currentQuestionIndex == widget.questions.length - 1) {
        currentQuestionIndex = 0;
        return;
      }
      currentQuestionIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    bool isDark = ref.watch(themeChangerNotifierProvider.notifier).getValue();

    final currentQuestion = widget.questions[currentQuestionIndex];
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Number of question ${widget.questions.length}",
          style: TextStyle(color: isDark ? Colors.white : Colors.blue),
        ),
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Text(
            //   "${currentQuestionIndex + 1}/${widget.questions.length}",
            //   textAlign: TextAlign.center,
            // ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Stack(
                children: [
                  Card(
                    color: isDark ? CardTheme().color : Colors.blue,
                    child: SizedBox(
                      height: 80,
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            currentQuestion.question,
                            style: const TextStyle(color: Colors.white),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 0,
                    left: 0,
                    child: Container(
                      width: 20,
                      height: 20,
                      decoration: BoxDecoration(
                        color: isDark ? Colors.green : Colors.blue,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                      ),
                      child: Center(
                        child: Text(
                          (currentQuestionIndex + 1).toString(),
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 10),
            ...currentQuestion.getShuffledAnswer().map(
              (answer) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: AnswerButton(
                    answerText: answer,
                    onTap: () {
                      answerQuestion(answer);
                    },
                  ),
                );
              },
            ),
            // ...[SizedBox(), SizedBox()],
            // AnswerButton(answerText: currentQuestion.answers[0], onTap: () {}),
            // const Gap(10),
            // AnswerButton(answerText: currentQuestion.answers[1], onTap: () {}),
            // const Gap(10),
            // AnswerButton(answerText: currentQuestion.answers[2], onTap: () {}),
            // const Gap(10),
            // AnswerButton(answerText: currentQuestion.answers[3], onTap: () {}),
          ],
        ),
      ),
    );
  }
}

class MyDialog extends StatelessWidget {
  const MyDialog({Key? key, required this.title, required this.content})
      : super(key: key);
  final String title;
  final String content;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: Text(content),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.of(context).pop(); // Close the dialog
          },
          child: Text('Close'),
        ),
      ],
    );
  }
}
