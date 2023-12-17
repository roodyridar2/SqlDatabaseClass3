import 'package:flutter/material.dart';
import 'package:sqlcheatcode/pages/templateQuries/widget/buildExpansionTile.dart';
import 'package:sqlcheatcode/util/imageName.dart';

List<Widget> lec4Data = [
  buildExpansionTile(
    index: '1',
    title: 'Using the AVG and SUM Functions',
    example:
        "SELECT AVG( salary ), MAX( salary ), MIN( salary ), SUM( salary ) FROM employees WHERE job_id LIKE '%REP%' ;",
    // imagePath: "${ImageFolderPath.lec1}/img1.png",
  ),
  buildExpansionTile(
    index: '2',
    title: 'Using the MIN and MAX Functions',
    example: "SELECT MIN( hire_date ), MAX( hire_date ) FROM employees ;",
    // imagePath: "${ImageFolderPath.lec1}/img1.png",
  ),
  buildExpansionTile(
    index: '3',
    title: 'Using the COUNT Function',
    example: "SELECT COUNT( * ) FROM employees WHERE department_id = 50 ;",
    example2:
        "SELECT COUNT( commission_pct ) FROM employees WHERE department_id = 80 ;",
    // imagePath: "${ImageFolderPath.lec1}/img1.png",
  ),
  buildExpansionTile(
    index: '4',
    title: 'Using the DISTINCT Keyword',
    example: "SELECT COUNT ( DISTINCT department_id ) FROM employees ;",
    // imagePath: "${ImageFolderPath.lec1}/img1.png",
  ),
  buildExpansionTile(
    index: '5',
    title: 'Group Functions and Null Values',
    example: "SELECT AVG( commission_pct ) FROM employees ;",
    example2: "SELECT AVG( NVL( commission_pct, 0 )) FROM employees ;",
    // imagePath: "${ImageFolderPath.lec1}/img1.png",
  ),
  buildExpansionTile(
    index: '6',
    title: 'Using the GROUP BY Clause ',
    example:
        "SELECT department_id, AVG( salary ) FROM employees GROUP BY department_id ;",
    // imagePath: "${ImageFolderPath.lec1}/img1.png",
  ),
  buildExpansionTile(
    index: '7',
    title: 'Using the GROUP BY Clause on Multiple Columns',
    example:
        "SELECT department_id dept_id, job_id, SUM( salary ) FROM employees GROUP BY department_id, job_id ;",
    // imagePath: "${ImageFolderPath.lec1}/img1.png",
  ),
  buildExpansionTile(
    index: '8',
    title: 'Using the HAVING Clause',
    example:
        "SELECT department_id, MAX( salary ) FROM employees GROUP BY department_id HAVING MAX( salary ) > 10000 ;",
    // imagePath: "${ImageFolderPath.lec1}/img1.png",
  ),
  buildExpansionTile(
    index: '9',
    title: 'Using the HAVING Clause with Order by',
    example:
        "SELECT job_id, SUM( salary ) PAYROLL FROM employees WHERE job_id NOT LIKE '%REP%' GROUP BY job_id HAVING SUM( salary ) > 13000 ORDER BY SUM( salary ) ;",
    // imagePath: "${ImageFolderPath.lec1}/img1.png",
  ),
  buildExpansionTile(
    index: '10',
    title: 'Nesting Group Functions',
    example:
        "SELECT MAX( AVG( salary )) FROM employees GROUP BY department_id ;",
    // imagePath: "${ImageFolderPath.lec1}/img1.png",
  ),
];

// buildExpansionTile(
//   index: '',
//   title: '',
//   example: "",
//   imagePath: "${ImageFolderPath.lec1}/img1.png",
// ),