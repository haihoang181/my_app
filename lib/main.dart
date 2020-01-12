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
  final _words= <WordPair>[];
  final _checkedWords = new Set<WordPair>();
  @override
  Widget build(BuildContext context) {
    // final _words = new WordPair.random();

    // //The Text
    // return new Text(
    //   wordPair.asUpperCase,
    //   style: new TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold  )
    // );

    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Lish of English words"),
      ),
      body: new ListView.builder( itemBuilder: ( context, index) { 
        if (index>=_words.length) {
            _words.addAll(generateWordPairs().take(10));
        }
        return _buildRow(_words[index],index);
       },), 

    );
  }

  Widget _buildRow(WordPair wordPair, int index){
   final texColor = index % 2 ==0 ? Colors.red : Colors.blue;
   final ischecked = _checkedWords.contains(wordPair);
   
    return ListTile(
      leading: new Icon(
        ischecked ? Icons.check_box: Icons.check_box_outline_blank,
        color: texColor,
      ),
      title: new Text(
        wordPair.asUpperCase,
        style: new TextStyle(fontSize: 18.0, color:texColor)
      ),
      onTap: (){
        setState(() {
          if (ischecked){
            _checkedWords.remove(wordPair);
          }
          else{
            _checkedWords.add(wordPair );
          }
        });

      },
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    return new MaterialApp(
      title: "This is my first Flutter app",
      home: new RandomEnglish(),

      debugShowCheckedModeBanner: false //Bo icon debug tren header
    );
  }
}
