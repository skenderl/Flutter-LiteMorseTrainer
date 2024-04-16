enum AppTrainingCategory { easy, medium, hard, letters, numbers }

class Category {
  const Category({
    required this.route,
    required this.title,
  });

  final AppTrainingCategory route;
  final String? title;
}
