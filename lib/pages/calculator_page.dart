import "package:flutter/material.dart";
import "package:math_expressions/math_expressions.dart";

class CalculatorPage extends StatefulWidget {
  const CalculatorPage({Key? key}) : super(key: key);

  @override
  State<CalculatorPage> createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {

  String equation = "0";
  String result = "0";
  String expression = "";

  void doCalculations(String btnTxt){
    setState(() {
      if (btnTxt == "C") {
        equation = '0';
        result = "0";
      } else if (btnTxt == "⌫") {
        equation = equation.substring(0, equation.length - 1);
        if (equation == "") {
          equation = "0";
        }
      } else if (btnTxt == "=") {

        expression = equation;
        expression = expression.replaceAll('x', "*");
        expression = expression.replaceAll('÷', "/");

        try{
          Parser p = Parser();
          Expression exp = p.parse(expression);

          ContextModel cm = ContextModel();
          result = '${exp.evaluate(EvaluationType.REAL, cm)}';
          equation = result;
        } catch(e) {
          result = "Error";
        }

      } else {
        if (equation == '0') {
          equation = btnTxt;
        }
        equation = equation + btnTxt;
      }

    });

  }

  Widget createCalculatorButton(String btnTxt, Color btnColor) {

    return Container(
      height: 60.0,
      width: 91.0,
      margin: const EdgeInsets.fromLTRB(0.0, 0.0, 10.0, 0.0),
      child: TextButton(
        onPressed: () {
          doCalculations(btnTxt);
        },
        style: ButtonStyle(
            backgroundColor: MaterialStatePropertyAll<Color>(btnColor)
        ),
        child: Text(
          btnTxt,
          textAlign: TextAlign.center,
          style: const TextStyle(
              fontSize: 30.0,
              color: Colors.white
          ),
        ),
      ),
    );

  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              margin: const EdgeInsets.fromLTRB(0.0, 0.0, 20.0, 10.0),
              child: Text(
                equation,
                style: const TextStyle(
                    fontSize: 50.0
                ),
              ),
            )
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              margin: const EdgeInsets.fromLTRB(0.0, 0.0, 20.0, 10.0),
              child: Text(
                result,
                style: const TextStyle(
                  fontSize: 70.0
                ),
              ),
            )
          ],
        ),
        Container(
          margin: const EdgeInsets.fromLTRB(5.0, 0.0, 0.0, 5.0),
          child: Row(
            children: [
              createCalculatorButton("C", Colors.redAccent),
              createCalculatorButton('⌫', Colors.blue),
              createCalculatorButton("%", Colors.orange),
              createCalculatorButton('÷', Colors.orange)
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.fromLTRB(5.0, 0.0, 0.0, 5.0),
          child: Row(
            children: [
              createCalculatorButton("7", Colors.grey),
              createCalculatorButton('8', Colors.grey),
              createCalculatorButton('9', Colors.grey),
              createCalculatorButton('x', Colors.orange)
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.fromLTRB(5.0, 0.0, 0.0, 5.0),
          child: Row(
            children: [
              createCalculatorButton("4", Colors.grey),
              createCalculatorButton('5', Colors.grey),
              createCalculatorButton('6', Colors.grey),
              createCalculatorButton('-', Colors.orange)
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.fromLTRB(5.0, 0.0, 0.0, 5.0),
          child: Row(
            children: [
              createCalculatorButton("1", Colors.grey),
              createCalculatorButton('2', Colors.grey),
              createCalculatorButton('3', Colors.grey),
              createCalculatorButton('+', Colors.orange)
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.fromLTRB(5.0, 0.0, 0.0, 5.0),
          child: Row(
            children: [
              createCalculatorButton("+/-", Colors.grey),
              createCalculatorButton('0', Colors.grey),
              createCalculatorButton('.', Colors.grey),
              createCalculatorButton('=', Colors.orange)
            ],
          ),
        )
      ],
    );
  }

}
