class Question {
  final String questionText;
  final List<Answer> answerList;

  Question(this.questionText, this.answerList);
}

class Answer {
  final String answerText;
  final bool isCorrect;

  Answer(this.answerText, this.isCorrect);
}

List<Question> getQuestions() {
  List<Question> list = [];

  //Add Questions here--->

  list.add(Question("Who is Bill Gates?", [
    Answer("CEO of Facebook", false),
    Answer("CEO of Microsoft", true),
    Answer("CEO of Netflix", false),
    Answer("CEO of Google", false)
  ]));
   list.add(Question("Who is Elon Musk?", [
    Answer("CEO of Facebook", false),
    Answer("CEO of Microsoft", false),
    Answer("CEO of Tesla", true),
    Answer("CEO of Google", false)
  ]));
   list.add(Question("Who is Mark Zuckerberg?", [
    Answer("CEO of Facebook", true),
    Answer("CEO of Microsoft", false),
    Answer("CEO of Netflix", false),
    Answer("CEO of Google", false)
  ]));
   list.add(Question("Who is Anand Mahindra?", [
    Answer("CEO of Tata", false),
    Answer("CEO of Suzuki",false),
    Answer("CEO of Ford", false),
    Answer("CEO of Mahindara", true)
  ]));
   list.add(Question("Who is Ratan Tata?", [
    Answer("CEO of Tata", true),
    Answer("CEO of Suzuki",false),
    Answer("CEO of Toyota", false),
    Answer("CEO of Ford", false)
  ]));
   list.add(Question("Who is Azim Premji?", [
    Answer("CEO of Wipro", true),
    Answer("CEO of TCS",false),
    Answer("CEO of Cisco", false),
    Answer("CEO of Infosys", false)
  ]));
   list.add(Question("My Name is?", [
    Answer("User", false),
    Answer("System", false),
    Answer("Hero", false),
    Answer("Boss", true)
  ]));
  return list;
}
