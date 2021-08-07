import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:math_expressions/math_expressions.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    var unitCell = MediaQuery.of(context).size.width / 4;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xff191a1a),
        brightness: Brightness.dark, // status bar brightness
      ),
      backgroundColor: Color(0xff191a1a),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.end,
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: 32),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "CALCULATOR APP",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                SizedBox(height: 32),
                Row(
                  children: [
                    Expanded(
                        child: Container(
                            color: Color(0xff2d3541),
                            margin: EdgeInsets.fromLTRB(2, 0, 2, 4),
                            height: unitCell,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    _expression,
                                    style: TextStyle(
                                        color: Color(0xffc4ebe8), fontSize: 22),
                                  ),
                                )
                              ],
                            ))),
                    ClearSquareButton(operationSign: "c", callback: allClear),
                  ],
                ),
                Row(
                  children: [
                    NumberSquareButton(
                      value: '1',
                      callback: numClick,
                    ),
                    NumberSquareButton(value: '2', callback: numClick),
                    NumberSquareButton(
                      value: '3',
                      callback: numClick,
                    ),
                    OperationSquareButton(
                      operationSign: "+",
                      callback: numClick,
                    )
                  ],
                ),
                Row(
                  children: [
                    NumberSquareButton(
                      value: '4',
                      callback: numClick,
                    ),
                    NumberSquareButton(
                      value: '5',
                      callback: numClick,
                    ),
                    NumberSquareButton(
                      value: '6',
                      callback: numClick,
                    ),
                    OperationSquareButton(
                      operationSign: "-",
                      callback: numClick,
                    )
                  ],
                ),
                Row(
                  children: [
                    NumberSquareButton(
                      value: "7",
                      callback: numClick,
                    ),
                    NumberSquareButton(
                      value: "8",
                      callback: numClick,
                    ),
                    NumberSquareButton(
                      value: "9",
                      callback: numClick,
                    ),
                    OperationSquareButton(
                      operationSign: "*",
                      callback: numClick,
                    )
                  ],
                ),
                Row(
                  children: [
                    OperationSquareButton(
                      operationSign: "/",
                      callback: numClick,
                    ),
                    NumberSquareButton(value: "0", callback: numClick),
                    OperationSquareButton(
                      operationSign: ".",
                      callback: numClick,
                    ),
                    OperationSquareButton(
                      operationSign: "=",
                      callback: evaluate,
                    )
                  ],
                ),
                SizedBox(height: 32),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Developed by Bukunmi",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  String _expression = '';

  void numClick(String text) {
    setState(() {
      _expression += text;
    });
  }

  void allClear(String text) {
    setState(() {
      _expression = '';
    });
  }

  void evaluate(String text) {
    Parser p = Parser();
    Expression exp = p.parse(_expression);
    ContextModel cm = ContextModel();

    setState(() {
      _expression = exp.evaluate(EvaluationType.REAL, cm).toString();
    });
  }
}

class NumberSquareButton extends StatelessWidget {
  final String value;
  final Function callback;
  const NumberSquareButton(
      {Key? key, required this.value, required this.callback})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var unitCell = (MediaQuery.of(context).size.width / 4) - 4;
    return GestureDetector(
      onTap: () {
        callback(value);
      },
      child: Container(
          color: Color(0xff2d3541),
          margin: EdgeInsets.all(2),
          width: unitCell,
          height: unitCell,
          child: Center(
              child: Text(
            value,
            style: TextStyle(color: Color(0xffc4ebe8)),
          ))),
    );
  }
}

class OperationSquareButton extends StatelessWidget {
  final String operationSign;
  final Function callback;
  const OperationSquareButton(
      {Key? key, required this.operationSign, required this.callback})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var unitCell = (MediaQuery.of(context).size.width / 4) - 4;
    return GestureDetector(
      onTap: () {
        callback(operationSign);
      },
      child: Container(
          color: Color(0xff2d3541),
          margin: EdgeInsets.all(2),
          width: unitCell,
          height: unitCell,
          child: Center(
              child: Text(
            operationSign,
            style: TextStyle(color: Color(0xffc4ebe8)),
          ))),
    );
  }
}

class ClearSquareButton extends StatelessWidget {
  final String operationSign;
  final Function callback;
  const ClearSquareButton(
      {Key? key, required this.operationSign, required this.callback})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var unitCell = (MediaQuery.of(context).size.width / 4) - 4;
    return GestureDetector(
      onTap: () {
        callback(operationSign);
      },
      child: Container(
          color: Color(0xfff42e2a),
          margin: EdgeInsets.fromLTRB(2, 0, 2, 4),
          width: unitCell,
          height: unitCell,
          child: Center(
              child: Text(
            operationSign,
            style: TextStyle(color: Color(0xffc4ebe8), fontSize: 22),
          ))),
    );
  }
}
