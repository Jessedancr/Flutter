import 'package:flutter/material.dart';
import 'glass_box.dart';
import 'my_button.dart';
import 'package:math_expressions/math_expressions.dart';

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  var userQuestion = '';
  var userAnswer = '';
  bool isOperator(String x) {
    if (x == '/' || x == '*' || x == '-' || x == '+' || x == '%') {
      return true;
    }
    return false;
  }

  List<String> buttons = [
    'AC',
    'C',
    '%',
    '/',
    '7',
    '8',
    '9',
    '*',
    '4',
    '5',
    '6',
    '-',
    '1',
    '2',
    '3',
    '+',
    '0',
    '.',
    '='
  ];

  bool isAC(String x) {
    if (x == 'AC') {
      return true;
    } else {
      return false;
    }
  }

  void allClear() {
    setState(() {
      userQuestion = '';
      userAnswer = '';
    });
  }

  void delete() {
    setState(() {
      userQuestion = userQuestion.substring(0, userQuestion.length - 1);
    });
  }

  /// This function which is called when the equal button is pressed
  /// basically evaluates the user's question.
  void equalPressed() {
    String finalQuestion = userQuestion;
    finalQuestion = finalQuestion.replaceAll('x', '*');
    Parser p = Parser();
    Expression exp = p.parse(finalQuestion);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);
    userAnswer = eval.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text('My Calculator'),
        centerTitle: true,
        elevation: 0.0,
        toolbarHeight: 40.0,
      ),
      body: Center(
        child: Column(
          // Question and answer expanded widget
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: GlassBox(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        padding: EdgeInsets.all(10.0),
                        child: Text(
                          userQuestion,
                          style: TextStyle(fontSize: 20),
                        ),
                        alignment: Alignment.centerLeft,
                      ),
                      Container(
                        padding: EdgeInsets.all(10.0),
                        child: Text(
                          userAnswer,
                          style: TextStyle(fontSize: 20),
                        ),
                        alignment: Alignment.centerRight,
                      ),
                    ],
                  ),
                ),
              ),
            ),

            // Buttons' expanded widget
            Expanded(
              flex: 3,
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  childAspectRatio: 1.2 / 1.2,
                  crossAxisSpacing: 6,
                  mainAxisSpacing: 1.5,
                  mainAxisExtent: 62.0
                ),
                itemCount: buttons.length,
                itemBuilder: (context, index) {
                  if (index == 0 || index == 1) {
                    // Clear and AC buttons
                    return MyButton(
                      splashColor: Colors.grey[400],
                      buttonColor: Colors.grey[600],
                      buttonText: buttons[index],
                      textColor: Colors.white,
                      buttonTapped: isAC(buttons[index]) ? allClear : delete,
                    );
                  }
                  // Equal button
                  else if (index == buttons.length - 1) {
                    return MyButton(
                      splashColor: Colors.grey,
                      buttonTapped: () {
                        setState(() {
                          equalPressed();
                        });
                      },
                      buttonColor: isOperator(buttons[index])
                          ? Colors.orange
                          : Colors.black,
                      buttonText: buttons[index],
                      textColor: Colors.white,
                    );
                  } else {
                    return MyButton(
                      splashColor: isOperator(buttons[index])
                          ? Colors.white
                          : Colors.grey,
                      buttonTapped: () {
                        setState(() {
                          userQuestion += buttons[index];
                        });
                      },
                      buttonColor: isOperator(buttons[index])
                          ? Colors.orange
                          : Colors.black,
                      buttonText: buttons[index],
                      textColor: Colors.white,
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
