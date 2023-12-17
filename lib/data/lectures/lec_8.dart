import 'package:flutter/material.dart';
import 'package:sqlcheatcode/pages/templateQuries/widget/buildExpansionTile.dart';
import 'package:sqlcheatcode/util/imageName.dart';

List<Widget> lec8Data = [
  buildExpansionTile(
    index: '1',
    title: 'Creating Tables',
    example:
        "CREATE TABLE dept ( deptno NUMBER( 2 ), dname VARCHAR2( 14 ), loc VARCHAR2( 13 ), create_date DATE DEFAULT SYSDATE ) ;",
    // imagePath: "${ImageFolderPath.lec1}/img1.png",
  ),
  buildExpansionTile(
    index: '2',
    title: 'Column-level constraint',
    example:
        "CREATE TABLE employees ( employee_id NUMBER( 6 ) CONSTRAINT emp_emp_id_pk PRIMARY KEY, first_name VARCHAR2( 20 )) ;",
    // imagePath: "${ImageFolderPath.lec1}/img1.png",
  ),
  buildExpansionTile(
    index: '3',
    title: 'Table-level constraint',
    example:
        "CREATE TABLE employees ( employee_id NUMBER( 6 ), first_name VARCHAR2( 20 ), ... job_id VARCHAR2( 10 ) NOT NULL, CONSTRAINT emp_emp_id_pk PRIMARY KEY ( EMPLOYEE_ID )) ;",
    // imagePath: "${ImageFolderPath.lec1}/img1.png",
  ),
  buildExpansionTile(
    index: '4',
    title: 'UNIQUE Constraint',
    example:
        "CREATE TABLE employees ( employee_id NUMBER( 6 ), last_name VARCHAR2( 25 ) NOT NULL, email VARCHAR2( 25 ), salary NUMBER( 8,2 ), commission_pct NUMBER( 2,2 ), hire_date DATE NOT NULL,  CONSTRAINT emp_email_uk UNIQUE( email )) ;",
    // imagePath: "${ImageFolderPath.lec1}/img1.png",
  ),
  buildExpansionTile(
    index: '5',
    title: 'FOREIGN KEY Constraint',
    example:
        "CREATE TABLE employees ( employee_id NUMBER( 6 ), last_name VARCHAR2( 25 ) NOT NULL, email VARCHAR2( 25 ), salary NUMBER( 8,2 ), commission_pct NUMBER( 2,2 ), hire_date DATE NOT NULL,  department_id NUMBER( 4 ), CONSTRAINT emp_dept_fk FOREIGN KEY ( department_id ) REFERENCES departments( department_id ), CONSTRAINT emp_email_uk UNIQUE( email )) ;",
    // imagePath: "${ImageFolderPath.lec1}/img1.png",
  ),
  buildExpansionTile(
  index: '6',
  title: 'CHECK Constraint',
 example: "..., salary NUMBER( 2 ) CONSTRAINT emp_salary_min CHECK ( salary > 0 ),... ",
  // imagePath: "${ImageFolderPath.lec1}/img1.png",
),
  buildExpansionTile(
  index: '7',
 title: 'Creating a Table by Using a Subquery',
 example: "CREATE TABLE dept80 AS SELECT employee_id, last_name, salary*12 ANNSAL, hire_date FROM employees WHERE department_id = 80 ;",
  // imagePath: "${ImageFolderPath.lec1}/img1.png",
),
  buildExpansionTile(
  index: '8',
  title: 'Dropping a Table',
 example: "DROP TABLE dept80 ;",
  // imagePath: "${ImageFolderPath.lec1}/img1.png",
),
];
  // buildExpansionTile(
//   index: '',
//   title: '',
//   example: "",
//   imagePath: "${ImageFolderPath.lec1}/img1.png",
// ),