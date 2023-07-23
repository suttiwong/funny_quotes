import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const FunnyQuotesApp());
}

class FunnyQuotesApp extends StatelessWidget {
  const FunnyQuotesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //var quote = 'เป็นคนธรรมดา ไม่สะดุดตาใคร ส่วนใหญ่สะดุด โต๊ะ ตู้ เตียง เก้าอี้'; //field , property
  static const List<String> _quoteList = [
    'เศร้าเป็นช่วงๆ แต่ง่วงเป็นประจำ',
    'ทุกการเติบโต ย่อมปวดหลังเสมอ',
    'คนอื่นเอว S ส่วนเรา..เอวเคล็ด ปวดหลังไม่ไหว',
    'สับรางไม่ไหว แต่สับไพ่สู้อยู่',
    'ก้าวแรกโดนใจ ก้าวต่อไปโดนเท'
  ];

  static const List<MaterialColor> _colorList = [Colors.red, Colors.blue, Colors.lime];

  var _quote = _quoteList[0]; //state variable
  var _color = _colorList[0];

  /*List colors = [
    Colors.deepOrange,
    Colors.amber,
    Colors.purpleAccent,
    Colors.pinkAccent
  ];
  Random random = new Random();
  int index = 0;*/

  void _handleClickGo() {
    //classprivate
    var rand = Random();
    /*var randomIndex = rand.nextInt(_quoteList.length);
    var newQuote = _quoteList[randomIndex];*/

    String newQuote;
    do {
      var randomIndex = rand.nextInt(_quoteList.length);
      newQuote = _quoteList[randomIndex];
    } while (newQuote == _quote);

    MaterialColor newColor;
    do {
      var randomIndex = rand.nextInt((_colorList.length));
      newColor = _colorList[randomIndex];
    } while (newColor == _color);

    setState(() {
      //index = random.nextInt(4);
      _quote = newQuote;
      _color = newColor;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('คำคม/แคปชั่นกวนๆ')),
      floatingActionButton: FloatingActionButton(
        onPressed: _handleClickGo,
        child: const Center(
          child: Text(
            'Next Quote',
            textAlign: TextAlign.center,
          ),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            _quote, //positional parameter/argument
            //named parameter/argument
            style: TextStyle(
              color:  _color,
              fontSize: 40,
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
