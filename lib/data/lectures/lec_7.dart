import 'package:flutter/material.dart';
import 'package:sqlcheatcode/pages/templateQuries/widget/buildExpansionTile.dart';
import 'package:sqlcheatcode/util/imageName.dart';

List<Widget> lec7Data = [ 

buildExpansionTile(
  index: '1',
  title: 'Using the UNION Operator',
 example: " SELECT employee_id, job_id FROM employees UNION SELECT employee_id, job_id FROM job_history ;",
  // imagePath: "${ImageFolderPath.lec1}/img1.png",
),

buildExpansionTile(
  index: '2',
  title: 'Using the UNION ALL Operator',
 example: "SELECT employee_id, job_id, department_id FROM employees UNION ALL SELECT employee_id, job_id, department_id FROM job_history ORDER BY employee_id ;",
  // imagePath: "${ImageFolderPath.lec1}/img1.png",
),
buildExpansionTile(
  index: '3',
  title: 'Using the INTERSECT Operator',
 example: "SELECT employee_id, job_id FROM employees INTERSECT SELECT employee_id, job_id FROM job_history ;",
  // imagePath: "${ImageFolderPath.lec1}/img1.png",
),
buildExpansionTile(
  index: '4',
  title: 'MINUS Operator',
 example: "SELECT employee_id FROM employees MINUS SELECT employee_id FROM job_history ;",
  // imagePath: "${ImageFolderPath.lec1}/img1.png",
),
];

// buildExpansionTile(
//   index: '',
//   title: '',
//   example: "",
//   imagePath: "${ImageFolderPath.lec1}/img1.png",
// ),