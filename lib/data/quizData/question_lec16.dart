import 'package:sqlcheatcode/model/quiz_model.dart';

List<QuizQuestionModel> questionsLec16 = [


  const QuizQuestionModel(
  'What is the purpose of backup and recovery in a database?',
  [
    'To protect the database against data loss and reconstruct it after any kind of data loss', // Correct Answer
    'To increase the Mean-Time-To-Recover (MTTR)',
    'To decrease the Mean-Time-Between-Failures (MTBF)',
    'To maximize the Mean-Time-Between-Failures (MTBF)',
  ],
),

const QuizQuestionModel(
  'What are physical backups in Oracle Database?',
  [
    'Backups of the physical files used in storing and recovering the database', // Correct Answer
    'Backups of logical data exported from a database',
    'Backups of control files and redo logs',
    'Backups of database metadata',
  ],
),

const QuizQuestionModel(
  'What is the main purpose of logical backups in Oracle Database?',
  [
    'To supplement physical backups in many circumstances', // Correct Answer
    'To create a copy of control files for recovery',
    'To store logical data in binary files',
    'To create a copy of the entire database',
  ],
),

const QuizQuestionModel(
  'What are the responsibilities of the administrator in backup and recovery?',
  [
    'Protect the database from failure, increase MTBF, decrease MTTR, minimize data loss', // Correct Answer
    'Decrease the Mean-Time-Between-Failures (MTBF)',
    'Increase the Mean-Time-To-Recover (MTTR)',
    'Maximize the Mean-Time-Between-Failures (MTBF)',
  ],
),

const QuizQuestionModel(
  'What categories can failures in an Oracle Database be divided into?',
  [
    'Statement failure, user process failure, network failure, user error, instance failure, media failure', // Correct Answer
    'System failure, application failure, network failure',
    'Data failure, hardware failure, software failure',
    'Logical failure, physical failure',
  ],
),

const QuizQuestionModel(
  'How can a user recover from a statement failure in Oracle Database?',
  [
    'By working with users to validate and correct data', // Correct Answer
    'By rolling back uncommitted changes and releasing locks',
    'By enabling resumable space allocation',
    'By contacting the DBA to resolve user process failures',
  ],
),

const QuizQuestionModel(
  'What is instance recovery in Oracle Database?',
  [
    'A process that involves rolling forward changes and rolling back uncommitted transactions', // Correct Answer
    'A manual process to synchronize files after a power outage',
    'A process to recover deleted or modified data',
    'An automatic process to restart the instance after a hardware failure',
  ],
),

const QuizQuestionModel(
  'How can you recover from a media failure in Oracle Database?',
  [
    'By restoring the affected file from backup and applying redo information', // Correct Answer
    'By restarting the instance using the "startup" command',
    'By rolling forward changes in the redo logs',
    'By reconfiguring the database to use a new disk controller',
  ],
),

const QuizQuestionModel(
  'What is a key consideration to configure a database for maximum recoverability in Oracle Database?',
  [
    'Multiplexing control files and redo log groups', // Correct Answer
    'Maximizing the number of redo log groups',
    'Retaining only the latest archived copies of redo logs',
    'Scheduling irregular backups',
  ],
),

const QuizQuestionModel(
  'What is the primary purpose of configuring the database for recoverability?',
  [
    'To ensure the database can be recovered after a failure', // Correct Answer
    'To minimize the Mean-Time-Between-Failures (MTBF)',
    'To maximize the Mean-Time-To-Recover (MTTR)',
    'To ensure there are no failures in the database',
  ],
),

];