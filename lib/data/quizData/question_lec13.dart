import 'package:sqlcheatcode/model/quiz_model.dart';

List<QuizQuestionModel> questionsLec13 = [
  const QuizQuestionModel(
  'What is the purpose of system privileges in a database?',
  [
    'Gaining access to the database', // Correct Answer
    'Manipulating the content of database objects',
    'Ensuring data consistency',
    'Creating new users and removing tables',
  ],
),

const QuizQuestionModel(
  'How does the database administrator (DBA) create users?',
  [
    'By executing the CREATE USER statement', // Correct Answer
    'By executing DML statements',
    'By granting system privileges',
    'By using the ALTER USER statement',
  ],
),

const QuizQuestionModel(
  'What system privileges might an application developer have?',
  [
    'All of the above', // Correct Answer
    'CREATE SESSION',
    'CREATE TABLE',
    'CREATE SEQUENCE',
  ],
),

const QuizQuestionModel(
  'What is the purpose of roles in database security?',
  [
    'Roles allocate privileges with a role', // Correct Answer
    'Roles allocate privileges without a role',
    'Roles are used for changing passwords',
    'Roles are for creating users',
  ],
),

const QuizQuestionModel(
  'How can the DBA grant system privileges to a user?',
  [
    'By using the GRANT statement', // Correct Answer
    'By executing INSERT statements',
    'By executing DDL statements',
    'By creating roles',
  ],
),

const QuizQuestionModel(
  'What does the CREATE ROLE statement do?',
  [
    'Creates a collection of privileges', // Correct Answer
    'Creates a user account',
    'Creates a database table',
    'Creates a new schema',
  ],
),

const QuizQuestionModel(
  'How can a user change their password?',
  [
    'By executing the ALTER USER statement', // Correct Answer
    'By using the CREATE USER statement',
    'By executing the GRANT statement',
    'By creating a new role',
  ],
),

const QuizQuestionModel(
  'What are object privileges used for?',
  [
    'Manipulating the content of the database objects', // Correct Answer
    'Gaining access to the database',
    'Creating new users',
    'Ensuring data consistency',
  ],
),

const QuizQuestionModel(
  'What does the GRANT statement do for object privileges?',
  [
    'Grants specific object privileges to a user', // Correct Answer
    'Gives the user authority to pass along privileges',
    'Revokes privileges from other users',
    'Changes a user\'s password',
  ],
),

const QuizQuestionModel(
  'How can a user revoke object privileges granted to another user?',
  [
    'By executing the REVOKE statement', // Correct Answer
    'By using the CREATE USER statement',
    'By altering the user\'s password',
    'By creating a new role',
  ],
),

];