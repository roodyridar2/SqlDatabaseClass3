import 'package:flutter/material.dart';
import 'package:sqlcheatcode/pages/templateQuries/widget/buildExpansionTile.dart';
import 'package:sqlcheatcode/util/imageName.dart';

List<Widget> lec3Data = [
  buildExpansionTile(
    index: '1',
    title: 'Case-Manipulation Functions',
    example:
        "SELECT employee_id, last_name, department_id FROM employees WHERE LOWER( last_name ) = 'higgins' ;",
    imagePath: "${ImageFolderPath.lec1}/img1.png",
  ),
  buildExpansionTile(
    index: '2',
    title: 'Using the Character-Manipulation Functions',
    example:
        "SELECT employee_id, CONCAT( first_name, last_name ) NAME, job_id, LENGTH( last_name ), INSTR( last_name, 'a') \"Contains 'a'?\" FROM employees WHERE SUBSTR( job_id, 4 ) = 'REP' ;",
    imagePath: "${ImageFolderPath.lec1}/img1.png",
  ),
  buildExpansionTile(
    index: '3',
    title: 'Using the ROUND Function',
    example:
        "SELECT ROUND( 45.923,2 ), ROUND( 45.923,0 ), ROUND( 45.923,-1 ) FROM DUAL ;",
    imagePath: "${ImageFolderPath.lec1}/img1.png",
  ),
  buildExpansionTile(
    index: '4',
    title: 'Using the TRUNC Function',
    example:
        "SELECT TRUNC( 45.923,2 ), TRUNC( 45.923 ), TRUNC( 45.923,-1 ) FROM DUAL ;",
    imagePath: "${ImageFolderPath.lec1}/img1.png",
  ),
  buildExpansionTile(
    index: '5',
    title: 'Using the MOD Function',
    example:
        "SELECT last_name, salary, MOD( salary, 5000 ) FROM employees WHERE job_id = 'SA_REP' ;",
    imagePath: "${ImageFolderPath.lec1}/img1.png",
  ),
  buildExpansionTile(
    index: '6',
    title: 'Arithmetic Operators with Dates',
    example:
        "SELECT last_name, ( SYSDATE-hire_date ) / 7 AS WEEKS FROM employees WHERE department_id = 90 ;",
    imagePath: "${ImageFolderPath.lec1}/img1.png",
  ),
  buildExpansionTile(
    index: '7',
    title: 'TO_CHAR Function with Dates',
    example:
        "SELECT last_name, TO_CHAR( hire_date, 'fmDD Month YYYY' ) AS HIREDATE FROM employees ;",
    imagePath: "${ImageFolderPath.lec1}/img1.png",
  ),
  buildExpansionTile(
    index: '8',
    title: 'TO_CHAR Function with Numbers',
    example:
        "SELECT TO_CHAR( salary, '\$99,999.00' ) SALARY FROM employees WHERE last_name = 'Ernst' ;",
    imagePath: "${ImageFolderPath.lec1}/img1.png",
  ),
  buildExpansionTile(
    index: '9',
    title: 'Nesting Functions',
    example:
        "SELECT last_name, UPPER( CONCAT( SUBSTR( LAST_NAME, 1, 8), '_US' )) FROM employees WHERE department_id = 60 ;",
    imagePath: "${ImageFolderPath.lec1}/img1.png",
  ),
  buildExpansionTile(
    index: '10',
    title: 'Using the NVL Function',
    example:
        "SELECT last_name, salary, NVL( commission_pct, 0), ( salary*12 ) + ( salary*12* NVL( commission_pct, 0 )) AN_SAL FROM employees ;",
    imagePath: "${ImageFolderPath.lec1}/img1.png",
  ),
  buildExpansionTile(
    index: '11',
    title: 'Using the NVL2 Function',
    example:
        "SELECT last_name, salary, commission_pct, NVL2( commission_pct, 'SAL+COMM', 'SAL' ) income FROM employees WHERE department_id IN ( 50, 80 ) ;",
    imagePath: "${ImageFolderPath.lec1}/img1.png",
  ),
  buildExpansionTile(
    index: '12',
    title: 'Using the CASE Expression',
    example:
        "SELECT last_name, job_id, salary, CASE job_id WHEN 'IT_PROG' THEN 1.10*salary WHEN 'ST_CLERK' THEN 1.15*salary WHEN 'SA_REP' THEN 1.20*salary ELSE salary END \"REVISED_SALARY\" FROM employees ;",
    imagePath: "${ImageFolderPath.lec1}/img1.png",
  ),
  buildExpansionTile(
    index: '13',
    title: 'Using the DECODE Function',
    example:
        "SELECT last_name, job_id, salary, DECODE( job_id, 'IT_PROG', 1.10*salary, 'ST_CLERK', 1.15*salary, 'SA_REP', 1.20*salary, salary ) REVISED_SALARY FROM employees ;",
    imagePath: "${ImageFolderPath.lec1}/img1.png",
  ),
];


// buildExpansionTile(
//   index: '',
//   title: '',
//   example: "",
//   imagePath: "${ImageFolderPath.lec1}/img1.png",
// ),