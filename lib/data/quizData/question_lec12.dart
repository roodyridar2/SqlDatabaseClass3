import 'package:sqlcheatcode/model/quiz_model.dart';

List<QuizQuestionModel> questionsLec12 = [
 const QuizQuestionModel(
  'What constitutes a database transaction?',
  [
    'DML statements that constitute one consistent change to the data', // Correct Answer
    'One DDL statement',
    'One data control language (DCL) statement',
    'All of the above',
  ],
),

const QuizQuestionModel(
  'When does a database transaction begin and end?',
  [
    'Begins with the first DML SQL statement and ends with a COMMIT or ROLLBACK statement', // Correct Answer
    'Begins with the first DML SQL statement and ends with a system crash',
    'Begins with a DDL or DCL statement and ends with a COMMIT or ROLLBACK statement',
    'Begins and ends with the user exiting SQL*Plus',
  ],
),

const QuizQuestionModel(
  'What is the purpose of COMMIT and ROLLBACK statements in a database transaction?',
  [
    'To ensure data consistency', // Correct Answer
    'To automatically commit changes',
    'To preview data changes before making them permanent',
    'To automatically rollback changes',
  ],
),

const QuizQuestionModel(
  'What does the SAVEPOINT statement do in a database transaction?',
  [
    'Creates a marker for a current transaction state', // Correct Answer
    'Rolls back changes to the beginning of the transaction',
    'Automatically commits changes',
    'Rolls back changes to the last COMMIT',
  ],
),

const QuizQuestionModel(
  'Under what circumstances does an automatic commit occur?',
  [
    'When a DDL or DCL statement is issued', // Correct Answer
    'When a ROLLBACK statement is issued',
    'When a DML statement is issued',
    'When the user exits SQL*Plus',
  ],
),

const QuizQuestionModel(
  'What is the state of the data before a COMMIT or ROLLBACK statement?',
  [
    'The data changes are made permanent, and all users can view the results', // Correct Answer
    'The data changes are permanent in the database',
    'The affected rows are locked, and other users cannot change the data',
    'The affected rows are locked, and other users can manipulate the data',
  ],
),

const QuizQuestionModel(
  'What happens to the state of the data after a ROLLBACK statement?',
  [
    'Data changes are undone, previous state is permanently lost, and locks are released', // Correct Answer
    'Data changes are made permanent in the database',
    'All users can view the results, and locks on the affected rows are released',
    'All savepoints are erased',
  ],
),

const QuizQuestionModel(
  'If a single DML statement fails during execution, what is the effect?',
  [
    'Only that statement is rolled back, and other changes are retained', // Correct Answer
    'All changes are automatically rolled back',
    'The entire transaction is rolled back',
    'The Oracle server implements an implicit savepoint',
  ],
),

const QuizQuestionModel(
  'What does read consistency guarantee in a database?',
  [
    'Readers do not wait for writers, and writers do not wait for readers', // Correct Answer
    'Readers wait for writers, and writers wait for readers',
    'All readers and writers wait for each other',
    'Writers wait for readers, but readers do not wait for writers',
  ],
),

const QuizQuestionModel(
  'How does the Oracle database handle concurrent transactions?',
  [
    'Effects of transactions are separated until a COMMIT is performed', // Correct Answer
    'Effects of transactions are combined immediately',
    'All transactions are automatically committed',
    'All transactions are automatically rolled back',
  ],
),


];