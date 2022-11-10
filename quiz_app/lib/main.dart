import 'package:flutter/material.dart';
import 'package:quiz_app/quiz.dart';
import 'package:quiz_app/quizpage.dart';

QuizBrain quizBrain = QuizBrain();

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Quiz App',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController textController = TextEditingController();
  String questionText = "";
  bool questionAnswer = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quiz App'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const Text('Add Questions'),
            const SizedBox(height: 20),
            TextFormField(
              controller: textController,
              decoration: const InputDecoration(
                hintText: 'Enter Question',
              ),
            ),
            const SizedBox(height: 10),
            TextButton(
                onPressed: (){
                  questionAnswer = true;
                  questionText = textController.text;
                  quizBrain.addQuestion(questionText, questionAnswer);
                  textController.clear();
                },
                child: const Text('True')
            ),
            TextButton(
                onPressed: (){
                  questionAnswer = false;
                  questionText = textController.text;
                  quizBrain.addQuestion(questionText, questionAnswer);
                  textController.clear();
                },
                child: const Text('False')
            ),
            const SizedBox(height: 60,),
            ElevatedButton(
                onPressed: () {
                  if (questionText.isEmpty) {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: const Text('Add Questions'),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: const Text('OK'),
                              ),
                            ],
                          );
                        }
                    );
                  } else {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const QuizPage()),
                    );
                    quizBrain.shuffle();
                  }
                },
                child: const Text('Start Quiz')
            ),
          ],
        ),
      ),
    );
  }
}








