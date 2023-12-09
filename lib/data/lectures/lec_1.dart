import 'package:flutter/material.dart';
import 'package:sqlcheatcode/pages/templateQuries/widget/buildExpansionTile.dart';
import 'package:sqlcheatcode/util/imageName.dart';

List<Widget> lec1Data = [
  buildExpansionTile(
    title: 'Select Specific Columns',
    // keywords: ['select', 'FROM'],
    texts: ['select', 'column1, column2', 'FROM', 'table;'],
    description: 'Show Query data in columns column1, column2 from a table.',
    // keywords2: ['select', 'from'],
    texts2: ['select', 'first_name, salary', 'from', 'Employees;'],
    imagePath: "${ImageFolderPath.lec1}/img1.png",
  ),
  buildExpansionTile(
    title: 'Select All Columns',
    // keywords: ['select', 'FROM'],
    texts: ["select", '*', "from", '_table;'],
    description: 'Show Query data all rows and columns from a table.',
    // keywords2: ['select', 'from'],
    texts2: ['select', '*', 'from', 'employees;'],
    imagePath: "${ImageFolderPath.lec1}/img2.png",
  ),
  buildExpansionTile(
    title: 'Select with Condition',
    // keywords: ['select', 'FROM', 'WHERE'],
    texts: [
      'select',
      'column1,',
      'column2',
      'from',
      '_table',
      'where',
      'condition'
    ],
    description:
        'Query data and filter rows using a boolean condition: =, <, <=, >, >=, <>.',
    // keywords2: ['select', 'from', 'where'],
    texts2: [
      'select',
      'first_name,',
      'salary',
      'from',
      'Employees',
      'where',
      'salary > 1200\$;'
    ],
    imagePath: '',
  ),
];
