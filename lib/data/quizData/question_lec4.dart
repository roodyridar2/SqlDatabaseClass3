import 'package:sqlcheatcode/model/quiz_model.dart';

List<QuizQuestionModel> questionsLec4 = [

  const QuizQuestionModel(
  'What is the primary purpose of group functions in SQL?',
  [
    'Operate on sets of rows to give one result per group', // Correct Answer
    'Perform actions on individual rows',
    'Return multiple values per set of rows',
    'Manipulate output for groups of rows',
  ],
),

const QuizQuestionModel(
  'Which of the following is a group function in SQL?',
  [
    'AVG', // Correct Answer
    'ROUND',
    'UPPER',
    'CONCAT',
  ],
),

const QuizQuestionModel(
  'What do group functions operate on in SQL?',
  [
    'Sets of rows', // Correct Answer
    'Individual rows',
    'Columns',
    'Tables',
  ],
),

const QuizQuestionModel(
  'Which of the following is not a type of group function in SQL?',
  [
    'LOWER', // Correct Answer
    'MAX',
    'SUM',
    'TO_CHAR',
  ],
),

const QuizQuestionModel(
  'What does the COUNT function return in SQL?',
  [
    'Number of rows', // Correct Answer
    'Sum of values',
    'Average of values',
    'Maximum value',
  ],
),

const QuizQuestionModel(
  'In SQL, what does the GROUP BY clause do?',
  [
    'Groups data by using the GROUP BY clause', // Correct Answer
    'Sorts rows in ascending order',
    'Filters rows based on a condition',
    'Performs arithmetic calculations',
  ],
),

const QuizQuestionModel(
  'What is the purpose of the HAVING clause in SQL?',
  [
    'Restricts groups after grouping', // Correct Answer
    'Filters rows before grouping',
    'Groups rows based on a condition',
    'Performs conditional inquiries',
  ],
),

const QuizQuestionModel(
  'Which of the following is a legal query using group functions in SQL?',
  [
    'SELECT AVG(salary) FROM employees WHERE AVG(salary) > 8000 GROUP BY department_id;', // Correct Answer
    'SELECT department_id, COUNT(last_name) FROM employees;',
    'SELECT department_id, COUNT(last_name) FROM employees GROUP BY department_id;',
    'SELECT department_id, COUNT(last_name) * MAX(salary) FROM employees;',
  ],
),

const QuizQuestionModel(
  'What is the correct order of execution when using the HAVING clause in SQL?',
  [
    'Group, Apply HAVING clause, Group again, Display', // Correct Answer
    'Apply HAVING clause, Group, Display',
    'Group, Display, Apply HAVING clause',
    'Apply HAVING clause, Display, Group',
  ],
),

const QuizQuestionModel(
  'Which group function can be nested in SQL?',
  [
    'AVG', // Correct Answer
    'MAX',
    'COUNT',
    'SUM',
  ],
),

];