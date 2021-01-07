import 'package:Google_Sheet_with_Flutter/login/begin.dart';
import 'package:Google_Sheet_with_Flutter/login/login.dart';
import 'package:Google_Sheet_with_Flutter/page2/homepage.dart';
import 'package:Google_Sheet_with_Flutter/page2/note/date.dart';
import 'package:Google_Sheet_with_Flutter/page2/note/dialog.dart';
import 'package:Google_Sheet_with_Flutter/page2/note/userdashboard.dart';
import 'package:Google_Sheet_with_Flutter/page2/noteplan/screen/details_add.dart';
import 'package:Google_Sheet_with_Flutter/page2/noteplan/screen/todos.dart';
import 'package:Google_Sheet_with_Flutter/page2/noteplan/todo/todos_bloc.dart';
import 'package:Google_Sheet_with_Flutter/page2/noteplan/todo/todos_event.dart';
import 'package:flutter/material.dart';
import 'package:Google_Sheet_with_Flutter/page/ListTransactionPage.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'page/AddTransactionPage.dart';
import 'page/ListTransactionPage.dart';

void main() {
  runApp(BlocProvider(                              // --> ครอบด้วย BlocProvider จะได้เรียกใช้งาน bloc ได้
    create: (context) {
      return TodosBloc()..add(LoadTodos());    // --> ทุกครั้งที่เปิดแอป เราก็จะเรียก event LoadTodos
    },
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Google Sheet with Flutter',
      theme: ThemeData(
        primarySwatch: Colors.lightGreen,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: UserDashboard(),
    );
  }
}

