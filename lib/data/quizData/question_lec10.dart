import 'package:sqlcheatcode/model/quiz_model.dart';

List<QuizQuestionModel> questionsLec10 = [

  const QuizQuestionModel(
  'What is the purpose of creating views in a database?',
  [
    'To restrict data access and make complex queries easy', // Correct Answer
    'To modify table structures',
    'To add new rows to tables',
    'To create backup copies of tables',
  ],
),

const QuizQuestionModel(
  'What distinguishes complex views from simple views in SQL?',
  [
    'Contain functions', // Correct Answer
    'Number of rows in the view',
    'Number of tables involved',
    'Contain multiple conditions in the WHERE clause',
  ],
),

const QuizQuestionModel(
  'How is a subquery typically embedded in the CREATE VIEW statement?',
  [
    'As the AS subquery in the CREATE VIEW statement', // Correct Answer
    'As a separate statement after creating the view',
    'As a part of the SELECT clause',
    'Within the VALUES clause',
  ],
),

const QuizQuestionModel(
  'Which statement is used to retrieve data from a view?',
  [
    'SELECT * FROM', // Correct Answer
    'SELECT FROM',
    'GET DATA',
    'DISPLAY',
  ],
),

const QuizQuestionModel(
  'What is the purpose of the WITH CHECK OPTION clause when creating a view?',
  [
    'To ensure DML operations stay within the domain of the view', // Correct Answer
    'To allow unrestricted changes to the view data',
    'To deny all DML operations on the view',
    'To prevent the view from being dropped',
  ],
),

const QuizQuestionModel(
  'When using the WITH READ ONLY option in a view definition, what does it prevent?',
  [
    'Modifying data in the view', // Correct Answer
    'Creation of the view',
    'Dropping the view',
    'Selecting data from the view',
  ],
),

const QuizQuestionModel(
  'What is the purpose of the DROP VIEW statement?',
  [
    'To remove the view without losing the underlying data', // Correct Answer
    'To remove data from a view',
    'To modify the view structure',
    'To drop the view and lose the underlying data',
  ],
),

];