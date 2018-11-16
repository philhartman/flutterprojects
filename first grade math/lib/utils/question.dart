class Question {

  final String question;
  final String answer;
  final String option1;
  final String option2;
  String option3;
  String option4;

  Question(this.question, this.answer, this.option1, this.option2, this.option3, this.option4);
  Question.trueFalse(this.question, this.answer, this.option1, this.option2){
    this.option3 = 'trueFalse';
    this.option4 = 'trueFalse';
  }

}