class Question {

  final String question;
  final String answer;
  String option1;
  String option2;
  String option3;
  String option4;
  List<String> _options;

  Question(this.question, this.answer, this.option1, this.option2, this.option3, this.option4) {
    _options = [option1, option2, option3, option4];
    _options.shuffle();
    option1 = _options[0];
    option2 = _options[1];
    option3 = _options[2];
    option4 = _options[3];

  }
  Question.trueFalse(this.question, this.answer, this.option1, this.option2){
    this.option3 = 'trueFalse';
    this.option4 = 'trueFalse';
  }

}