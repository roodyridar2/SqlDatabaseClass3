import 'package:flutter/material.dart';
import 'package:sqlcheatcode/pages/templateQuries/widget/buildExpansionTile.dart';
import 'package:sqlcheatcode/util/imageName.dart';

List<Widget> lec1Data = [
  buildExpansionTile(
    index: '1',
  title: 'Selecting All Columns',
 example: "SELECT * FROM departments ;",
  imagePath: "${ImageFolderPath.lec1}/img1.png",
),

buildExpansionTile(
  index: '2',
  title: 'Selecting Specific Columns',
 example: "SELECT department_id, location_id FROM departments;",
  imagePath: "${ImageFolderPath.lec1}/img1.png",
),

buildExpansionTile(
  index: '3',
  title: 'Using Arithmetic Operators',
 example: "SELECT last_name, salary, salary + 300 FROM employees ;",
  imagePath: "${ImageFolderPath.lec1}/img1.png",
),
buildExpansionTile(
  index: '4',
  title: 'Operator Precedence',
 example: "SELECT last_name, salary, ( 12*salary+100 ) FROM employees ;",
 example2: "SELECT last_name, salary, 12* ( salary+100 ) FROM employees; ",
  imagePath: "${ImageFolderPath.lec1}/img1.png",
),
buildExpansionTile(
  index: '5',
 title: 'Null Values in Arithmetic Expressions',
 example: "SELECT last_name, 12*salary*commission_pct FROM employees ;",
  imagePath: "${ImageFolderPath.lec1}/img1.png",
),

buildExpansionTile(
  index: '6',
  title: 'Using Column Aliases',
 example: "SELECT last_name AS name, commission_pct comm FROM employees ;",
 example2: 'SELECT last_name "Name" , salary*12 "Annual Salary" FROM employees ;',
  imagePath: "${ImageFolderPath.lec1}/img1.png",
),
buildExpansionTile(
  index: '7',
  title: 'Concatenation Operator',
 example: 'SELECT last_name || job_id AS "Employees" FROM employees;',
  imagePath: "${ImageFolderPath.lec1}/img1.png",
),
buildExpansionTile(
  index: '8',
  title: 'Using Literal Character Strings',
 example: "SELECT last_name ||' is a '||job_id AS \"Employee Details\" FROM employees;",
  imagePath: "${ImageFolderPath.lec1}/img1.png",
),
buildExpansionTile(
  index: '9',
  title: 'Alternative Quote (q) Operator',
 example: "SELECT department_name || q'[, it's assigned Manager Id: ]' || manager_id AS \"Department and Manager\" FROM departments ;",
  imagePath: "${ImageFolderPath.lec1}/img1.png",
),
buildExpansionTile(
  index: '10',
  title: 'Duplicate Rows',
 example: "SELECT DISTINCT department_id FROM employees ;",
  imagePath: "${ImageFolderPath.lec1}/img1.png",
),
];


// buildExpansionTile(
//   title: '',
//   example: "",
//   imagePath: "${ImageFolderPath.lec1}/img1.png",
// ),
