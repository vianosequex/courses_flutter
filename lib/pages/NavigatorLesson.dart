import 'dart:ui';

import 'package:flutter/material.dart';

class NavigLesson extends StatelessWidget {
  const NavigLesson({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _scaffoldKey = GlobalKey<ScaffoldState>();

    return Scaffold(
      appBar: AppBar(
        title: Text('Navigator'),
        centerTitle: true,
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: [
              Padding(padding: EdgeInsets.all(10)),
              ElevatedButton(
                onPressed: () {
                  //Navigator.push(context, MaterialPageRoute(builder: (context) => SecondScreen()));
                  Navigator.push(context, PageRouteBuilder(
                    pageBuilder: (context, _, __) => SecondScreen(),
                    transitionsBuilder: (___, animation, ____, child){
                      return FadeTransition(
                        opacity: animation,
                        child: child,
                      );
                    }
                  ));
                },
                child: Text('Второе окно б/маршрута'),),
              Padding(padding: EdgeInsets.all(10)),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/navigation/secondScreen');
                },
                child: Text('Второе окно по маршруту'),),
              Padding(padding: EdgeInsets.all(10)),
              ElevatedButton(
                onPressed: () async {
                  bool value = await Navigator.push(context, PageRouteBuilder(
                    opaque: false,
                    pageBuilder: (context, _, __) => MyPopupScreen(),
                    transitionsBuilder: (___, animation, ____, child){
                      return FadeTransition(
                        opacity: animation,
                        child: ScaleTransition(
                          scale: animation,
                          child: child,
                        ),
                      );
                    }
                  ));
                  if (value) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text('Больше'), backgroundColor: Colors.green,)
                    );// TRUE
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text('Меньше'), backgroundColor: Colors.red,),
                    );
                  }
                },
                child: Text('Popup window'),)
            ],
          )
        ],
      )
    );
  }
}

class SecondScreen extends StatelessWidget {
  const SecondScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Второе окно'),
      ),
      body: Center(
        child: ElevatedButton(
          child: Text('Возврат'),
          onPressed: (){
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}

class MyPopupScreen extends StatelessWidget {
  const MyPopupScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Ответ:'),
      actions: [
        ElevatedButton(
          onPressed: (){
            Navigator.pop(context, true);
          },
          child: Text('Больше'),
        ),
        ElevatedButton(
          onPressed: (){
            Navigator.pop(context, false);
          },
          child: Text('Меньше'),
        )
      ],
    );
  }
}