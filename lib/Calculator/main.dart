import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:math_expressions/math_expressions.dart';
import 'package:calculator/Calculator/Widgets/CalcButton.dart';

void main() {
  runApp(const CalcApp());
}

class CalcApp extends StatefulWidget {
  const CalcApp({super.key});

  @override
  State<CalcApp> createState() => _CalcAppState();
}

class _CalcAppState extends State<CalcApp> {
  String history = 'empty';
  String expression = '0';
  bool equalPressed = false;

  void allClear(String text) {
    setState(() {
      history = 'empty';
      expression = '0';
    });
  }

  void clear(String text) {
    setState(() {
      expression = '0';
    });
  }

  void evaluate(String text) {
    equalPressed = true;
    Parser p = Parser();
    Expression exp = p.parse(expression);
    ContextModel cm = ContextModel();
    setState(() {
      history = expression;
      expression = exp.evaluate(EvaluationType.REAL, cm).toString();
      history += " = $expression";
    });
  }

  void numClick(String text) {
    setState(() {
      if (expression == '0' || equalPressed) {
        expression = text;
        equalPressed = false;
      } else {
        expression += text;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "JC-Calculator",
      home: Scaffold(
        appBar: AppBar(
          title: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text(
              "Calculator",
              style: GoogleFonts.rubik(
                fontSize: 25,
              ),
            ),
          ),
          foregroundColor: Colors.white,
          backgroundColor: const Color.fromARGB(255, 22, 20, 53),
        ),
        backgroundColor: const Color.fromARGB(255, 22, 20, 53),
        body: Container(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              // ignore: avoid_unnecessary_containers
              Container(
                alignment: const Alignment(1.0, 1.0),
                child: Padding(
                  padding: const EdgeInsets.only(
                    right: 12.0,
                  ),
                  child: Text(
                    history,
                    style: GoogleFonts.rubik(
                      textStyle: const TextStyle(
                        color: Color.fromARGB(255, 142, 94, 231),
                        fontSize: 24.0,
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                alignment: const Alignment(1.0, 1.0),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: (Text(
                    expression,
                    style: GoogleFonts.rubik(
                      textStyle: const TextStyle(
                        fontSize: 48,
                        color: Colors.white,
                      ),
                    ),
                  )),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CalcButton(
                    text: "AC",
                    callback: allClear,
                    textSize: 20,
                    bgcolor: const Color.fromARGB(255, 31, 133, 173),
                  ),
                  CalcButton(
                    text: "C",
                    callback: clear,
                    textSize: 20,
                    bgcolor: const Color.fromARGB(255, 182, 57, 84),
                  ),
                  CalcButton(
                    text: "%",
                    callback: numClick,
                    textSize: 20,
                  ),
                  CalcButton(
                    text: "/",
                    callback: numClick,
                    textSize: 20,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CalcButton(
                    text: "7",
                    callback: numClick,
                    textSize: 20,
                  ),
                  CalcButton(
                    text: "8",
                    callback: numClick,
                    textSize: 20,
                  ),
                  CalcButton(
                    text: "9",
                    callback: numClick,
                    textSize: 20,
                  ),
                  CalcButton(
                    text: "x",
                    callback: numClick,
                    textSize: 20,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CalcButton(
                    text: "4",
                    callback: numClick,
                    textSize: 20,
                  ),
                  CalcButton(
                    text: "5",
                    callback: numClick,
                    textSize: 20,
                  ),
                  CalcButton(
                    text: "6",
                    callback: numClick,
                    textSize: 20,
                  ),
                  CalcButton(
                    text: "-",
                    callback: numClick,
                    textSize: 20,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CalcButton(
                    text: "1",
                    callback: numClick,
                    textSize: 20,
                  ),
                  CalcButton(
                    text: "2",
                    callback: numClick,
                    textSize: 20,
                  ),
                  CalcButton(
                    text: "3",
                    callback: numClick,
                    textSize: 20,
                  ),
                  CalcButton(
                    text: "+",
                    callback: numClick,
                    textSize: 20,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CalcButton(
                    text: ".",
                    callback: numClick,
                    textSize: 20,
                  ),
                  CalcButton(
                    text: "0",
                    callback: numClick,
                    textSize: 20,
                  ),
                  CalcButton(
                    text: "00",
                    callback: numClick,
                    textSize: 20,
                  ),
                  CalcButton(
                    text: "=",
                    callback: evaluate,
                    textSize: 20,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
