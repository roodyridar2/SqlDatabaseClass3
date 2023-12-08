import 'package:sqlcheatcode/model/quiz_model.dart';

List<QuizQuestionModel> questionsLec2 = [
  const QuizQuestionModel(
    'What are the main building blocks of Flutter UIs  2?',
    [
      'Widgets',
      'Components',
      'Blocks',
      'Functions',
    ],
  ),
  const QuizQuestionModel('How are Flutter UIs built 2?', [
    'By combining widgets in code',
    'By combining widgets in a visual editor',
    'By defining widgets in config files',
    'By using XCode for iOS and Android Studio for Android',
  ]),
  const QuizQuestionModel(
    'What\'s the purpose of a StatefulWidget 2?',
    [
      'Update UI as data changes',
      'Update data as UI changes',
      'Ignore data changes',
      'Render UI that does not depend on data',
    ],
  ),
  const QuizQuestionModel(
    'Which widget should you try to use more often: StatelessWidget or StatefulWidget 2?',
    [
      'StatelessWidget',
      'StatefulWidget',
      'Both are equally good',
      'None of the above',
    ],
  ),
  const QuizQuestionModel(
    'What happens if you change data in a StatelessWidget 2?',
    [
      'The UI is not updated',
      'The UI is updated',
      'The closest StatefulWidget is updated',
      'Any nested StatefulWidgets are updated',
    ],
  ),
];
