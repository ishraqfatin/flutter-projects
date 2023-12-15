class QuizQuestion {
  const QuizQuestion(this.text, this.answers);

  final String text;
  final List<String> answers;

  List<String> getShuffledAnswers() {
    final shuffledList = List.of(answers); // copying the existing list
    shuffledList.shuffle(); // shuffle doesnt return the list
    return shuffledList;
  }
}
