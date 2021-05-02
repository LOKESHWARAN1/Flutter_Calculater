import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculater'),
      ),
      body: Container(
        child: Column(
          children: [
            Expanded(
              child: Container(
                  padding: EdgeInsets.all(10.0),
                  alignment: Alignment.bottomRight,
                  child: Text(
                    text,
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 60,
                        color: Colors.blueAccent),
                  )),
            ),
            Row(
              children: [
                outlineButton('9'),
                outlineButton('8'),
                outlineButton('7'),
                outlineButton('+'),
              ],
            ),
            Row(
              children: [
                outlineButton('6'),
                outlineButton('5'),
                outlineButton('4'),
                outlineButton('-'),
              ],
            ),
            Row(
              children: [
                outlineButton('3'),
                outlineButton('2'),
                outlineButton('1'),
                outlineButton('x'),
              ],
            ),
            Row(
              children: [
                outlineButton('C'),
                outlineButton('0'),
                outlineButton('='),
                outlineButton('/'),
              ],
            ),
          ],
        ),
      ),
    );
  }

  String text = "", res;
  int first, second;
  String opp;

  Widget outlineButton(String val) {
    // ignore: deprecated_member_use
    return Expanded(
      child: Container(
        // ignore: deprecated_member_use
        child: OutlineButton(
            splashColor: Colors.blueAccent,
            padding: EdgeInsets.all(25.0),
            child: Text(
              val,
              style: TextStyle(fontSize: 25.0),
            ),
            onPressed: () => click(val)),
      ),
    );
  }

  void click(String clickText) {
    if (clickText == 'C') {
      res = "";
      text = "";
      first = 0;
      second = 0;
    } else if (clickText == "+" ||
        clickText == "-" ||
        clickText == "x" ||
        clickText == "/") {
      first = int.parse(text);
      res = "";
      opp = clickText;
    } else if (clickText == '=') {
      second = int.parse(text);
      if (opp == "+") {
        res = (first + second).toString();
      }
      if (opp == "-") {
        res = (first - second).toString();
      }
      if (opp == "x") {
        res = (first * second).toString();
      }
      if (opp == "/") {
        res = (first ~/ second).toString();
      }
    } else {
      res = int.parse(text + clickText).toString();
    }
    setState(() {
      text = res;
    });
  }
}
