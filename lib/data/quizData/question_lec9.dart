import 'package:sqlcheatcode/model/quiz_model.dart';

List<QuizQuestionModel> questionsLec9 = [
  const QuizQuestionModel(
  'Which statement is used to add a new row to a table in SQL?',
  [
    'INSERT', // Correct Answer
    'UPDATE',
    'DELETE',
    'MODIFY',
  ],
),

const QuizQuestionModel(
  'When using the INSERT statement, what is the purpose of the VALUES clause?',
  [
    'To provide values for the new row to be inserted', // Correct Answer
    'To define the columns to be updated',
    'To specify the conditions for updating rows',
    'To list the columns in the table',
  ],
),

const QuizQuestionModel(
  'In SQL, how can you insert a new row with null values?',
  [
    'Include the NULL keyword in the VALUES clause', // Correct Answer
    'Specify the NULL keyword in the SET clause',
    'Use the ADD NULL VALUES statement',
    'Omit the column from the column list',
  ],
),

const QuizQuestionModel(
  'What function is used to record the current date and time when inserting a row?',
  [
    'SYSDATE()', // Correct Answer
    'NOW()',
    'CURRENT_TIMESTAMP',
    'DATE()',
  ],
),

const QuizQuestionModel(
  'How can you use substitution in a SQL statement to prompt for values?',
  [
    'Use & as a placeholder', // Correct Answer
    'Use # as a placeholder',
    'Use @ as a placeholder',
    'Use \$ as a placeholder',
  ],
),

const QuizQuestionModel(
  'Which statement is used to modify existing rows in a table in SQL?',
  [
    'UPDATE', // Correct Answer
    'ALTER',
    'MODIFY',
    'CHANGE',
  ],
),

const QuizQuestionModel(
  'In the UPDATE statement, what is the purpose of the WHERE clause?',
  [
    'To define the conditions for updating rows', // Correct Answer
    'To specify the columns to be updated',
    'To list the values for the new row',
    'To set the default values for the columns',
  ],
),

const QuizQuestionModel(
  'What happens if you omit the WHERE clause in an UPDATE statement?',
  [
    'All rows in the table are updated', // Correct Answer
    'An error occurs, and the statement is rejected',
    'All rows in the table are updated',
    'No rows are updated',
  ],
),

const QuizQuestionModel(
  'Which SQL statement is used to remove existing rows from a table?',
  [
    'DELETE', // Correct Answer
    'REMOVE',
    'ERASE',
    'DROP',
  ],
),

const QuizQuestionModel(
  'What is the purpose of the TRUNCATE statement in SQL?',
  [
    'To remove all rows from a table and leave the table structure intact', // Correct Answer
    'To modify the structure of a table',
    'To add new rows to a table',
    'To remove existing rows from a table',
  ],
),

];