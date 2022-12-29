import 'package:flutter/material.dart';
import 'package:newsapp/pages/start/loading.dart';
import 'package:newsapp/pages/start/base.dart';

Widget getStartWidget(bool isLoading) {
  if (!isLoading) {
    return const Base();
  }
  return const Loading();
}
