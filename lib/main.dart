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
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int firstScore = 0;
  int secondScore = 0;
  int thirdScore = 0;
  double average = 0.0;

  String grade = "unknown";

  TextEditingController scoreController = TextEditingController();
  TextEditingController secondScoreController = TextEditingController();
  TextEditingController thirdScoreController = TextEditingController();

  Color? gradeColor = Colors.black;

  void getGrade() {
    firstScore = int.parse(scoreController.text);
    secondScore = int.parse(secondScoreController.text);
    thirdScore = int.parse(thirdScoreController.text);

    average = (firstScore + secondScore + thirdScore) / 3;

    if (average >= 81 && average <= 100) {
      grade = "A";
      gradeColor = Colors.green;
    } else if (average >= 75 && average <= 80) {
      grade = "B";
      gradeColor = Colors.teal;
    } else if (average >= 65 && average <= 74) {
      grade = "C";
      gradeColor = Colors.orange;
    } else if (average <= 65) {
      grade = "D";
      gradeColor = Colors.red;
    } else {
      grade = "invalid";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Grade Checker"),
      ),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(
              horizontal: 8,
              vertical: 16,
            ),
            child: Text(
              "Your Grade is: $grade",
              style: TextStyle(
                fontSize: 24,
                color: gradeColor,
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(
              horizontal: 8,
              vertical: 16,
            ),
            child: Text(
              average.toString(),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(
              horizontal: 8,
              vertical: 16,
            ),
            child: TextField(
              controller: scoreController,
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(
              horizontal: 8,
              vertical: 8,
            ),
            child: TextField(
              controller: secondScoreController,
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(
              horizontal: 8,
              vertical: 8,
            ),
            child: TextField(
              controller: thirdScoreController,
            ),
          ),
          ElevatedButton(
            onPressed: () {
              setState(() {
                getGrade();
              });
            },
            child: const Text("Check"),
          ),
        ],
      ),
    );
  }
}
