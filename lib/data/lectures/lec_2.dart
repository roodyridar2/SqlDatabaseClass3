import 'package:flutter/material.dart';
import 'package:sqlcheatcode/pages/templateQuries/widget/buildExpansionTile.dart';
import 'package:sqlcheatcode/util/imageName.dart';

List<Widget> lec2Data = [
  buildExpansionTile(
    title: 'Using the WHERE Clause',
    example:
        'SELECT employee_id, last_name, job_id, department_id FROM employees WHERE department_id = 90 ;',
    example2:
        "SELECT last_name, job_id, department_id FROM employees WHERE last_name = 'Whalen' ;",
    imagePath: "${ImageFolderPath.lec1}/img1.png",
  ),
  buildExpansionTile(
    title: 'Using Comparison Conditions',
    example: 'SELECT last_name, salary FROM employees WHERE salary <= 3000 ;',
    imagePath: "${ImageFolderPath.lec1}/img1.png",
  ),
  buildExpansionTile(
    title: 'Using the BETWEEN Condition',
    example:
        'SELECT last_name, salary FROM employees WHERE salary BETWEEN 2500 AND 3500 ;',
    imagePath: "${ImageFolderPath.lec1}/img1.png",
  ),
  buildExpansionTile(
    title: 'Using the IN Condition',
    example:
        'SELECT employee_id, last_name, salary, manager_id FROM employees WHERE manager_id IN (100, 101, 201) ;',
    imagePath: "${ImageFolderPath.lec1}/img1.png",
  ),
  buildExpansionTile(
    title: 'Using the LIKE Condition',
    example: 'SELECT first_name FROM employees WHERE first_name LIKE \'S%\' ;',
    imagePath: "${ImageFolderPath.lec1}/img1.png",
  ),
  buildExpansionTile(
    title: 'Using the NULL Conditions',
    example:
        'SELECT last_name, manager_id FROM employees WHERE manager_id IS NULL ;',
    imagePath: "${ImageFolderPath.lec1}/img1.png",
  ),
  buildExpansionTile(
    title: 'Using the AND Operator',
    example:
        "SELECT employee_id, last_name, job_id, salary FROM employees WHERE salary >= 10000 AND job_id LIKE '%MAN%' ;",
    imagePath: "${ImageFolderPath.lec1}/img1.png",
  ),
  buildExpansionTile(
    title: 'Using the OR Operator',
    example:
        "SELECT employee_id, last_name, job_id, salary FROM employees WHERE salary >= 10000 OR job_id LIKE '%MAN%' ;",
    imagePath: "${ImageFolderPath.lec1}/img1.png",
  ),
  buildExpansionTile(
    title: 'Using the NOT Operator',
    example:
        "SELECT last_name, job_id FROM employees WHERE job_id NOT IN ('IT_PROG', 'ST_CLERK', 'SA_REP') ;",
    imagePath: "${ImageFolderPath.lec1}/img1.png",
  ),
  buildExpansionTile(
    title: 'Rules of Precedence',
    example:
        "SELECT last_name, job_id, salary FROM employees WHERE job_id = 'SA_REP' OR job_id = 'AD_PRES' AND salary > 15000 ;",
    example2:
        "SELECT last_name, job_id, salary FROM employees WHERE (job_id = 'SA_REP' OR job_id = 'AD_PRES') AND salary > 15000 ;",
    imagePath: "${ImageFolderPath.lec1}/img1.png",
  ),
  buildExpansionTile(
    title: 'Using the ORDER BY Clause',
    example:
        "SELECT last_name, job_id, department_id, hire_date FROM employees ORDER BY hire_date ;",
    imagePath: "${ImageFolderPath.lec1}/img1.png",
  ),
  buildExpansionTile(
    title: 'Sorting in descending order',
    example:
        "SELECT last_name, job_id, department_id, hire_date FROM employees ORDER BY hire_date DESC ;",
    imagePath: "${ImageFolderPath.lec1}/img1.png",
  ),
  buildExpansionTile(
    title: 'Sorting by column alias',
    example:
        "SELECT employee_id, last_name, salary*12 annsal FROM employees ORDER BY annsal ; ",
    imagePath: "${ImageFolderPath.lec1}/img1.png",
  ),
  buildExpansionTile(
    title: 'Sorting by multiple columns',
    example:
        "SELECT last_name, department_id, salary FROM employees ORDER BY department_id, salary DESC; ",
    imagePath: "${ImageFolderPath.lec1}/img1.png",
  ),
  buildExpansionTile(
    title: 'Using the & Substitution Variable',
    example:
        "SELECT employee_id, last_name, salary, department_id FROM employees WHERE employee_id = &employee_num ;",
    imagePath: "${ImageFolderPath.lec1}/img1.png",
  ),
  buildExpansionTile(
    title: 'Specifying Column Names, Expressions, and Text',
    example:
        "SELECT employee_id, last_name, job_id,&column_name FROM employees WHERE &condition ORDER BY &order_column ;",
    imagePath: "${ImageFolderPath.lec1}/img1.png",
  ),
];

// buildExpansionTile(
//   title: '',
//   example: "",
//   imagePath: "${ImageFolderPath.lec1}/img1.png",
// ),
