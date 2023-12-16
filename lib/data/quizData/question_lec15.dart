import 'package:sqlcheatcode/model/quiz_model.dart';

List<QuizQuestionModel> questionsLec15 = [

  const QuizQuestionModel(
  'What is the purpose of authenticating users in a secure database?',
  [
    'To identify users through unique biometric characteristics', // Correct Answer
    'To restrict access to data and services',
    'To challenge users to provide biometric characteristics',
    'To monitor suspicious activity',
  ],
),

const QuizQuestionModel(
  'How can the data dictionary be protected in Oracle Database?',
  [
    'By ensuring O7_DICTIONARY_ACCESSIBILITY is set to FALSE', // Correct Answer
    'By setting O7_DICTIONARY_ACCESSIBILITY to TRUE',
    'By revoking privileges from all users',
    'By disabling the data dictionary',
  ],
),

const QuizQuestionModel(
  'What is the purpose of revoking unnecessary privileges from PUBLIC?',
  [
    'To enhance security by limiting unnecessary access', // Correct Answer
    'To restrict access to the database server',
    'To ensure that all privileges are granted to users',
    'To prevent users from accessing the data dictionary',
  ],
),

const QuizQuestionModel(
  'How can you limit users with administrative privileges in Oracle Database?',
  [
    'By restricting the types of privileges granted', // Correct Answer
    'By creating a new role for administrators',
    'By disabling remote authentication',
    'By enabling the CASCADE CONSTRAINTS clause',
  ],
),

const QuizQuestionModel(
  'What is the purpose of disabling remote operating system authentication?',
  [
    'To enhance security by disabling a less secure authentication method', // Correct Answer
    'To prevent users from connecting remotely',
    'To require users to authenticate externally',
    'To enable users to log in without further authentication',
  ],
),

const QuizQuestionModel(
  'Which parameter is used to set the number of failed login attempts before locking out an account?',
  [
    'FAILED_LOGIN_ATTEMPTS', // Correct Answer
    'PASSWORD_LOCK',
    'FAILED_LOGIN_LIMIT',
    'ACCOUNT_LOCK_ATTEMPTS',
  ],
),

const QuizQuestionModel(
  'What does the PASSWORD_LIFE_TIME parameter determine?',
  [
    'The lifetime of the password in days after which it expires', // Correct Answer
    'The lifetime of the user account',
    'The lifetime of the database instance',
    'The grace period for changing the password',
  ],
),

const QuizQuestionModel(
  'What is the purpose of the PASSWORD_REUSE_TIME parameter?',
  [
    'To set the number of days before a password can be reused', // Correct Answer
    'To set the maximum number of password changes',
    'To determine the grace period for changing the password',
    'To enforce password complexity',
  ],
),

const QuizQuestionModel(
  'What is the role of the supplied password verification function VERIFY_FUNCTION?',
  [
    'To verify the complexity of the password', // Correct Answer
    'To enforce a minimum password length',
    'To enforce the maximum password life time',
    'To determine the grace period for changing the password',
  ],
),

const QuizQuestionModel(
  'Which of the following parameters is used to define the maximum number of password changes required before the current password can be reused?',
  [
    'PASSWORD_REUSE_MAX', // Correct Answer
    'PASSWORD_REUSE_LIMIT',
    'PASSWORD_MAX_REUSE',
    'PASSWORD_CHANGE_LIMIT',
  ],
),

const QuizQuestionModel(
  'What does the AUDIT_TRAIL parameter control in Oracle Database?',
  [
    'Login events and exercise of system privileges', // Correct Answer
    'Table creation and deletion events',
    'Object privilege auditing',
    'Statement auditing records',
  ],
),

const QuizQuestionModel(
  'What can be audited using the AUDIT statement in Oracle Database?',
  [
    'Login events, exercise of system privileges, and use of SQL statements', // Correct Answer
    'Only SQL statement auditing',
    'Only session auditing',
    'System privilege auditing',
  ],
),

const QuizQuestionModel(
  'Which data dictionary view provides information about default audit options?',
  [
    'ALL_DEF_AUDIT_OPTS', // Correct Answer
    'DBA_AUDIT_OPTS',
    'DBA_OBJ_AUDIT_OPTS',
    'DBA_PRIV_AUDIT_OPTS',
  ],
),

const QuizQuestionModel(
  'What is the purpose of the AUDIT trail view DBA_AUDIT_TRAIL in Oracle Database?',
  [
    'To display all audit trail entries', // Correct Answer
    'To provide information about all database users',
    'To track schema object changes',
    'To store connect and disconnect entries',
  ],
),

];