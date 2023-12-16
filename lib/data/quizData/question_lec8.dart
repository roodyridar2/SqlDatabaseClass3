import 'package:sqlcheatcode/model/quiz_model.dart';

List<QuizQuestionModel> questionsLec8 = [
  const QuizQuestionModel(
  'What is the primary purpose of the CREATE TABLE statement in SQL?',
  [
    'To create a new table and include constraints', // Correct Answer
    'To perform arithmetic calculations',
    'To manipulate output for groups of rows',
    'To access data from more than one table',
  ],
),

const QuizQuestionModel(
  'Which database object is a basic unit of storage composed of rows?',
  [
    'Table', // Correct Answer
    'View',
    'Sequence',
    'Index',
  ],
),

const QuizQuestionModel(
  'What is a constraint in SQL?',
  [
    'A condition that must be satisfied by each row in a table', // Correct Answer
    'A rule that defines the result of a query',
    'A way to calculate the average value of a column',
    'A function that generates numeric values',
  ],
),

const QuizQuestionModel(
  'Which keyword is used to define a default value for a column during table creation?',
  [
    'DEFAULT', // Correct Answer
    'ALTER',
    'SET DEFAULT',
    'CREATE DEFAULT',
  ],
),

const QuizQuestionModel(
  'When should you use the owner\'s name as a prefix for tables belonging to other users?',
  [
    'When querying tables belonging to other users.', // Correct Answer
    'Never, it is not allowed.',
    'Only during table creation.',
    'Only when dropping tables.',
  ],
),

const QuizQuestionModel(
  'Which constraint type enforces that null values are not permitted for a column?',
  [
    'NOT NULL', // Correct Answer
    'PRIMARY KEY',
    'UNIQUE',
    'CHECK',
  ],
),

const QuizQuestionModel(
  'What does the UNIQUE constraint enforce in SQL?',
  [
    'Uniqueness of values in a column or a set of columns', // Correct Answer
    'A rule that defines the result of a query',
    'A condition that must be satisfied by each row in a table',
    'A way to calculate the average value of a column',
  ],
),

const QuizQuestionModel(
  'Which SQL keyword is used to define a condition that each row must satisfy in a CHECK constraint?',
  [
    'CHECK', // Correct Answer
    'CONSTR',
    'CONDITION',
    'ASSERT',
  ],
),

const QuizQuestionModel(
  'What is the purpose of the FOREIGN KEY constraint in SQL?',
  [
    'To identify the table and column in the parent table', // Correct Answer
    'To enforce uniqueness in a column or a set of columns',
    'To define a condition that each row must satisfy',
    'To create a rule that defines the result of a query',
  ],
),

const QuizQuestionModel(
  'What happens if you attempt to delete a row that contains a primary key used as a foreign key in another table?',
  [
    'An error occurs, and the row is not deleted.', // Correct Answer
    'The row is deleted without any issues.',
    'The dependent rows in the child table are automatically deleted.',
    'The foreign key is automatically updated to NULL.',
  ],
),


];