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
    /*
    new Question("The Sun is a ", "star", "star", "sun", "gas planet", "moon"),
    new Question("The planet closest to the Sun is ", "Mercury", "Mercury", "Venus", "Earth", "Mars"),
    new Question("The planet farthest from the Sun is", "Neptune", "Neptune", "Uranus", "Saturn", "Jupiter"),
    new Question("Earth is in what galaxy?", "Milky Way", "Milky Way", "North Star", "Big Dipper", "Snickers"),
    new Question("Astronomers study what?", "Space", "Space", "Oceans", "Mountains", "Insects"),
    new Question("Jupiter is known as the what?", "Red Planet", "Ring Planet", "Blue Planet", "Red Planet", "Last Planet"),
    new Question("The Sun is a what?", "Star", "Star", "Planet", "Asteroid", "Sun"),
    new Question("What do you call deep holes found on the Moon?", "Craters", "Craters", "Cheese", "Meteorites", "Pits"),
    new Question("It takes the Earth how long to rotate around the Sun?", "365 days", "365 days", "30 days", "180 days", "360 days"),
    new Question("Earth orbits around what?", "Sun", "Sun", "Moon", "Gravity", "Solar System"),
    */
    new Question.trueFalse("Gravity keeps Earth in orbit", "true", "true", "false"),
    //new Question.trueFalse("Your mass changes in space", "false", "true", "false"),
    //new Question.trueFalse("Uranus is the smallest planet in the galaxy", "false", "true", "false"),
    new Question.trueFalse("Neptune has rings", "true", "true", "false"),
    //new Question.trueFalse("Astronauts have been on Mars", "false", "true", "false"),
    //new Question.trueFalse("Pluto is a planet", "false", "true", "false"),
    new Question.trueFalse("A Moon  orbiting another Moon is a Moonmoon", "true", "true", "false"),
    //new Question.trueFalse("Saturn is the largest planet in the galaxy", "false", "true", "false"),
    new Question.trueFalse("The Sun is the closest star to Earth", "true", "true", "false"),
    //new Question.trueFalse("Earth is the only planet with gravity", "false", "true", "false")
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
            if (quiz.numQuestions == questionNumber){
              Navigator.of(context).pushAndRemoveUntil(new MaterialPageRoute(builder: (BuildContext context) => new ScorePage(quiz.score, quiz.numQuestions)), (Route route) => route == null);
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
