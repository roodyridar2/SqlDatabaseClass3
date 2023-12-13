import 'package:flutter/material.dart';
import 'package:sqlcheatcode/pages/templateQuries/widget/buildExpansionTile.dart';
import 'package:sqlcheatcode/util/imageName.dart';

List<Widget> lec9Data = [
  buildExpansionTile(
    index: '1',
    title: 'Inserting New Rows',
    example:
        "INSERT INTO departments( department_id, department_name, manager_id, location_id ) VALUES ( 70, 'Public Relations', 100, 1700 ) ;",
    imagePath: "${ImageFolderPath.lec1}/img1.png",
  ),
  buildExpansionTile(
    index: '2',
    title: 'Inserting Rows with Null Values',
    example:
        "INSERT INTO departments ( department_id, department_name ) VALUES( 30, 'Purchasing' ) ;",
    example2: "INSERT INTO departments VALUES( 100, 'Finance', NULL, NULL ) ;",
    imagePath: "${ImageFolderPath.lec1}/img1.png",
  ),
  buildExpansionTile(
    index: '3',
    title: 'Inserting Special Values',
    example:
        "INSERT INTO employees ( employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, commission_pct, manager_id, department_id) VALUES( 113, 'Louis', 'Popp', 'LPOPP', '515.124.4567', SYSDATE, 'AC_ACCOUNT', 6900, NULL, 205, 100 ) ;",
    imagePath: "${ImageFolderPath.lec1}/img1.png",
  ),
  buildExpansionTile(
    index: '4',
    title: 'Creating a Script',
    example: "",
    imagePath: "${ImageFolderPath.lec1}/img1.png",
  ),
  buildExpansionTile(
    index: '5',
    title: 'Copying Rows from Another Table',
    example:
        "INSERT INTO sales_reps ( id, name, salary, commission_pct ) SELECT employee_id, last_name, salary, commission_pct FROM employees WHERE job_id LIKE '%REP%' ;",
    imagePath: "${ImageFolderPath.lec1}/img1.png",
  ),
  buildExpansionTile(
    index: '6',
    title: 'Updating Rows in a Table',
    example:
        "UPDATE employees SET department_id = 70 WHERE employee_id = 113 ;",
    example2: "UPDATE copy_emp SET department_id = 110 ;",
    imagePath: "${ImageFolderPath.lec1}/img1.png",
  ),
  buildExpansionTile(
    index: '7',
    title: 'Updating Two Columns with a Subquery',
    example:
        "UPDATE employees SET job_id = ( SELECT job_id FROM employees WHERE employee_id = 205 ), salary = ( SELECT salary FROM employees WHERE employee_id = 205 ) WHERE employee_id = 114 ;",
    imagePath: "${ImageFolderPath.lec1}/img1.png",
  ),
  buildExpansionTile(
    index: '8',
    title: 'Deleting Rows from a Table',
    example: "DELETE FROM departments WHERE department_name = 'Finance' ;",
    example2: 'DELETE FROM  copy_emp;',
    imagePath: "${ImageFolderPath.lec1}/img1.png",
  ),
  buildExpansionTile(
    index: '9',
    title: 'Deleting Rows Based on Another Table',
    example:
        "DELETE FROM employees WHERE department_id = ( SELECT department_id FROM departments WHERE department_name LIKE '%Public%' ) ;",
    imagePath: "${ImageFolderPath.lec1}/img1.png",
  ),
  buildExpansionTile(
    index: '10',
    title: 'TRUNCATE Statement',
    example: "TRUNCATE TABLE copy_emp ;",
    imagePath: "${ImageFolderPath.lec1}/img1.png",
  ),
];
  // buildExpansionTile(
//   index: '',
//   title: '',
//   example: "",
//   imagePath: "${ImageFolderPath.lec1}/img1.png",
// ),