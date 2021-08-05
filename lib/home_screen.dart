import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // var red = #f42e2a
  // var grey = #2d3541
  // var whitish = #c4ebe8
  // https://imagecolorpicker.com/en amazing website, it shows complimentary colors

  num numberOnScreen = 0;
  num numberInMemory = 0;
  String operation = "";

  @override
  Widget build(BuildContext context) {
    // var unitCell = MediaQuery.of(context).size.width / 4;
    return Scaffold(
      backgroundColor: Color(0xff191a1a),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Spacer(),
            Center(
                child: Text(
              "CALCULATOR",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold),
            )),
            Spacer(),
            Row(
              children: [
                Expanded(child: ResultScreen(value: "$numberOnScreen")),
                ClearSquareButton(operationSign: "c"),
              ],
            ),
            Row(
              children: [
                NumberSquareButton(number: 1),
                NumberSquareButton(number: 2),
                NumberSquareButton(number: 3),
                OperationSquareButton(
                  operationSign: "+",
                )
              ],
            ),
            Row(
              children: [
                NumberSquareButton(number: 4),
                NumberSquareButton(number: 5),
                NumberSquareButton(number: 6),
                OperationSquareButton(
                  operationSign: "-",
                )
              ],
            ),
            Row(
              children: [
                NumberSquareButton(number: 7),
                NumberSquareButton(number: 8),
                NumberSquareButton(number: 9),
                OperationSquareButton(
                  operationSign: "*",
                )
              ],
            ),
            Row(
              children: [
                OperationSquareButton(
                  operationSign: "/",
                ),
                NumberSquareButton(number: 0),
                OperationSquareButton(
                  operationSign: ".",
                ),
                OperationSquareButton(
                  operationSign: "=",
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  void reset() {
    numberInMemory = 0;
    numberOnScreen = 0;
    operation = "";
  }

  num addNumbers(num x, num y) {
    return x + y;
  }

  num subtractNumbers(num x, num y) {
    return x + y;
  }

  num divideNumbers(num x, num y) {
    return x / y;
  }

  num multiplyNumbers(num x, num y) {
    return x * y;
  }

  void setOperation(String v) {
    setState(() {
      operation = v;
    });
  }

  void calculate() {
    switch (operation) {
      case "+":
        setState(() {
          numberOnScreen = numberOnScreen + numberInMemory;
        });
        break;

      case "-":
        setState(() {
          numberOnScreen = numberOnScreen - numberInMemory;
        });
        break;

      case "/":
        setState(() {
          numberOnScreen = numberInMemory / numberOnScreen;
        });
        break;

      case "*":
        setState(() {
          numberOnScreen = numberOnScreen * numberInMemory;
        });
        break;

      default:
      // may show toast
    }
  }
}

class NumberSquareButton extends StatelessWidget {
  final num number;
  const NumberSquareButton({Key? key, required this.number}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var unitCell = (MediaQuery.of(context).size.width / 4) - 4;
    return Container(
        color: Color(0xff2d3541),
        margin: EdgeInsets.all(2),
        width: unitCell,
        height: unitCell,
        child: Center(
            child: Text(
          "$number",
          style: TextStyle(color: Color(0xffc4ebe8)),
        )));
  }
}

class OperationSquareButton extends StatelessWidget {
  final String operationSign;
  const OperationSquareButton({Key? key, required this.operationSign})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var unitCell = (MediaQuery.of(context).size.width / 4) - 4;
    return Container(
        color: Color(0xff2d3541),
        margin: EdgeInsets.all(2),
        width: unitCell,
        height: unitCell,
        child: Center(
            child: Text(
          operationSign,
          style: TextStyle(color: Color(0xffc4ebe8)),
        )));
  }
}

class ClearSquareButton extends StatelessWidget {
  final String operationSign;
  const ClearSquareButton({Key? key, required this.operationSign})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var unitCell = (MediaQuery.of(context).size.width / 4) - 4;
    return Container(
        color: Color(0xfff42e2a),
        margin: EdgeInsets.fromLTRB(2, 0, 2, 4),
        width: unitCell,
        height: unitCell,
        child: Center(
            child: Text(
          operationSign,
          style: TextStyle(color: Color(0xffc4ebe8), fontSize: 22),
        )));
  }
}

class ResultScreen extends StatelessWidget {
  final String value;
  const ResultScreen({
    Key? key,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var unitCell = (MediaQuery.of(context).size.width / 4);

    return Container(
        color: Color(0xff2d3541),
        margin: EdgeInsets.fromLTRB(2, 0, 2, 4),
        // width: unitCellWidth,
        height: unitCell,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                value,
                style: TextStyle(color: Color(0xffc4ebe8), fontSize: 22),
              ),
            )
          ],
        ));
  }
}
