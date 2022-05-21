import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class TodoList extends StatefulWidget {
  const TodoList({Key? key}) : super(key: key);

  @override
  State<TodoList> createState() => _TodoListState();

}

class _TodoListState extends State<TodoList> {

  String _inputText = '';
  List todoList = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Список дел'),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: _menuOpen,
              icon: Icon(Icons.menu))
        ],
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('todoList'). snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
          while (!snapshot.hasData) {
            EasyLoading.show();
            return Text('');
          };
          EasyLoading.dismiss();
          return ListView.builder(
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (BuildContext context, int index){
                return Dismissible(
                  key: Key(snapshot.data!.docs[index].id),
                  child: Card(
                    child: ListTile(
                        title: Text(snapshot.data!.docs[index].get('item')),
                        trailing: IconButton(
                          icon: Icon(Icons.delete),
                          color: Colors.blue,
                          onPressed: (){
                            FirebaseFirestore.instance.collection('todoList').doc(snapshot.data!.docs[index].id).delete();
                          },
                        )
                    ),
                  ),
                  onDismissed: (direction){
                    //if (direction == DismissDirection.endToStart)
                    FirebaseFirestore.instance.collection('todoList').doc(snapshot.data!.docs[index].id).delete();
                  },
                );
              }
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          showDialog(context: (context), builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Новое задание'),
              content: TextField(
                onChanged: (String value){
                  _inputText=value;
                },
              ),
              actions: [
                ElevatedButton(onPressed: (){
                  FirebaseFirestore.instance.collection('todoList').add({'item': _inputText});
                  Navigator.of(context).pop();
                }, child: Text('Добавить')),
                ElevatedButton(onPressed: (){Navigator.of(context).pop();},
                    child: Text('Отмена'))
              ],
            );
          });
        },
        child: Icon(Icons.add,),
      ),
    );
  }

  void _menuOpen() {
    Navigator.of(context).push(
        MaterialPageRoute(builder: (BuildContext context) {
          return Scaffold(
              appBar: AppBar(title: Text('Меню'),),
              body: Row(
                children: [
                  ElevatedButton(onPressed: (){
                    Navigator.pop(context);
                    Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
                  }, child: Text('На главную'),),
                  Padding(padding: EdgeInsets.only(left: 15)),
                  Text('Простое меню')
                ],
              )
          );
        })
    );
  }
}
