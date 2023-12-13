import 'package:flutter/material.dart';
import 'package:sqlcheatcode/pages/templateQuries/widget/buildExpansionTile.dart';
import 'package:sqlcheatcode/util/imageName.dart';

List<Widget> lec6Data = [

buildExpansionTile(
  index: '1',
  title: 'Executing Single-Row Subqueries',
  example: " SELECT last_name, job_id, salary FROM employees WHERE job_id = ( SELECT job_id FROM employees WHERE employee_id = 141 ) AND salary > ( SELECT salary FROM employees WHERE employee_id = 143 ) ;",
  imagePath: "${ImageFolderPath.lec1}/img1.png",
),

buildExpansionTile(
  index: '2',
  title: 'Using Group Functions in a Subquery',
  example: "SELECT last_name, job_id, salary FROM employees WHERE salary = ( SELECT MIN( salary ) FROM employees ) ;",
  imagePath: "${ImageFolderPath.lec1}/img1.png",
),
buildExpansionTile(
  index: '3',
  title: 'The HAVING Clause with Subqueries',
  example: "SELECT department_id, MIN( salary) FROM employees GROUP BY department_id HAVING MIN( salary) > ( SELECT MIN( salary) FROM employees WHERE department_id = 50 ) ;",
  imagePath: "${ImageFolderPath.lec1}/img1.png",
),
buildExpansionTile(
  index: '4',
 title: 'Using the ANY Operator in Multiple-Row Subqueries',
  example: "SELECT employee_id, last_name, job_id, salary FROM employees WHERE salary < ANY ( SELECT salary FROM employees WHERE job_id = 'IT_PROG' ) AND job_id <> 'IT_PROG' ;",
  imagePath: "${ImageFolderPath.lec1}/img1.png",
),
buildExpansionTile(
  index: '5',
 title: 'Using the ALL Operator in Multiple-Row Subqueries',
 example: " SELECT employee_id, last_name, job_id, salary FROM employees WHERE salary < ALL ( SELECT salary FROM employees WHERE job_id = 'IT_PROG' ) AND job_id <> 'IT_PROG' ;",
  imagePath: "${ImageFolderPath.lec1}/img1.png",
),
];

// buildExpansionTile(
//   index: '',
//   title: '',
//   example: "",
//   imagePath: "${ImageFolderPath.lec1}/img1.png",
// ),