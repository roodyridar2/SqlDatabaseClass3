import 'package:sqlcheatcode/model/quiz_model.dart';

List<QuizQuestionModel> questionsLec5 = [
  const QuizQuestionModel(
  'What is the primary purpose of joins in SQL?',
  [
    'To access data from more than one table', // Correct Answer
    'To perform arithmetic calculations',
    'To manipulate output for groups of rows',
    'To generate a Cartesian product',
  ],
),

const QuizQuestionModel(
  'Which SQL:1999 join type returns only matched rows?',
  [
    'Inner join', // Correct Answer
    'Natural join',
    'Outer join',
    'Cross join',
  ],
),

const QuizQuestionModel(
  'What is the purpose of the NATURAL JOIN clause in SQL?',
  [
    'Return only matched rows with equal values in all columns', // Correct Answer
    'Specify arbitrary conditions for joining',
    'Include unmatched rows from the left table',
    'Generate a Cartesian product',
  ],
),

const QuizQuestionModel(
  'How can you qualify ambiguous column names in SQL?',
  [
    'Use table prefixes', // Correct Answer
    'Use column aliases',
    'Use the ON clause',
    'Use the USING clause',
  ],
),

const QuizQuestionModel(
  'Which join type returns the results of an inner join as well as the unmatched rows from the left table?',
  [
    'Left outer join', // Correct Answer
    'Right outer join',
    'Full outer join',
    'Cross join',
  ],
),

const QuizQuestionModel(
  'What is the purpose of the CROSS JOIN clause in SQL?',
  [
    'Produce the Cartesian product of two tables', // Correct Answer
    'Return only matched rows',
    'Include unmatched rows from both tables',
    'Specify conditions for joining',
  ],
),

const QuizQuestionModel(
  'When does a Cartesian product occur in SQL?',
  [
    'When a join condition is omitted', // Correct Answer
    'When a join condition is valid',
    'When a join condition is specified',
    'When using a CROSS JOIN clause',
  ],
),

const QuizQuestionModel(
  'Which join type includes unmatched rows from both tables?',
  [
    'Full outer join', // Correct Answer
    'Right outer join',
    'Left outer join',
    'Inner join',
  ],
),

const QuizQuestionModel(
  'How do you create a self-join using the ON clause in SQL?',
  [
    'Match columns with the same name in different tables', // Correct Answer
    'Specify arbitrary conditions for joining',
    'Include unmatched rows from the left table',
    'Return only matched rows with equal values in all columns',
  ],
),

const QuizQuestionModel(
  'Which SQL join type produces the cross-product of two tables?',
  [
    'Cross join', // Correct Answer
    'Inner join',
    'Outer join',
    'Natural join',
  ],
),

];