import 'dart:ui';

import 'package:flutter/material.dart';

enum GenderList {male, female}

class MyForm extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => MyFormState();
}

class MyFormState extends State {

  final _formKey = GlobalKey<FormState>();
  GenderList? _gender = null;
  bool _agreement = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child:
        Form(
          key: _formKey,
          child: Column(
            children: [
              Text('Имя пользователя:', style: TextStyle(fontSize: 20),),
              TextFormField(validator: (value) {
                if (value!.isEmpty) return 'Введите имя пользователя';
              },),
              Padding(padding: EdgeInsets.all(10)),
              Text('E-mail:', style: TextStyle(fontSize: 20),),
              TextFormField(validator: (value) {
                if (value!.isEmpty) return 'Введите E-mail';

                bool validEmail = RegExp(
                    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$').hasMatch(value);
                if (!validEmail) return 'Это не E-mail';

              },),

              Padding(padding: EdgeInsets.all(10)),
              Text('Ваш пол:', style: TextStyle(fontSize: 20),),
              RadioListTile(
                title: Text('Мужской'),
                value: GenderList.male,
                groupValue: _gender,
                onChanged: (value) {
                  setState(() {
                    _gender = value as GenderList?;
                 });
              },),

              RadioListTile(
                title: Text('Женский'),
                value: GenderList.female,
                groupValue: _gender,
                onChanged: (value) {
                  setState(() {
                    _gender = value as GenderList?;
                  });
                },),

              Padding(padding: EdgeInsets.all(10)),

              CheckboxListTile(
                title: Text ('Ознакомлен (a)'),
                value: _agreement,
                onChanged: (value) {
                  setState(() {
                    _agreement = value as bool;
                  });
                }
              ),

              Padding(padding: EdgeInsets.all(10)),

              ElevatedButton(onPressed: (){
                if (_formKey.currentState!.validate()){
                  Color color = Colors.red;
                  String text;

                if (_gender == null) text = 'Выберите пол';
                else if (!_agreement) text = 'Необходимо принять условия соглашения';
                else {
                    color = Colors.green;
                    text = 'Форма заполнена верно';
                }

                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text('$text', textAlign: TextAlign.center,), backgroundColor: color,
                  ));
                }
              }, child: Text ('Проверить'),),
            ],
          ),
        )
    );
  }
}

class MyFormSample extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Forms Sample'),
        centerTitle: true,
      ),
      body: Center(
        child: MyForm(),
      ),
    );
  }
}