import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Code Samples'),
        centerTitle: true,
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: [
              Padding(padding: EdgeInsets.only(top: 10)),
              Text('Главный экран', style: TextStyle(fontSize: 20),),
              Padding(padding: EdgeInsets.only(top: 10)),
              ElevatedButton(onPressed: (){
                Navigator.pushReplacementNamed(context, '/todo');
              }, child: Text('Todo List App')),
              ElevatedButton(onPressed: (){
                Navigator.pushNamed(context, '/newsBox');
              }, child: Text('NewsBox App')),
              ElevatedButton(onPressed: (){
                Navigator.pushNamed(context, '/listview');
              }, child: Text('ListView Sample')),
              ElevatedButton(onPressed: (){
                Navigator.pushNamed(context, '/forms');
              }, child: Text('Forms Sample')),
              ElevatedButton(onPressed: (){
                Navigator.pushNamed(context, '/navigation');
              }, child: Text('Navigator Sample')),
              ElevatedButton(onPressed: (){
                Navigator.pushNamed(context, '/asyncSample');
              }, child: Text('Async Sample')),
              ElevatedButton(onPressed: (){
                Navigator.pushNamed(context, '/httpSample');
              }, child: Text('HTTP Sample')),
            ],
          ),
        ],
      )
      );
  }
}