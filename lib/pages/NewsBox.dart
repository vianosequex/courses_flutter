import 'package:flutter/material.dart';

class NewsBoxFavourite extends StatefulWidget {
  final int _count;
  final bool _like;

  NewsBoxFavourite(this._count, this._like);

  @override
  State<NewsBoxFavourite> createState() => NewsBoxFavouriteState(_count, _like);
}

class NewsBoxFavouriteState extends State<NewsBoxFavourite> {

  int count;
  bool like;

  NewsBoxFavouriteState(this.count, this.like);

  void pressButton() {
    setState(() {
      like = !like;
      like ? count++ : count--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(padding: EdgeInsets.all(5)),
        Text('Избранное \n         $count'),
        IconButton(
            onPressed: () {
              pressButton();
            },
            icon: Icon(
              like ? Icons.favorite : Icons.favorite_border,
              size: 30,
            )),
      ],
    );
  }
}

class NewsBox extends StatelessWidget {
  final String _title;
  final String _text;
  String _imageurl = '';
  int _count = 0;
  bool _like = false;

  NewsBox(this._title, this._text,
      {String imageurl = '', int count = 0, bool like = false}) {
    _imageurl = imageurl;
    _count = count;
    _like = like;
  }

  @override
  Widget build(BuildContext context) {
    if (_imageurl != '')
      return Scaffold(
        appBar: AppBar(
          title: Text('Новости'),
          centerTitle: true,
          actions: [
            IconButton(
                onPressed: (){},//NewsBox._openMenu(),
                icon: Icon(Icons.menu))
          ],
        ),
        body: Container(
            color: Colors.black12,
            height: 100.0,
            child: Row(children: [
              Image.network(
                _imageurl,
                width: 100.0,
                height: 100.0,
                fit: BoxFit.cover,
              ),
              Expanded(
                  child: Container(
                      padding: EdgeInsets.all(5.0),
                      child: Column(children: [
                        Text(_title,
                            style: TextStyle(fontSize: 20.0),
                            overflow: TextOverflow.ellipsis),
                        Expanded(
                            child: Text(
                          _text,
                          softWrap: true,
                          textAlign: TextAlign.justify,
                        ))
                      ]))),
              NewsBoxFavourite(_count, _like),
            ])),
      );
    return Scaffold(
        appBar: AppBar(
          title: Text('Новости'),
          centerTitle: true,
          actions: [
            IconButton(
                onPressed: () {}, //_menuOpen,
                icon: Icon(Icons.menu))
          ],
        ),
        body: Container(
            color: Colors.black12,
            height: 100.0,
            child: Row(children: [
              Expanded(
                  child: Container(
                      padding: EdgeInsets.all(5.0),
                      child: Column(children: [
                        Text(_title,
                            style: TextStyle(fontSize: 20.0),
                            overflow: TextOverflow.ellipsis),
                        Expanded(
                            child: Text(
                          _text,
                          softWrap: true,
                          textAlign: TextAlign.justify,
                        ))
                      ]))),
              NewsBoxFavourite(_count, _like),
            ])));
  }
}
