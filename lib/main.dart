import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main(){
runApp(new MyApp());
}

class RandomEnglish extends StatefulWidget {
  @override
  _RandomEnglishState createState() => _RandomEnglishState();
}

class _RandomEnglishState extends State<RandomEnglish> {
  @override
  Widget build(BuildContext context) {
    final wordPair = new WordPair.random();

    return new Text(
      wordPair.asUpperCase,
      style: new TextStyle(fontSize: 22.0)
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    return new MaterialApp(
      title: "This is my first Flutter app",
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text("This is Header'title"),
        ),
        body: new Center(
          child: new RandomEnglish()
        ),
      ) ,

      debugShowCheckedModeBanner: false, //Bo icon debug tren header
    );
  }
}
