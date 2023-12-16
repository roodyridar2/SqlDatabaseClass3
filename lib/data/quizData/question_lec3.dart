import 'package:sqlcheatcode/model/quiz_model.dart';

List<QuizQuestionModel> questionsLec3 = [
  const QuizQuestionModel(
    'What is the primary purpose of single-row functions in SQL?',
    [
      'Act on each row individually and return one result per row', // Correct Answer
      'Return one result per set of rows',
      'Perform actions on multiple rows simultaneously',
      'Accept arguments and return multiple values',
    ],
  ),
  const QuizQuestionModel(
    'Which type of function returns one result per set of rows?',
    [
      'Multiple-row functions', // Correct Answer
      'General Single-row functions',
      'Character functions',
      'Conversion functions',
    ],
  ),
  const QuizQuestionModel(
    'What category of functions can be nested to any level in SQL?',
    [
      'Single-row functions', // Correct Answer
      'Character functions',
      'General functions',
      'Date functions',
    ],
  ),
  const QuizQuestionModel(
    'Which function converts a null value to an actual value, and the data types must match?',
    [
      'NVL', // Correct Answer
      'NVL2',
      'TO_CHAR',
      'DECODE',
    ],
  ),
  const QuizQuestionModel(
    'What is the purpose of the ROUND function in SQL?',
    [
      'Round a value to the nearest integer', // Correct Answer
      'Truncate a value to a specified decimal',
      'Calculate the remainder of division',
      'Add calendar months to a date',
    ],
  ),
  const QuizQuestionModel(
    'Which function is used to add calendar months to a date?',
    [
      'ADD_MONTHS', // Correct Answer
      'MONTHS_BETWEEN',
      'NEXT_DAY',
      'LAST_DAY',
    ],
  ),
  const QuizQuestionModel(
    'What is the purpose of the DECODE function in SQL?',
    [
      'Perform conditional inquiries using IF-THEN-ELSE logic', // Correct Answer
      'Convert a character string to a date format',
      'Add calendar months to a date',
      'Convert a character string to a number format',
    ],
  ),
  const QuizQuestionModel(
    'Which function facilitates conditional inquiries by doing the work of a CASE expression or an IF-THEN-ELSE statement?',
    [
      'DECODE', // Correct Answer
      'TO_CHAR',
      'TO_NUMBER',
      'NVL',
    ],
  ),
  const QuizQuestionModel(
    'What function is used to calculate the number of months between two dates?',
    [
      'MONTHS_BETWEEN', // Correct Answer
      'ADD_MONTHS',
      'LAST_DAY',
      'ROUND',
    ],
  ),
  const QuizQuestionModel(
    'What is the primary purpose of the TRUNC function in SQL?',
    [
      'Truncate a date to a specified unit', // Correct Answer
      'Round a value to the nearest integer',
      'Truncate a value to a specified decimal',
      'Add calendar months to a date',
    ],
  ),
];
