import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final options = [
    "AC",
    "%",
    "*",
    "/",
    "7",
    "8",
    "9",
    "-",
    "4",
    "5",
    "6",
    "+",
    "1",
    "2",
    "3",
    "=",
    "0",
    "."
  ];

  var operation = "";
  var result = 0.0;
  var a;
  var b;
  var currentOp;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        top: true,
        bottom: true,
        child: Column(
          children: [
            Expanded(
              flex: 2,
              child: Container(
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: Padding(
                    padding:
                        const EdgeInsets.only(right: 24, bottom: 36, left: 24),
                    child: Text(
                      operation,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 50,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
                flex: 4,
                child: StaggeredGridView.countBuilder(
                  padding: EdgeInsets.zero,
                  crossAxisCount: 4,
                  itemCount: 18,
                  itemBuilder: (BuildContext context, int index) =>
                      GestureDetector(
                    onTap: () {
                      final op = options[index];
                      operation += options[index];

                      if (a != null && b != null && currentOp != null) {
                        if (currentOp == "+") {
                          result = a + b;
                        } else if (currentOp == "-") {
                          result = a - b;
                        } else if (currentOp == "/") {
                          result = a / b;
                        } else if (currentOp == "%") {
                          result = a % b;
                        } else if (currentOp == "*") {
                          result = a * b;
                        }
                        a = result;
                        b = null;
                      }

                      switch (op) {
                        case "AC":
                          {
                            a = null;
                            b = null;
                            result = 0.0;
                            operation = "";
                            break;
                          }
                        case "+":
                          {
                            currentOp = op;
                            break;
                          }
                        case "-":
                          {
                            currentOp = op;
                            break;
                          }
                        case "*":
                          {
                            currentOp = op;
                            break;
                          }
                        case "/":
                          {
                            currentOp = op;
                            break;
                          }
                        case "=":
                          {
                            operation = result.toString();
                            break;
                          }
                        default:
                          {
                            if (a == null) {
                              a = double.parse(op);
                            } else {
                              b = double.parse(op);
                            }
                          }
                      }
                      // final op = options[index];

                      // if (op == "=") {
                      //   final items = operation.split("");
                      //   var number = 0.0;
                      //   //0 1 2 3 4
                      //   //1 + 2 + 4 - Size(5)
                      //   //3+4 - Size(3)
                      //   //7 - Size(1)
                      //   for (var i = 0; i + 1 < items.length / 3; i++) {
                      //     final a = i % 2 == 0 ? (i + 1) : (i + 2);
                      //     switch (items[a]) {
                      //       case '%':
                      //         {
                      //           number += double.parse(items[i]) %
                      //               double.parse(items[i + 2]);
                      //         }
                      //         break;
                      //       case '÷':
                      //         {
                      //           number += double.parse(items[i]) /
                      //               double.parse(items[i + 2]);
                      //         }
                      //         break;
                      //       case '*':
                      //         {
                      //           number += double.parse(items[i]) *
                      //               double.parse(items[i + 2]);
                      //         }
                      //         break;
                      //       case '+':
                      //         {
                      //           number += double.parse(items[i]) +
                      //               double.parse(items[i + 2]);
                      //         }
                      //         break;
                      //       case '-':
                      //         {
                      //           number += double.parse(items[i]) -
                      //               double.parse(items[i + 2]);
                      //         }
                      //         break;
                      //       default:
                      //         {
                      //           number += 0.0;
                      //         }
                      //     }
                      //   }
                      //   operation = number.toString();
                      // } else if (op == "AC") {
                      //   operation = "";
                      // } else {
                      //   operation += options[index];
                      // }

                      setState(() {});
                    },
                    child: Container(
                        color:
                            index == 15 ? Color(0xFFF57C00) : Color(0xFF212121),
                        child: Center(
                          child: Text(
                            options[index],
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 28),
                          ),
                        )),
                  ),
                  staggeredTileBuilder: (int index) {
                    if (index == 15) {
                      return StaggeredTile.count(1, 2);
                    } else if (index == 16) {
                      return StaggeredTile.count(2, 1);
                    } else {
                      return StaggeredTile.count(1, 1);
                    }
                  },
                  mainAxisSpacing: 4.0,
                  crossAxisSpacing: 4.0,
                )),
          ],
        ),
      ),
    );
  }
}
