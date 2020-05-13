import 'package:english_words/english_words.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RandomWordBean extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => Word();
}

class Word extends State<RandomWordBean> {
  final List<WordPair> _lists = List();
  final Set<WordPair> _saves = Set();
  final _big = const TextStyle(fontSize: 18.0);

  @override
  Widget build(BuildContext context) {
    final word = WordPair.random();
    return Scaffold(
      appBar: AppBar(title: Text('list data'), actions: <Widget>[
        IconButton(
          icon: Icon(Icons.list),
          onPressed: _pushSaves,
        )
      ]),
      body: _getData(),
    );
  }

  Widget _getData() {
    return ListView.builder(
        padding: EdgeInsets.all(16.0),
        itemBuilder: (context, i) {
          if (i.isOdd) return Divider();
          final index = i ~/ 2;
          if (index >= _lists.length) {
            _lists.addAll(generateWordPairs().take(10));
          }
          return _setView(_lists[index]);
        });
  }

  Widget _setView(WordPair wordPair) {
    var contains = _saves.contains(wordPair);
    return ListTile(
        title: Text(
          wordPair.asPascalCase,
          style: _big,
        ),
        trailing: Icon(
          contains ? Icons.favorite : Icons.favorite_border,
          color: contains ? Colors.red : null,
        ),
        onTap: () {
          setState(() {
            if (contains)
              _saves.remove(wordPair);
            else
              _saves.add(wordPair);
          });
        });
  }

  void _pushSaves() {
    Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {
      final Iterable<ListTile> listTile = _saves.map((WordPair wordPair) {
        return ListTile(title: Text(wordPair.asPascalCase, style: _big));
      });
      final List<Widget> divided =
          ListTile.divideTiles(context: context, tiles: listTile).toList();
      return Scaffold(
        appBar: AppBar(
          title: Text('Saved Suggestions'),
        ),
        body: ListView(children: divided),
      );
    }));
  }
}
