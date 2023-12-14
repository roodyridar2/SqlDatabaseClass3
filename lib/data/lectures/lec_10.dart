import 'package:flutter/material.dart';
import 'package:sqlcheatcode/pages/templateQuries/widget/buildExpansionTile.dart';
import 'package:sqlcheatcode/util/imageName.dart';

List<Widget> lec10Data = [

  buildExpansionTile(
  index: '1',
  title: 'Creating a View',
 example: "CREATE VIEW empvu80 AS SELECT employee_id, last_name, salary FROM employees WHERE department_id = 80 ;",
  imagePath: "${ImageFolderPath.lec1}/img1.png",
),

  buildExpansionTile(
  index: '2',
  title: 'Describe the structure of the view',
  example: "DESCRIBE empvu80 ;",
  imagePath: "${ImageFolderPath.lec1}/img1.png",
),
  buildExpansionTile(
  index: '3',
  title: 'Creating a View',
 example: "CREATE VIEW salvu50 AS SELECT employee_id ID_NUMBER, last_name NAME, salary*12 ANN_SALARY FROM employees WHERE department_id = 50 ;",
  imagePath: "${ImageFolderPath.lec1}/img1.png",
),
  buildExpansionTile(
  index: '4',
  title: 'Retrieving Data from a View',
 example: "SELECT * FROM salvu50 ;",
  imagePath: "${ImageFolderPath.lec1}/img1.png",
),
  buildExpansionTile(
  index: '5',
  title: 'Modifying a View',
 example: "CREATE OR REPLACE VIEW empvu80 ( id_number, name, sal, department_id ) AS SELECT employee_id, first_name || ' ' || last_name, salary, department_id FROM employees WHERE department_id = 80 ;",
  imagePath: "${ImageFolderPath.lec1}/img1.png",
),
  buildExpansionTile(
  index: '6',
  title: 'Creating a Complex View',
 example: "CREATE OR REPLACE VIEW dept_sum_vu ( name, minsal, maxsal, avgsal ) AS SELECT d.department_name, MIN( e.salary ), MAX( e.salary ), AVG( e.salary ) FROM employees e JOIN departments d ON ( e.department_id = d.department_id ) GROUP BY d.department_name ;",
  imagePath: "${ImageFolderPath.lec1}/img1.png",
),
  buildExpansionTile(
  index: '7',
  title: 'Using the WITH CHECK OPTION Clause',
 example: "CREATE OR REPLACE VIEW empvu20 AS SELECT * FROM employees WHERE department_id = 20 WITH CHECK OPTION CONSTRAINT empvu20_ck ;",
  imagePath: "${ImageFolderPath.lec1}/img1.png",
),

  buildExpansionTile(
  index: '8',
  title: 'Denying DML Operations',
 example: "CREATE OR REPLACE VIEW empvu10 ( employee_number, employee_name, job_title ) AS SELECT employee_id, last_name, job_id FROM employees WHERE department_id = 10 WITH READ ONLY ;",
  imagePath: "${ImageFolderPath.lec1}/img1.png",
),

  buildExpansionTile(
  index: '9',
  title: 'Removing a View',
  example: "DROP VIEW empvu80 ;",
  imagePath: "${ImageFolderPath.lec1}/img1.png",
),
];

  // buildExpansionTile(
//   index: '',
//   title: '',
//   example: "",
//   imagePath: "${ImageFolderPath.lec1}/img1.png",
// ),