import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'pages/AsyncSample.dart';
import 'pages/NavigatorLesson.dart';
import 'pages/NewsBox.dart';
import 'pages/MainScreen.dart';
import 'pages/Forms.dart';
import 'pages/ListViewSample.dart';
import 'pages/TodoList.dart';
import 'pages/httpSample.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      primaryColor: Colors.amber,
    ),
    builder: EasyLoading.init(),
    initialRoute: '/',
    routes: {
      '/': (context) => MainScreen(),
      '/todo': (context) => TodoList(),
      '/newsBox': (context) => NewsBox('Новый урок по Flutter', '''В новом уроке рассказывается в каких случаях применять класс StatelessWidget и StatefulWidget. Приведены примеры их использования.''',
        imageurl: 'https://cdn4.iconfinder.com/data/icons/logos-brands-5/24/flutter-512.png',
        like: true,
        count: 50,),
      '/listview': (context) => ListViewSample(),
      '/forms': (context) =>  MyFormSample(),
      '/navigation': (context) =>  NavigLesson(),
      '/asyncSample': (context) => AsyncSample(),
      '/httpSample': (context) => httpSample(),
    },
  ));
}

