import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:sqlcheatcode/model/quiz_model.dart';
import 'package:expansion_tile_group/expansion_tile_group.dart';

class AddQuizScreen extends StatefulWidget {
  const AddQuizScreen({
    super.key,
    required this.quizQuestionModel,
    required this.title,
  });
  final List<QuizQuestionModel> quizQuestionModel;
  final String title;

  @override
  State<AddQuizScreen> createState() => _AddQuizScreenState();
}

class _AddQuizScreenState extends State<AddQuizScreen> {
  @override
  Widget build(BuildContext context) {
    List<QuizQuestionModel> allQuestion = widget.quizQuestionModel;
    // final _myQuestionBox = Hive.box('userQuestion');
    // final getList = _myQuestionBox.get(0) ?? [];
    // _myQuestionBox.put(
    //   0,
    //   getList + QuizQuestionModel("1", ["1", "2", "3", "4"]),
    // );
    // print(_myQuestionBox.get(0));
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              borderRadius: BorderRadius.circular(20),
              onTap: () {},
              child: const Icon(
                Icons.add,
                color: Colors.green,
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: ExpansionTileGroup(
          toggleType: ToggleType.expandOnlyCurrent,
          spaceBetweenItem: 8,
          children: [
            for (int i = 0; i < allQuestion.length; i++)
              ExpansionTileBorderItem(
                textColor: Colors.white,
                border: Border.all(color: Colors.white38),
                leading: Text(
                  "${i + 1}.",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                title: Text(
                  allQuestion[i].question.toString(),
                ),
                expendedBorderColor: Colors.blue,
                children: [
                  for (int j = 0; j < allQuestion[i].answers.length; j++)
                    ListTileWidget(
                      answer: allQuestion[i].answers[j],
                      isCorrect: j == 0 ? true : false,
                    ),
                ],
              ),

            //  ---------------------------------ExpansionTileGroup---------------------------------
          ],
        ),
      ),
    );
  }
}

class ListTileWidget extends StatelessWidget {
  const ListTileWidget(
      {super.key, required this.answer, required this.isCorrect});
  final String answer;
  final bool isCorrect;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      trailing: isCorrect
          ? const Icon(
              Icons.check_circle_outline_rounded,
              color: Colors.green,
            )
          : const Icon(
              Icons.cancel_outlined,
              color: Colors.red,
            ),
      title: Text(
        answer,
        style: TextStyle(
          fontSize: 16,
          color: isCorrect ? Colors.green : Colors.red,
        ),
        textAlign: TextAlign.left,
      ),
      dense: true,
      leading: const Icon(Icons.circle, size: 10),
    );
  }
}
