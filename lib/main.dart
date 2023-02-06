import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.black, //<-- SEE HERE
      ),
      home: const Scaffold(
        body: Center(
          child: MyStatefulWidget(),
        ),
      ),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({super.key});

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  bool selected = false;
  double neckWidth = 30;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.fromLTRB(5, 40, 5, 30),
        child: Row(children: [
          Container(
            decoration: BoxDecoration(border: Border.all(color: Colors.white)),
            width: neckWidth,
          ),
          Container(
            decoration: BoxDecoration(border: Border.all(color: Colors.white)),
            width: neckWidth,
          ),
          Container(
            decoration: BoxDecoration(border: Border.all(color: Colors.white)),
            width: neckWidth,
          ),
          Container(
            decoration: BoxDecoration(border: Border.all(color: Colors.white)),
            width: neckWidth,
          ),
          Container(
            decoration: BoxDecoration(border: Border.all(color: Colors.white)),
            width: neckWidth,
          ),
          Container(
            decoration: BoxDecoration(border: Border.all(color: Colors.white)),
            width: neckWidth,
          ),
          SizedBox(width: 15),
          SizedBox(
              width: 185,
              child: Stack(
                children: <Widget>[
                  AnimatedPositioned(
                    top: selected ? 700 : 0,
                    duration: const Duration(milliseconds: 2000),
                    curve: Curves.linear,
                    child: const Text(
                      'A♯ B♭ C♯ D♭ E♯ B♭',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                  AnimatedPositioned(
                    top: 700,
                    left: selected ? 100 : 0,
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.fastOutSlowIn,
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selected = !selected;
                        });
                      },
                      child: Image.asset('assets/spaceship.jpg'),
                    ),
                  ),
                ],
              ))
        ]));
  }
}
