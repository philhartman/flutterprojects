import 'package:flutter/material.dart';

import '../utils/question.dart';
import '../utils/quiz.dart';

import '../UI/answer_button.dart';
import '../UI/question_text.dart';
import '../UI/correct_wrong_overlay.dart';

import './score_page.dart';

class QuizPage extends StatefulWidget {
  @override
  State createState() => new QuizPageState();
}

class QuizPageState extends State<QuizPage> {

  Question currentQuestion;
  Quiz quiz = new Quiz([
    new Question("The Sun is a ", "star", "star", "sun", "gas planet", "moon"),
    new Question("The planet closest to the Sun is ", "Mercury", "Mercury", "Venus", "Earth", "Mars"),
    new Question.trueFalse("The planet closest to the Sun is Mercury", "true", "true", "false")
    /*, 
    new Question("The planet farthest from the Sun is Mars", false),
    new Question("Earth is in the Milky Way galaxy", true),
    new Question("Astronomers study the ocean", false),
    new Question("Jupiter is known as the 'Red Planet'", true),
    new Question("The Sun is a planet", false),
    new Question("Craters are deep holes found on the Moon", true),
    new Question("It takes the Earth one year to rotate around the Sun", true),
    new Question("Earth orbits around the Moon", false),
    new Question("Gravity keeps Earth in orbit", true),
    new Question("Your mass changes in space", false),
    new Question("Uranus is the smallest planet in the galaxy", false),
    new Question("Neptune has rings", true),
    new Question("Astronauts have been on Mars", false),
    new Question("Pluto is a planet", false),
    new Question("A Moon  orbiting another Moon is a Moonmoon", true),
    new Question("Saturn is the largest planet in the galaxy", false),
    new Question("The Sun is the closest star to Earth", true),
    new Question("Earth is the only planet with gravity", true)
    */
  ]);

  String questionText;
  String optionText;
  int questionNumber;
  bool isCorrect;
  bool overlayShouldBeVisible = false;

  @override
  void initState() {
    super.initState();
    currentQuestion = quiz.nextQuestion;
    questionText = currentQuestion.question;

    questionNumber = quiz.questionNumber;
  }

  void handleAnswer(String option){
    isCorrect = (currentQuestion.answer == option);
    quiz.answer(isCorrect);
    this.setState((){
      overlayShouldBeVisible = true;
    });
  }
  Widget buildButtons(){
    if (currentQuestion.option3 != 'trueFalse'){
      return new Column(
          // This is our main page
          children: <Widget>[
            new AnswerButton(1, currentQuestion.option1, () => handleAnswer(currentQuestion.option1)), 
            new AnswerButton(2, currentQuestion.option2, () => handleAnswer(currentQuestion.option2)), 
            new QuestionText(questionText, questionNumber),
            new AnswerButton(3, currentQuestion.option3, () => handleAnswer(currentQuestion.option3)), 
            new AnswerButton(4, currentQuestion.option4, () => handleAnswer(currentQuestion.option4)),
          ],
        );
    } else {
      return new Column(
          // This is our main page
          children: <Widget>[
            new AnswerButton(1, currentQuestion.option1, () => handleAnswer(currentQuestion.option1)),
            new QuestionText(questionText, questionNumber),
            new AnswerButton(2, currentQuestion.option2, () => handleAnswer(currentQuestion.option2)),
          ],
        );
    }
  }
  @override
  Widget build(BuildContext context) {
    return new Stack(
      fit: StackFit.expand,
      children: <Widget>[
        /*
        new Column(
          // This is our main page
          children: <Widget>[
            new AnswerButton(1, currentQuestion.option1, () => handleAnswer(currentQuestion.option1)), // True button
            new AnswerButton(2, currentQuestion.option2, () => handleAnswer(currentQuestion.option2)), // True button
            new QuestionText(questionText, questionNumber),
            new AnswerButton(3, currentQuestion.option3, () => handleAnswer(currentQuestion.option3)), // false button
            new AnswerButton(4, currentQuestion.option4, () => handleAnswer(currentQuestion.option4)), // false button
          ],
        )
        */
        buildButtons(),
        overlayShouldBeVisible == true ? new CorrectWrongOverlay(
          isCorrect,
          () {
            if (quiz.length == questionNumber){
              Navigator.of(context).pushAndRemoveUntil(new MaterialPageRoute(builder: (BuildContext context) => new ScorePage(quiz.score, quiz.length)), (Route route) => route == null);
              return;
            }
            currentQuestion = quiz.nextQuestion;
            this.setState(() {
              overlayShouldBeVisible = false;
              questionText = currentQuestion.question;
              questionNumber = quiz.questionNumber;
            });
          }
        ) : new Container()
      ],
    );
  }
}
