import 'package:flutter/material.dart';
import 'package:sqlcheatcode/pages/templateQuries/widget/buildExpansionTile.dart';
import 'package:sqlcheatcode/util/imageName.dart';

List<Widget> lec5Data = [

buildExpansionTile(
  index: '1',
  title: 'Retrieving Records with Natural Joins',
 example: "SELECT department_id, department_name, location_id, city FROM departments NATURAL JOIN locations ;",
  imagePath: "${ImageFolderPath.lec1}/img1.png",
),
buildExpansionTile(
  index: '2',
  title: 'Retrieving Records with the USING Clause',
 example: "SELECT employees.employee_id, employees.last_name, departments.location_id, department_id FROM employees JOIN departments USING (department_id) ;",
  imagePath: "${ImageFolderPath.lec1}/img1.png",
),
buildExpansionTile(
  index: '3',
  title: 'Using Table Aliases',
 example: "SELECT e.employee_id, e.last_name, d.location_id, department_id FROM employees e JOIN departments d USING (department_id) ;",
  imagePath: "${ImageFolderPath.lec1}/img1.png",
),
buildExpansionTile(
  index: '4',
  title: 'Retrieving Records with the ON Clause',
 example: "SELECT e.employee_id, e.last_name, e.department_id, d.department_id, d.location_id FROM employees e JOIN departments d ON ( e.department_id = d.department_id ) ;",
  imagePath: "${ImageFolderPath.lec1}/img1.png",
),
buildExpansionTile(
  index: '5',
  title: 'Self-Joins Using the ON Clause',
 example: "SELECT e.last_name emp, m.last_name mgr FROM employees e JOIN employees m ON ( e.manager_id = m.employee_id ) ;",
  imagePath: "${ImageFolderPath.lec1}/img1.png",
),
buildExpansionTile(
  index: '6',
  title: 'Applying Additional Conditions to a Join',
 example: "SELECT e.employee_id, e.last_name, e.department_id, d.department_id, d.location_id FROM employees e JOIN departments d ON ( e.department_id = d.department_id ) AND e.manager_id = 149 ;",
  imagePath: "${ImageFolderPath.lec1}/img1.png",
),
buildExpansionTile(
  index: '7',
  title: 'Creating Three-Way Joins with the ON Clause',
 example: "SELECT employee_id, city, department_name FROM employees e JOIN departments d ON d.department_id = e.department_id JOIN locations l ON d.location_id = l.location_id;",
  imagePath: "${ImageFolderPath.lec1}/img1.png",
),
buildExpansionTile(
  index: '8',
  title: 'LEFT OUTER JOIN',
 example: "SELECT e.last_name, e.department_id, d.department_name FROM employees e LEFT OUTER JOIN departments d ON ( e.department_id = d.department_id ) ;",
  imagePath: "${ImageFolderPath.lec1}/img1.png",
),
buildExpansionTile(
  index: '9',
  title: 'RIGHT OUTER JOIN',
 example: "SELECT e.last_name, e.department_id, d.department_name FROM employees e RIGHT OUTER JOIN departments d ON ( e.department_id = d.department_id ) ;",
  imagePath: "${ImageFolderPath.lec1}/img1.png",
),
buildExpansionTile(
  index: '10',
  title: 'FULL OUTER JOIN',
 example: "SELECT e.last_name, d.department_id, d.department_name FROM employees e FULL OUTER JOIN departments d ON ( e.department_id = d.department_id ) ;",
  imagePath: "${ImageFolderPath.lec1}/img1.png",
),
buildExpansionTile(
  index: '11',
  title: 'Creating Cross Joins',
 example: "SELECT last_name, department_name FROM employees CROSS JOIN departments ;",
  imagePath: "${ImageFolderPath.lec1}/img1.png",
),
];

// buildExpansionTile(
//   index: '',
//   title: '',
//   example: "",
//   imagePath: "${ImageFolderPath.lec1}/img1.png",
// ),