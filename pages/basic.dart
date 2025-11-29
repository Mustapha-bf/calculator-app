import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:math_expressions/math_expressions.dart';


class Basic extends StatefulWidget {
  const Basic({super.key});

  @override
  State<Basic> createState() => _BasicState();
}


class _BasicState extends State<Basic> {

  String input = "";

bool isOperator(String char) {
  return ['+', '-', '×', '÷'].contains(char);
}

  void addInput(String value) {
    setState(() {
      if (input.isEmpty && (isOperator(value)|| value == '0' )) {
      // Don't allow starting with an operator
        return;
      }

      if (input.isNotEmpty) {
        String lastChar = input[input.length - 1];

        if (isOperator(lastChar) && isOperator(value)) {
          // Don't allow two operators in a row (by making dynamic change)
          input = input.substring(0, input.length - 1) + value;
          return;
        }
      }

      input += value;
    });
  }

  void clear() {
    setState(() {
      input = "";
    });
  }

  void calcualteResult() {
    setState(() {
    try {
      Parser p = Parser();
      Expression exp = p.parse(
        input.replaceAll('×', '*').replaceAll('÷', '/').replaceAll('%', '/100')
      );

      ContextModel cm = ContextModel();
      double eval = exp.evaluate(EvaluationType.REAL, cm);
      input = eval.toString();
    } catch (e) {
      input = ""; // fallback in case of error
    }
  });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar (
          backgroundColor: Colors.black,
          leading: IconButton(
            onPressed: () {},
            icon: Icon(Icons.menu, size: 40, color: const Color.fromARGB(255, 255, 156, 44),),
          ),
        ),
        backgroundColor: Colors.black,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  margin: EdgeInsets.only(right: 10, bottom: 10),
                  height: 100,
                  child: IconButton(
                    onPressed: () {},
                    icon: Text(input,
                    style: GoogleFonts.inter(
                        fontSize: 70,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                    ),
                      ),
                    ),
                ),
              ],
            ),

            Row(
              children: [
                Container(
                  height: 90,
                  width: 90,
                  margin: EdgeInsets.all(3),
                  child: ElevatedButton(
                    onPressed: () {
                      clear();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey,
                    ),
                    child: Text("AC",
                    style: GoogleFonts.inter(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    )
                    ),
                    ),
                  ),
                Container(
                  height: 90,
                  width: 90,
                  margin: EdgeInsets.all(3),
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey,
                    ),
                    child: Text("±",
                    style: GoogleFonts.inter(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    )
                    ),
                    ),
                  ),

                  Container(
                  height: 90,
                  width: 90,
                  margin: EdgeInsets.all(3),
                  child: ElevatedButton(
                    onPressed: () {
                      addInput('%');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey,
                    ),
                    child: Text("%",
                    style: GoogleFonts.inter(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    )
                    ),
                    ),
                  ),

                  Container(
                  height: 90,
                  width: 90,
                  margin: EdgeInsets.all(3),
                  child: ElevatedButton(
                    onPressed: () {
                      addInput('÷');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 255, 156, 44),
                    ),
                    child: Text("÷",
                    style: GoogleFonts.inter(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    )
                    ),
                    ),
                  ),
              ],
            ),

            Row(
              children: [
                Container(
                  height: 90,
                  width: 90,
                  margin: EdgeInsets.all(3),
                  child: ElevatedButton(
                    onPressed: () {
                      addInput('1');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 83, 83, 83),
                    ),
                    child: Text("1",
                    style: GoogleFonts.inter(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    )
                    ),
                    ),
                  ),

                Container(
                  height: 90,
                  width: 90,
                  margin: EdgeInsets.all(3),
                  child: ElevatedButton(
                    onPressed: () {
                      addInput('2');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 83, 83, 83),
                    ),
                    child: Text("2",
                    style: GoogleFonts.inter(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    )
                    ),
                    ),
                  ),

                  Container(
                  height: 90,
                  width: 90,
                  margin: EdgeInsets.all(3),
                  child: ElevatedButton(
                    onPressed: () {
                      addInput('3');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 83, 83, 83),
                    ),
                    child: Text("3",
                    style: GoogleFonts.inter(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    )
                    ),
                    ),
                  ),

                  Container(
                  height: 90,
                  width: 90,
                  margin: EdgeInsets.all(3),
                  child: ElevatedButton(
                    onPressed: () {
                      addInput('×');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 255, 156, 44),
                    ),
                    child: Text("x",
                    style: GoogleFonts.inter(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    )
                    ),
                    ),
                  ),
              ],
            ),
            Row(
              children: [
                Container(
                  height: 90,
                  width: 90,
                  margin: EdgeInsets.all(3),
                  child: ElevatedButton(
                    onPressed: () {
                      addInput('4');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 83, 83, 83),
                    ),
                    child: Text("4",
                    style: GoogleFonts.inter(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    )
                    ),
                    ),
                  ),

                  Container(
                  height: 90,
                  width: 90,
                  margin: EdgeInsets.all(3),
                  child: ElevatedButton(
                    onPressed: () {
                      addInput('5');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 83, 83, 83),
                    ),
                    child: Text("5",
                    style: GoogleFonts.inter(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    )
                    ),
                    ),
                  ),

                  Container(
                  height: 90,
                  width: 90,
                  margin: EdgeInsets.all(3),
                  child: ElevatedButton(
                    onPressed: () {
                      addInput('6');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 83, 83, 83),
                    ),
                    child: Text("6",
                    style: GoogleFonts.inter(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    )
                    ),
                    ),
                  ),

                  Container(
                  height: 90,
                  width: 90,
                  margin: EdgeInsets.all(3),
                  child: ElevatedButton(
                    onPressed: () {
                      addInput('-');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 255, 156, 44),
                    ),
                    child: Text("-",
                    style: GoogleFonts.inter(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    )
                    ),
                    ),
                  ),
              ],
            ),

            Row(
              children: [
                Container(
                  height: 90,
                  width: 90,
                  margin: EdgeInsets.all(3),
                  child: ElevatedButton(
                    onPressed: () {
                      addInput('7');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 83, 83, 83),
                    ),
                    child: Text("7",
                    style: GoogleFonts.inter(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    )
                    ),
                    ),
                  ),

                  Container(
                  height: 90,
                  width: 90,
                  margin: EdgeInsets.all(3),
                  child: ElevatedButton(
                    onPressed: () {
                      addInput('8');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 83, 83, 83),
                    ),
                    child: Text("8",
                    style: GoogleFonts.inter(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    )
                    ),
                    ),
                  ),

                  Container(
                  height: 90,
                  width: 90,
                  margin: EdgeInsets.all(3),
                  child: ElevatedButton(
                    onPressed: () {
                      addInput('9');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 83, 83, 83),
                    ),
                    child: Text("9",
                    style: GoogleFonts.inter(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    )
                    ),
                    ),
                  ),

                  Container(
                  height: 90,
                  width: 90,
                  margin: EdgeInsets.all(3),
                  child: ElevatedButton(
                    onPressed: () {
                      addInput('+');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 255, 156, 44),
                    ),
                    child: Text("+",
                    style: GoogleFonts.inter(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    )
                    ),
                    ),
                  ),
              ],
            ),

            Row(
              children: [
                Container(
                  height: 90,
                  width: 186,
                  margin: EdgeInsets.all(3),
                  child: ElevatedButton(
                    onPressed: () {
                      addInput('0');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 83, 83, 83),
                    ),
                    child: Text("0",
                    style: GoogleFonts.inter(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),

                    ),
                    ),
                  ),

                Container(
                  height: 90,
                  width: 90,
                  margin: EdgeInsets.all(3),
                  child: ElevatedButton(
                    onPressed: () {
                      addInput('.');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 83, 83, 83),
                    ),
                    child: Text(".",
                    style: GoogleFonts.inter(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    )
                    ),
                    ),
                  ),

                  Container(
                  height: 90,
                  width: 90,
                  margin: EdgeInsets.all(3),
                  child: ElevatedButton(
                    onPressed: () {
                      calcualteResult();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 255, 156, 44),
                    ),
                    child: Text("=",
                    style: GoogleFonts.inter(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    )
                    ),
                    ),
                  ),

              ],
            ),
          ],
        ),
      );
  }
}