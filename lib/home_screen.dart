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

  @override
  Widget build(BuildContext context) {
    // var unitCell = MediaQuery.of(context).size.width / 4;
    return Scaffold(
      backgroundColor: Color(0xff191a1a),
      body: Column(
        children: [SquareButton()],
      ),
    );
  }
}

class SquareButton extends StatelessWidget {
  const SquareButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var unitCell = MediaQuery.of(context).size.width / 4;
    return Container(
      padding: EdgeInsets.all(8),
      width: unitCell,
      height: unitCell,
    );
  }
}
