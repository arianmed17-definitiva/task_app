class Task {

  String id;
  String title;

  Task({
    required this.id,
    required this.title,
  });

  Map<String, dynamic> toMap() {
    return {
      'title': title,
    };
  }

}