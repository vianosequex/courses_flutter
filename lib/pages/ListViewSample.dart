import 'dart:math';

import 'package:flutter/material.dart';

class MyListViewBody extends StatefulWidget {

  @override
  State<MyListViewBody> createState() => _MyListViewBodyState();
}

class _MyListViewBodyState extends State<MyListViewBody> {

  List<int> _array = [];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 64,
        itemBuilder: (context, i) {
      if (i >= _array.length) _array.addAll([(pow(2, i)).toInt()]);
      if (i <= 62) return ListTile(title: Text('2 ^ $i = ${_array[i]}'));
        else return ListTile(title: Text('2 ^ $i = слишком много :('));
    });
  }
}

class ListViewSample extends StatelessWidget {

  /*List<Widget> myList=[
    Text(('Line 1')),
    Divider(),
    Text(('Hello')),
    Divider(),
    Text(('Holli')),
    Divider()];*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ListView Sample'),
        centerTitle: true,
      ),
      body: Center(
        child: MyListViewBody(),
      ),
    );
  }
}
