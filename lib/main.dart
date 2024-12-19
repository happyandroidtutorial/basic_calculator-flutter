import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Calculator',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Calculator(),
    );
  }
}

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  String output = '0';
  String _output = '0';
  double num1 = 0;
  double num2 = 0;
  String operand = '';

// method to set velue to calculate
  void btnPressed(String btnText) {
    if (btnText == 'C') {
      String output = '0';
      String _output = '0';
      double num1 = 0;
      double num2 = 0;
      String operand = '';
    } else if (btnText == '+' ||
        btnText == '-' ||
        btnText == '*' ||
        btnText == '/') {
      num1 = double.parse(output);
      operand = btnText;
      _output = '0';
    } else if (btnText == '=') {
      num2 = double.parse(output);

      switch (operand) {
        case '+':
          _output = (num1 + num2).toString();
          break;
        case '-':
          _output = (num1 - num2).toString();
          break;
        case '*':
          _output = (num1 * num2).toString();
          break;
        case '/':
          _output = (num1 / num2).toString();
          break;
      }
      num1 = 0;
      num2 = 0;
      operand = '';
    } else {
      _output += btnText;
    }
// update the state
    setState(() {
      output = double.parse(_output)
          .toStringAsFixed(2)
          .replaceAll(RegExp(r'\.00$'), '');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        title: Text(
          'Calculator',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.grey[850],
      ),
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: Container(
              alignment: Alignment.centerRight,
              padding: EdgeInsets.symmetric(vertical: 24, horizontal: 15),
              child: Text(
                output,
                style: TextStyle(fontSize: 30, color: Colors.white),
              ),
            ),
          ),
          const Expanded(
              flex: 1,
              child: Divider(
                color: Colors.grey,
              )),
          Expanded(
            flex: 7,
            child: Column(
              children: [
                Row(
                  children: [
                    buildButton('7', Colors.grey[800]!),
                    buildButton('8', Colors.grey[800]!),
                    buildButton('9', Colors.grey[800]!),
                    buildButton('/', Colors.orange),
                  ],
                ),
                Row(
                  children: [
                    buildButton('4', Colors.grey[800]!),
                    buildButton('5', Colors.grey[800]!),
                    buildButton('6', Colors.grey[800]!),
                    buildButton('*', Colors.orange),
                  ],
                ),
                Row(
                  children: [
                    buildButton('1', Colors.grey[800]!),
                    buildButton('2', Colors.grey[800]!),
                    buildButton('3', Colors.grey[800]!),
                    buildButton('-', Colors.orange),
                  ],
                ),
                Row(
                  children: [
                    buildButton('.', Colors.grey[800]!),
                    buildButton('0', Colors.grey[800]!),
                    buildButton('C', Colors.grey[800]!),
                    buildButton('+', Colors.orange),
                  ],
                ),
                Row(
                  children: [
                    buildButton('=', Colors.green),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

// reuse able btn wiidget
  Widget buildButton(String btnText, Color btnColor) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.all(8),
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                padding: EdgeInsets.all(22),
                backgroundColor: btnColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8))),
            onPressed: () {
              btnPressed(btnText);
            },
            child: Text(
              btnText,
              style: TextStyle(fontSize: 22, color: Colors.white),
            )),
      ),
    );
  }
}
