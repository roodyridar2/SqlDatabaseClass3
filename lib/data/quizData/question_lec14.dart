import 'package:sqlcheatcode/model/quiz_model.dart';

List<QuizQuestionModel> questionsLec14 = [
  const QuizQuestionModel(
    'What is the purpose of the ALTER TABLE statement?',
    [
      'Add, modify, or drop columns', // Correct Answer
      'Create a new table',
      'Delete a table',
      'Add a new row to the table',
    ],
  ),
  const QuizQuestionModel(
    'How do you add a new column to an existing table?',
    [
      'Use the ADD clause with ALTER TABLE', // Correct Answer
      'Use the CREATE COLUMN statement',
      'Use the ADD COLUMN statement',
      'Use the MODIFY COLUMN statement',
    ],
  ),
  const QuizQuestionModel(
    'What can be modified when using the ALTER TABLE statement?',
    [
      'Column data type, size, and default value', // Correct Answer
      'Only the column name',
      'Only the column data type',
      'Table name and structure',
    ],
  ),
  const QuizQuestionModel(
    'How can you drop a column from an existing table?',
    [
      'Use the DROP COLUMN clause with ALTER TABLE', // Correct Answer
      'Use the DELETE COLUMN statement',
      'Use the REMOVE COLUMN statement',
      'Use the MODIFY COLUMN statement',
    ],
  ),
  const QuizQuestionModel(
    'What does the CASCADE CONSTRAINTS clause do when dropping a column?',
    [
      'Drops all referential integrity constraints related to the dropped column', // Correct Answer
      'Drops only the column',
      'Drops the column and its data',
      'Drops the entire table',
    ],
  ),
  const QuizQuestionModel(
    'How can you disable an integrity constraint on a table?',
    [
      'Use the DISABLE CONSTRAINT clause with ALTER TABLE', // Correct Answer
      'Use the DISABLE CONSTRAINT statement',
      'Use the ALTER CONSTRAINT statement',
      'Use the DROP CONSTRAINT statement',
    ],
  ),
  const QuizQuestionModel(
    'What happens when you enable an integrity constraint?',
    [
      'The CASCADE option is applied', // Correct Answer
      'A UNIQUE index is automatically created',
      'The table is dropped',
      'All data in the table is deleted',
    ],
  ),
  const QuizQuestionModel(
    'When using the FLASHBACK TABLE statement, what is the purpose of TO { TIMESTAMP | SCN } expr?',
    [
      'Specifies the point in time to restore the table to', // Correct Answer
      'Specifies the name of the table to flashback',
      'Indicates the user who performed the flashback',
      'Sets the duration for the flashback operation',
    ],
  ),
  const QuizQuestionModel(
    'What is the advantage of using the FLASHBACK TABLE statement?',
    [
      'Restores a table to an earlier point in time', // Correct Answer
      'Creates a new table',
      'Deletes the table permanently',
      'Enables or disables triggers on the table',
    ],
  ),
];
