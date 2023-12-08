import 'package:flutter/material.dart';
import 'package:sqlcheatcode/pages/templateQuries/widget/buildExpansionTile.dart';

List<Widget> lec2Data = [
  buildExpansionTile(
    title: 'Using the BETWEEN Condition',
    keywords: ['select', 'FROM', 'WHERE', '[Between]'],
    texts: ['column1, column2', 'table', 'condition', ''],
    description:
        'Use the BETWEEN condition to display rows based on a range of values',
    keywords2: ['select', 'from', 'where', 'Between', 'AND'],
    texts2: ['first_name, salary', 'Employees', 'salary', '2500', '3500'],
    imagePath: '',
  ),
  // buildExpansionTile(
  //   title: 'Using the IN Condition',
  //   keywords: ['select', 'FROM', 'WHERE', '[IN]'],
  //   texts: ['column1, column2', 'table', 'condition'],
  //   description:
  //       'Use the BETWEEN condition to display rows based on a range of values',
  //   keywords2: ['select', 'from', 'where', 'IN'],
  //   texts2: ['first_name, salary', 'Employees', 'salary', '(100, 101, 201)'],
  // ),
];
