import 'package:sqlcheatcode/model/quiz_model.dart';

List<QuizQuestionModel> questionsLec11 = [
  const QuizQuestionModel(
  'What is the primary purpose of a sequence in a database?',
  [
    'To generate a sequence of integers automatically', // Correct Answer
    'To improve query performance',
    'To create alternative names for objects',
    'To provide alternative names for columns',
  ],
),

const QuizQuestionModel(
  'When using the NEXTVAL and CURRVAL pseudocolumns, which statement is correct?',
  [
    'NEXTVAL must be issued before CURRVAL contains a value.', // Correct Answer
    'NEXTVAL returns the current sequence value.',
    'CURRVAL returns the next available sequence value.',
    'CURRVAL must be issued before NEXTVAL contains a value.',
  ],
),

const QuizQuestionModel(
  'What context allows the use of NEXTVAL and CURRVAL in a SQL statement?',
  [
    'The SELECT list of a subquery in an INSERT statement', // Correct Answer
    'The SELECT list of a view',
    'A SELECT statement with the DISTINCT keyword',
    'A subquery in a SELECT, DELETE, or UPDATE statement',
  ],
),

const QuizQuestionModel(
  'What is the purpose of indexing in a database?',
  [
    'To improve query performance', // Correct Answer
    'To create alternative names for tables',
    'To generate a sequence of integers automatically',
    'To provide alternative names for columns',
  ],
),

const QuizQuestionModel(
  'When should you create an index on a database table?',
  [
    'When one or more columns are frequently used together in a WHERE clause or a join condition', // Correct Answer
    'When the table is small or most queries retrieve more than 2% to 4% of the rows',
    'When the columns are not often used as a condition in the query',
    'When the table is updated frequently',
  ],
),

const QuizQuestionModel(
  'Which type of index is the most common type of database index?',
  [
    'B-tree index', // Correct Answer
    'Function-based index',
    'Bitmap index',
    'Application domain index',
  ],
),

const QuizQuestionModel(
  'What does a synonym do in a database?',
  [
    'Creates alternative names for objects', // Correct Answer
    'Improves query performance',
    'Generates a sequence of integers automatically',
    'Creates alternative names for columns',
  ],
),

];