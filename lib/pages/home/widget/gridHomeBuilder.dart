import 'package:flutter/material.dart';
import 'package:sqlcheatcode/data/lectures/lec_1.dart';
import 'package:sqlcheatcode/data/lectures/lec_10.dart';
import 'package:sqlcheatcode/data/lectures/lec_2.dart';
import 'package:sqlcheatcode/data/lectures/lec_3.dart';
import 'package:sqlcheatcode/data/lectures/lec_4.dart';
import 'package:sqlcheatcode/data/lectures/lec_5.dart';
import 'package:sqlcheatcode/data/lectures/lec_6.dart';
import 'package:sqlcheatcode/data/lectures/lec_7.dart';
import 'package:sqlcheatcode/data/lectures/lec_8.dart';
import 'package:sqlcheatcode/data/lectures/lec_9.dart';
import 'package:sqlcheatcode/model/lec_sql_model.dart';
import 'package:sqlcheatcode/pages/home/widget/cardWidgetInkwell.dart';
import 'package:sqlcheatcode/util/constText.dart';

final List _lecCard = [
  LecSqlModel(lectureNames[Lecture.lec1]!, 'Introduction to SQL', lec1Data),
  LecSqlModel(lectureNames[Lecture.lec2]!, 'Restricting and Sorting Data', lec2Data),
  LecSqlModel(lectureNames[Lecture.lec3]!, 'Using Single-Row Functions to Customize Output', lec3Data),
  LecSqlModel(lectureNames[Lecture.lec4]!, 'Reporting Aggregated Data Using the Group Functions', lec4Data),
  LecSqlModel(lectureNames[Lecture.lec5]!, 'Displaying Data from Multiple Tables', lec5Data),
  LecSqlModel(lectureNames[Lecture.lec6]!, 'Using Subqueries to Solve Queries', lec6Data),
  LecSqlModel(lectureNames[Lecture.lec7]!, 'Using the Set Operators', lec7Data),
  LecSqlModel(lectureNames[Lecture.lec8]!, 'Using DDL Statements to Create and Manage Tables', lec8Data),
  LecSqlModel(lectureNames[Lecture.lec9]!, 'Data Manipulation Language', lec9Data),
  LecSqlModel(lectureNames[Lecture.lec10]!, 'Creating Other Schema Objects View', lec10Data),
];
Widget gridHomeBuilder(int crossAxisCount, BuildContext context) {
  double aspectRatio = 1;

  if (crossAxisCount == 3) {
    aspectRatio = 1;
  } else if (crossAxisCount == 2) {
    aspectRatio = 1 / 0.8;
  } else {
    aspectRatio = 1 / 0.4;
  }

  return Column(
    children: [
      Expanded(
        child: GridView.builder(
          itemCount: _lecCard.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            mainAxisSpacing: 5,
            crossAxisSpacing: 5,
            childAspectRatio: aspectRatio,
          ),
          itemBuilder: (BuildContext context, int index) {
            return CardWidgetInkwell(
              title: _lecCard[index].title,
              description: _lecCard[index].description,
              lecData: _lecCard[index].lecData,
              sizeText: crossAxisCount == 3 ? SizeObj.small : SizeObj.medium,
            );
          },
        ),
      ),
      const SizedBox(height: 60),
    ],
  );
}
