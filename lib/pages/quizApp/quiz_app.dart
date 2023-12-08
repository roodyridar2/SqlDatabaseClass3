import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:sqlcheatcode/data/quizData/all_question.dart';
import 'package:sqlcheatcode/model/quiz_model.dart';
import 'package:sqlcheatcode/notifier/theme_notifier.dart';
import 'package:sqlcheatcode/pages/quizApp/add_quiz_screen.dart';
import 'package:sqlcheatcode/pages/quizApp/question_screen.dart';
import 'package:sqlcheatcode/pages/quizApp/result.dart';
import 'package:sqlcheatcode/pages/templateQuries/template.dart';

class QuizApp extends ConsumerStatefulWidget {
  const QuizApp({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _QuizAppState();
}

class _QuizAppState extends ConsumerState<QuizApp> {
  int itemCount = 18;
  late List<bool> isTappedList = List.generate(itemCount, (index) => false);
  bool _selectAll = false;
  List<String> selectedAnswer = [];
  List<QuizQuestionModel> allQuestion = [];

  void chooseAnswer(String answer) {
    selectedAnswer.add(answer);
    int correctAnswerCount = 0;
    if (selectedAnswer.length == allQuestion.length) {
      //Number of correct answer
      for (int index = 0; index < allQuestion.length; index++) {
        if (selectedAnswer[index].trim().toLowerCase() ==
            allQuestion[index].answers[0].trim().toLowerCase()) {
          correctAnswerCount++;
        }
      }

      int totalQuestion = allQuestion.length;
      // Save to database
      final myRecordBox = Hive.box('myRecord');
      if (myRecordBox.get("listRecord") == null) {
        myRecordBox.put("listRecord", [
          {
            "correctAnswer": correctAnswerCount,
            "totalQuestion": totalQuestion,
            "time": DateTime.now(),
          }
        ]);
      } else {
        List listRecord = myRecordBox.get("listRecord");

        listRecord.add({
          "correctAnswer": correctAnswerCount,
          "totalQuestion": totalQuestion,
          "time": DateTime.now(),
        });

        myRecordBox.put("listRecord", listRecord);
      }

      // change page
      setState(() {
        try {
          Navigator.pop(context);
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ResultScreen(
                selectedAnswer: selectedAnswer,
                allQuestion: allQuestion,
              ),
            ),
          );
        } catch (e) {
          if (kDebugMode) {
            print(e);
          }
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    bool isDarkMode =
        ref.watch(themeChangerNotifierProvider.notifier).getValue();
    return Scaffold(
      body: Column(
        children: [
          Text("Selected Lectured to start Quiz",
              style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(
            height: 20,
          ),
          CheckboxListTile(
            title: const Text(
              "select all",
              style: TextStyle(fontSize: 20),
            ),
            secondary: const Icon(Icons.select_all_outlined),
            value: _selectAll,
            activeColor: isDarkMode ? Colors.green : Colors.blue,
            checkColor: Colors.white,
            controlAffinity: ListTileControlAffinity.leading,
            selected: _selectAll,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(29.0),
            ),
            onChanged: (value) {
              setState(() {
                _selectAll = value!;
                isTappedList = List.generate(itemCount, (index) => value);
              });
            },
          ),
          SizedBox(
            height: 430,
            child: GridView.builder(
              itemCount: itemCount,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 3 / 1.3,
              ),
              itemBuilder: (context, index) {
                bool isTapped = false;
                return InkWell(
                  borderRadius: BorderRadius.circular(29),
                  onLongPress: () {
                    if (index > allQuestionsData.length - 1) {
                      _showNoDataDialog(context);
                      return;
                    }
                    setState(() {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AddQuizScreen(
                            quizQuestionModel: allQuestionsData[index],
                            title: "Lecture ${index + 1}",
                          ),
                        ),
                      );
                    });
                  },
                  onTap: () {
                    setState(() {
                      isTappedList[index] = !isTappedList[index];

                      isTapped = !isTapped;
                    });
                  },
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(29.0),
                    ),
                    clipBehavior: Clip.antiAlias,
                    color: isTappedList[index]
                        ? isDarkMode
                            ? Colors.green
                            : Colors.blue
                        : isDarkMode
                            ? const CardTheme().color
                            : Colors.black12,
                    child: Center(
                      child: Text(
                        "Lecture ${index + 1}",
                        style:
                            const TextStyle(color: Colors.white, fontSize: 20),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          SizedBox(
            width: 200,
            child: OutlinedButton(
              style: OutlinedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(29.0),
                ),
                side: const BorderSide(color: Colors.white),
              ),
              onPressed: () {
                if (!isTappedList.contains(true)) {
                  return;
                }
                allQuestion = [];
                selectedAnswer = [];
                try {
                  for (int i = 0; i < isTappedList.length; i++) {
                    if (isTappedList[i]) {
                      // get data form a box
                      // print(i);
                      for (int j = 0; j < allQuestionsData[i].length; j++) {
                        allQuestion.add(allQuestionsData[i][j]);
                      }
                    }
                  }
                } catch (e) {
                  print(e);
                  // return;
                }
                allQuestion.shuffle();

                if (allQuestion.isEmpty) {
                  return;
                }
                // print(allQuestion.length);
                // print(selectedAnswer.length);

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => QuestionsScreen(
                      questions: allQuestion,
                      onSelectAnswer: chooseAnswer,
                    ),
                  ),
                );
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Start Quiz ",
                    style: TextStyle(
                        color: isDarkMode ? Colors.white : Colors.blue,
                        fontSize: 20),
                  ),
                  Icon(
                    Icons.arrow_forward,
                    color: isDarkMode ? Colors.green : Colors.blue,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

void _showNoDataDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        alignment: Alignment.center,
        title: const Text('No Data Available'),
        content: const Text('Coming soon.'),
        actions: <Widget>[
          Center(
            child: TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: const Text(
                'OK',
                style: TextStyle(fontSize: 20),
              ),
            ),
          ),
        ],
      );
    },
  );
}
