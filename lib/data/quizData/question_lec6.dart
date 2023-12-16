import 'package:sqlcheatcode/model/quiz_model.dart';

List<QuizQuestionModel> questionsLec6 = [
  const QuizQuestionModel(
  'What is the primary purpose of subqueries in SQL?',
  [
    'To solve problems and answer questions based on unknown values', // Correct Answer
    'To perform arithmetic calculations',
    'To manipulate output for groups of rows',
    'To access data from more than one table',
  ],
),

const QuizQuestionModel(
  'When does the subquery (inner query) execute in relation to the main query (outer query)?',
  [
    'Before the main query', // Correct Answer
    'Simultaneously with the main query',
    'After the main query',
    'It depends on the type of subquery',
  ],
),

const QuizQuestionModel(
  'Which guideline is correct when using subqueries in SQL?',
  [
    'Use single-row operators with multiple-row subqueries.', // Correct Answer
    'Place subqueries on the left side of the comparison condition.',
    'Use multiple-row operators with single-row subqueries.',
    'Do not enclose subqueries in parentheses.',
  ],
),

const QuizQuestionModel(
  'What is the purpose of the HAVING clause with subqueries in SQL?',
  [
    'To restrict groups based on results from subqueries', // Correct Answer
    'To filter results based on conditions within the subquery',
    'To execute subqueries first',
    'To handle errors in subqueries',
  ],
),

const QuizQuestionModel(
  'Which type of subquery returns only one row?',
  [
    'Single-row subquery', // Correct Answer
    'Multiple-row subquery',
    'Grouped subquery',
    'Nested subquery',
  ],
),

const QuizQuestionModel(
  'Which operator is used with single-row subqueries in SQL?',
  [
    '=' // Correct Answer
    'IN',
    'ANY',
    'ALL',
  ],
),

const QuizQuestionModel(
  'What does the ALL operator do in multiple-row subqueries?',
  [
    'Compares value to every value returned by the subquery', // Correct Answer
    'Compares value to any member in the list',
    'Compares value to each value returned by the subquery',
    'Returns all rows from the subquery',
  ],
),

const QuizQuestionModel(
  'When using the ANY operator in multiple-row subqueries, what does it mean if the main query returns a row?',
  [
    'The condition is true for at least one row in the subquery.', // Correct Answer
    'The condition is true for at least one row in the subquery.',
    'The condition is true for all rows in the subquery.',
    'The condition is true for none of the rows in the subquery.',
  ],
),

const QuizQuestionModel(
  'What problem may occur if a single-row operator is used with a multiple-row subquery?',
  [
    'The subquery returns more than one row.', // Correct Answer
    'The subquery returns no values.',
    'The subquery returns multiple values.',
    'The main query executes first.',
  ],
),

const QuizQuestionModel(
  'In SQL, when should subqueries be used?',
  [
    'To solve problems and answer questions based on unknown values', // Correct Answer
    'To access data from a single table',
    'To perform simple arithmetic calculations',
    'To create complex join conditions',
  ],
),


];