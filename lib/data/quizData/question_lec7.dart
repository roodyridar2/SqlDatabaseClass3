import 'package:sqlcheatcode/model/quiz_model.dart';

List<QuizQuestionModel> questionsLec7 = [
const QuizQuestionModel(
  'What is the primary purpose of set operators in SQL?',
  [
    'To combine and compare results of multiple queries', // Correct Answer
    'To perform arithmetic calculations',
    'To manipulate output for groups of rows',
    'To access data from more than one table',
  ],
),

const QuizQuestionModel(
  'Which set operator returns all distinct rows from both queries?',
  [
    'UNION', // Correct Answer
    'INTERSECT',
    'MINUS',
    'UNION ALL',
  ],
),

const QuizQuestionModel(
  'When using the UNION operator, how are duplicate rows handled?',
  [
    'Duplicates are excluded from the result.', // Correct Answer
    'Duplicates are included in the result.',
    'Duplicates are sorted alphabetically.',
    'Duplicates are counted twice.',
  ],
),

const QuizQuestionModel(
  'Which set operator returns all rows, including duplicates, from both queries?',
  [
    'UNION ALL', // Correct Answer
    'MINUS',
    'INTERSECT',
    'UNION',
  ],
),

const QuizQuestionModel(
  'What does the INTERSECT operator do in SQL?',
  [
    'Returns rows that are common to both queries.', // Correct Answer
    'Returns all distinct rows from both queries.',
    'Returns all rows, including duplicates, from both queries.',
    'Returns rows present in the first query but not in the second.',
  ],
),

const QuizQuestionModel(
  'When using the MINUS operator, what does it return?',
  [
    'All distinct rows selected by the first query but not by the second.', // Correct Answer
    'All distinct rows from both queries.',
    'All rows, including duplicates, from both queries.',
    'Rows that are common to both queries.',
  ],
),

const QuizQuestionModel(
  'What guideline must be followed when using set operators in SQL?',
  [
    'Expressions in the SELECT lists must match in number and data type.', // Correct Answer
    'Expressions in the SELECT lists must differ in data type.',
    'The ORDER BY clause can appear anywhere in the statement.',
    'Parentheses cannot be used to alter the sequence of execution.',
  ],
),

const QuizQuestionModel(
  'Where can the ORDER BY clause appear when using set operators?',
  [
    'Only at the end of the statement', // Correct Answer
    'Anywhere in the statement',
    'Only at the beginning of the statement',
    'Before the SELECT lists',
  ],
),


];