import 'package:flutter/material.dart';
import 'package:sqlcheatcode/pages/templateQuries/widget/buildExpansionTile.dart';
import 'package:sqlcheatcode/util/imageName.dart';

List<Widget> lec2Data = [
  buildExpansionTile(
    index: '1',
    title: 'Using the WHERE Clause',
    example:
        'SELECT employee_id, last_name, job_id, department_id FROM employees WHERE department_id = 90 ;',
    example2:
        "SELECT last_name, job_id, department_id FROM employees WHERE last_name = 'Whalen' ;",
    imagePath: "${ImageFolderPath.lec2}/img1.png",
  ),
  buildExpansionTile(
    index: '2',
    title: 'Using Comparison Conditions',
    example: 'SELECT last_name, salary FROM employees WHERE salary <= 3000 ;',
    imagePath: "${ImageFolderPath.lec2}/img2.png",
  ),
  buildExpansionTile(
    index: '3',
    title: 'Using the BETWEEN Condition',
    example:
        'SELECT last_name, salary FROM employees WHERE salary BETWEEN 2500 AND 3500 ;',
    imagePath: "${ImageFolderPath.lec2}/img3.png",
  ),
  buildExpansionTile(
    index: '4',
    title: 'Using the IN Condition',
    example:
        'SELECT employee_id, last_name, salary, manager_id FROM employees WHERE manager_id IN (100, 101, 201) ;',
    imagePath: "${ImageFolderPath.lec2}/img4.png",
  ),
  buildExpansionTile(
    index: '5',
    title: 'Using the LIKE Condition',
    example: 'SELECT first_name FROM employees WHERE first_name LIKE \'S%\' ;',
    imagePath: "${ImageFolderPath.lec2}/img5.png",
  ),
  buildExpansionTile(
    index: '6',
    title: 'Using the NULL Conditions',
    example:
        'SELECT last_name, manager_id FROM employees WHERE manager_id IS NULL ;',
    imagePath: "${ImageFolderPath.lec2}/img6.png",
  ),
  buildExpansionTile(
    index: '7',
    title: 'Using the AND Operator',
    example:
        "SELECT employee_id, last_name, job_id, salary FROM employees WHERE salary >= 10000 AND job_id LIKE '%MAN%' ;",
    imagePath: "${ImageFolderPath.lec2}/img7.png",
  ),
  buildExpansionTile(
    index: '8',
    title: 'Using the OR Operator',
    example:
        "SELECT employee_id, last_name, job_id, salary FROM employees WHERE salary >= 10000 OR job_id LIKE '%MAN%' ;",
    imagePath: "${ImageFolderPath.lec2}/img8.png",
  ),
  buildExpansionTile(
    index: '9',
    title: 'Using the NOT Operator',
    example:
        "SELECT last_name, job_id FROM employees WHERE job_id NOT IN ('IT_PROG', 'ST_CLERK', 'SA_REP') ;",
    imagePath: "${ImageFolderPath.lec2}/img9.png",
  ),
  buildExpansionTile(
    index: '10',
    title: 'Rules of Precedence',
    example:
        "SELECT last_name, job_id, salary FROM employees WHERE job_id = 'SA_REP' OR job_id = 'AD_PRES' AND salary > 15000 ;",

    imagePath: "${ImageFolderPath.lec2}/img10.png",
  ),
  buildExpansionTile(
    index: '11',
    title: 'Using the ORDER BY Clause',
    example:
        "SELECT last_name, job_id, department_id, hire_date FROM employees ORDER BY hire_date ;",
    imagePath: "${ImageFolderPath.lec2}/img11.png",
  ),
  buildExpansionTile(
    index: '12',
    title: 'Sorting in descending order',
    example:
        "SELECT last_name, job_id, department_id, hire_date FROM employees ORDER BY hire_date DESC ;",
    imagePath: "${ImageFolderPath.lec2}/img12.png",
  ),
  buildExpansionTile(
    index: '13',
    title: 'Sorting by column alias',
    example:
        "SELECT employee_id, last_name, salary*12 annsal FROM employees ORDER BY annsal ;",
    imagePath: "${ImageFolderPath.lec2}/img13.png",
  ),
  buildExpansionTile(
    index: '14',
    title: 'Sorting by multiple columns',
    example:
        "SELECT last_name, department_id, salary FROM employees ORDER BY department_id, salary DESC ;",
    imagePath: "${ImageFolderPath.lec2}/img14.png",
  ),
  buildExpansionTile(
    index: '15',
    title: 'Using the & Substitution Variable',
    example:
        "SELECT employee_id, last_name, salary, department_id FROM employees WHERE employee_id = &employee_num ;",
    imagePath: "",
  ),
  buildExpansionTile(
    index: '16',
    title: 'Specifying Column Names, Expressions, and Text',
    example:
        "SELECT employee_id, last_name, job_id, &column_name FROM employees WHERE &condition ORDER BY &order_column ;",
    imagePath: "",
  ),
];

// buildExpansionTile(
//   title: '',
//   example: "",
//   imagePath: "${ImageFolderPath.lec1}/img1.png",
// ),
