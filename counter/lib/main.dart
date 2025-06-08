import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

void main() {
  runApp(Counter());
}

class Counter extends StatelessWidget {
  const Counter({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CounterScaffold(),
      debugShowCheckedModeBanner: false,
      title: 'Counter',
    );
  }
}

class CounterScaffold extends StatefulWidget {
  const CounterScaffold({super.key});
  @override
  State<CounterScaffold> createState() => _CounterScaffold();
}

class _CounterScaffold extends State<CounterScaffold> {
  late int count;
  @override
  void initState() {
    super.initState();
    count = 0;
  }

  void increaseCount() {
    setState(() {
      count = count + 1;
    });
  }

  void decreaseCount() {
    if (count > 0) {
      setState(() {
        count = count - 1;
      });
    } else {
      Alert(
        context: context,
        title: "Negative Count Error",
        desc: "Count Value Cannot Go Below Zero.",
      ).show();
    }
  }

  void resetCount() {
    setState(() {
      count = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Counter',
          style: GoogleFonts.bebasNeue(
            letterSpacing: 1,
            textStyle: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 50,
            ),
          ),
        ),
        toolbarHeight: 100,
        flexibleSpace: Container(color: Colors.black),
      ),
      body: Container(
        decoration: BoxDecoration(color: Colors.black),
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.black,
              border: Border.all(color: Colors.white, width: 3),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(
                    '$count',
                    style: GoogleFonts.bebasNeue(
                      letterSpacing: 1,
                      textStyle: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 80,
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        onPressed: increaseCount,
                        icon: Icon(
                          Icons.arrow_circle_up_outlined,
                          color: Colors.white,
                          size: 80,
                        ),
                      ),
                      IconButton(
                        onPressed: decreaseCount,
                        icon: Icon(
                          Icons.arrow_circle_down_outlined,
                          color: Colors.white,
                          size: 80,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  OutlinedButton(
                    style: ButtonStyle(
                      shape: WidgetStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(0),
                        ),
                      ),
                    ),
                    onPressed: resetCount,
                    child: Text(
                      'Reset',
                      style: GoogleFonts.bebasNeue(
                        letterSpacing: 1,
                        textStyle: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 50,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
