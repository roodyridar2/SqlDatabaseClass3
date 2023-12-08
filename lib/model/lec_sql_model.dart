import 'package:flutter/material.dart';

class LecSqlModel{
  LecSqlModel(this.title, this.description, this.lecData);
  final String title;
  final String description;
  final List<Widget> lecData;
}