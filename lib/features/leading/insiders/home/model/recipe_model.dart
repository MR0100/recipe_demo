class RecipeModel {
  final String title;
  final String imageUrl;
  final String prepTime;
  final String calories;
  final List<String> ingredients;

  RecipeModel({
    required this.title,
    required this.imageUrl,
    required this.prepTime,
    required this.calories,
    required this.ingredients,
  });
}
