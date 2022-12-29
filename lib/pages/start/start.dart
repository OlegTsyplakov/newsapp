import 'package:flutter/material.dart';
import 'package:newsapp/widgets/get_start_widget.dart';

class Start extends StatefulWidget {
  const Start({super.key});

  @override
  State<Start> createState() => _StartState();
}

class _StartState extends State<Start> {
  bool _isLoading = true;
  @override
  void initState() {
    checkLoading();
    super.initState();
  }

  void checkLoading() async {
    _isLoading = false;
// тут должна быть первоначальная настройка и проверка приложения
  }

  @override
  Widget build(BuildContext context) {
    return Center(child: getStartWidget(_isLoading));
  }
}
