import 'package:flutter/material.dart';
class QuizScreen extends StatefulWidget {
  const QuizScreen({Key? key});

  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  List<Map<String, dynamic>> questions = [
    {//1
      'image': 'donotturn.png',
      'choices': ['No U turn', 'Stop', 'Cannot get in', 'Slow down'],
      'correctAnswer': 0
    },
    {//2
      'image': 'noparking.jpeg',
      'choices': ['One way', 'Park here', 'No parking', 'Traffic '],
      'correctAnswer': 2
    },
    {//3
      'image': 'speedlimit.png',
      'choices': ['higher your speed', 'limit speed to 45', 'fire here', 'do not enter '],
      'correctAnswer': 1
    },
    {//4
      'image': 'slipperyroad.jpeg',
      'choices': ['slippery road', 'turn left', 'zig zag road', 'Stop'],
      'correctAnswer': 0
    },
    {//5
      'image': '2wayroad.jpg',
      'choices': ['one way road', 'do not pass', 'no crossing roads', '2 way road'],
      'correctAnswer': 3
    },
    {//6
      'image': 'noentry.png',
      'choices': ['danger', 'Stop', 'pedestrians not allowed', 'Slow down'],
      'correctAnswer': 2
    },
    {//7
      'image': 'pedestriancrossingroad.png',
      'choices': ['pedestrian crossing roads', 'no pedestrians', 'no cars allowed', 'stop'],
      'correctAnswer': 0
    },
    {//8
      'image': 'dangerpedestrian.png',
      'choices': ['warning', 'Stop', 'Cannot get in', 'Slow down'],
      'correctAnswer': 2
    },
    {//9
      'image': 'nopassingcars.png',
      'choices': ['do not pass the truck', 'no trucks allowed', 'priority for cars', 'no cars allowed'],
      'correctAnswer': 0
    },
    {//10
      'image': 'highway.png',
      'choices': ['Hospital', 'Highway', 'airplane road', 'closed way'],
      'correctAnswer': 1
    },

  ];

  int currentQuestion = 0;
  int score = 0;



  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Picture Quiz App'),
          automaticallyImplyLeading: false,
          leading: null,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (currentQuestion < questions.length)
                Column(
                  children: [
                    Image.asset(
                      'assets/${questions[currentQuestion]['image']}',
                      height: 300,
                      width: 400,
                    ),
                    const SizedBox(height: 20),
                    for (int i = 0; i < 4; i++)
                      Column(
                        children: [
                          ElevatedButton(
                            onPressed: () => checkAnswer(i),
                            style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.resolveWith<Color?>(
                                (states) {
                                  return null;
                                },
                              ),
                            ),
                            child:
                                Text(questions[currentQuestion]['choices'][i]),
                          ),
                          const SizedBox(height: 10),
                          // Add this SizedBox for spacing
                        ],
                      ),
                    const SizedBox(height: 100),
                  ],
                )
              else
                Column(
                  children: [
                    Text(
                      score >= 7
                          ? 'Congratulations, you passed!'
                          : 'Oops, you failed!',
                      style: const TextStyle(fontSize: 20),
                    ),
                    const SizedBox(height: 10),
                    Text('Score: $score'),
                    const SizedBox(height: 10), // Display the score here
                    ElevatedButton(
                      onPressed: retryQuiz,
                      child: const Text('take the test again'),
                    ),
                  ],
                ),
              const SizedBox(height: 10),
              // Text('Score: $score'),
            ],
          ),
        ),
      ),
    );
  }

  void checkAnswer(int selectedAnswer) {
    int correctAnswer = questions[currentQuestion]['correctAnswer'];

    setState(() {

      if (selectedAnswer == correctAnswer) {
        score++;
      }

      currentQuestion++;
    });
  }

  void retryQuiz() {
    setState(() {
      currentQuestion = 0;
      score = 0;
    });
  }
}