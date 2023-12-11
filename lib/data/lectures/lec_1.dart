import 'package:flutter/material.dart';
import 'package:sqlcheatcode/pages/templateQuries/widget/buildExpansionTile.dart';
import 'package:sqlcheatcode/util/imageName.dart';

List<Widget> lec1Data = [
  // buildExpansionTile(
  //   title: 'Select All Columns',
  //   texts: ["select", '*', "from", '_table;'],
  //   description: 'Show Query data all rows and columns from a table.',
  //   example: ['select', '*', 'from', 'employees;'],
  //   imagePath: "${ImageFolderPath.lec1}/img2.png",
  // ),
  // buildExpansionTile(
  //   title: 'Select Specific Columns',
  //   // keywords: ['select', 'FROM'],
  //   texts: ['select', 'column1,', 'column2', 'FROM', 'table;'],
  //   description: 'Show Query data in columns column1, column2 from a table.',
  //   // keywords2: ['select', 'from'],
  //   example: [
  //     'select',
  //     'department_id,',
  //     'location_id',
  //     'from',
  //     'departments;',
  //   ],
  //   imagePath: "${ImageFolderPath.lec1}/img1.png",
  // ),
  // // buildExpansionTile(
  // //   title: 'Select with Condition',
  // //   // keywords: ['select', 'FROM', 'WHERE'],
  // //   texts: [
  // //     'select',
  // //     'column1,',
  // //     'column2',
  // //     'from',
  // //     '_table',
  // //     'where',
  // //     'condition'
  // //   ],
  // //   description:
  // //       'Query data and filter rows using a boolean condition: =, <, <=, >, >=, <>.',
  // //   texts2: [
  // //     'select',
  // //     'first_name,',
  // //     'salary',
  // //     'from',
  // //     'Employees',
  // //     'where',
  // //     'salary > 1200\$;'
  // //   ],
  // //   imagePath: '',
  // // ),

  // buildExpansionTile(
  //   title: 'Using Arithmetic Operators',
  //   example: [
  //     'SELECT',
  //     'last_name,',
  //     'salary,',
  //     '(',
  //     'salary + 300',
  //     ')',
  //     'FROM',
  //     'employees;',
  //   ],
  //   imagePath: "${ImageFolderPath.lec1}/img1.png",
  // ),
  // buildExpansionTile(
  //   title: 'Operator Precedence',
  //   example: [
  //     'SELECT',
  //     'last_name,',
  //     'salary',
  //     '(',
  //     '12*salary+100',
  //     ')',
  //     'FROM',
  //     'employees;',
  //     'SELECT',
  //     'last_name,',
  //     'salary',
  //     '12 *',
  //     '(',
  //     'salary + 100',
  //     ')',
  //     'FROM',
  //     'employees;',
  //   ],
  //   imagePath: "${ImageFolderPath.lec1}/img1.png",
  // ),
  // buildExpansionTile(
  //   title: 'Null Values in Arithmetic Expressions',
  //   example: [
  //     'SELECT',
  //     'last_name',
  //     '12*salary*commission_pct',
  //     'FROM',
  //     'employees;',
  //   ],
  //   imagePath: "${ImageFolderPath.lec1}/img1.png",
  // ),
  // buildExpansionTile(
  //   title: 'Using Column Aliases',
  //   example: [
  //     'SELECT',
  //     'last_name',
  //     'AS',
  //     'name',
  //     'commission_pct',
  //     'comm',
  //     'FROM',
  //     'employees;',
  //   ],
  //   example2: [
  //     'SELECT',
  //     'last_name',
  //     '"Name",',
  //     'salary*12',
  //     '"Annual Salary"',
  //     'FROM',
  //     'employees;',
  //   ],
  //   imagePath: "${ImageFolderPath.lec1}/img1.png",
  // ),

  // buildExpansionTile(
  //   title: 'Concatenation Operator',
  //   example: [
  //     'SELECT',
  //     'last_name,',
  //     '||',
  //     'job_id',
  //     'AS',
  //     '"Employees"'
  //         'FROM',
  //     'employees;'
  //   ],
  //   imagePath: "${ImageFolderPath.lec1}/img1.png",
  // ),
  // buildExpansionTile(
  //   title: 'Using Literal Character Strings',
  //   example: [
  //     'SELECT',
  //     'last_name',
  //     '||',
  //     "'is a'",
  //     '||',
  //     'job_id',
  //     'AS',
  //     '"Employee Details"',
  //     'FROM',
  //     'employees;'
  //   ],
  //   imagePath: "${ImageFolderPath.lec1}/img1.png",
  // ),
  // buildExpansionTile(
  //   title: 'Alternative Quote (q) Operator',
  //   example: [
  //     'SELECT',
  //     'department_name',
  //     '||',
  //     "q'",
  //     '[',
  //     ", it's assigned Manager Id: ",
  //     "]' ",
  //     '||',
  //     'manager_id',
  //     'AS',
  //     ' "Department and Manager"',
  //     'FROM',
  //     'departments;'
  //   ],
  //   imagePath: "${ImageFolderPath.lec1}/img1.png",
  // ),
  // buildExpansionTile(
  //   title: 'DISTINCT Keyword',
  //   example: [
  //     'SELECT',
  //     'DISTINCT',
  //     'department_id',
  //     'FROM',
  //     'employees;',
  //   ],
  //   imagePath: "${ImageFolderPath.lec1}/img1.png",
  // ),
];

  // buildExpansionTile(
  //   title: '',
  //   example: [
  //   ],
  //   imagePath: "${ImageFolderPath.lec1}/img1.png",
  // ),