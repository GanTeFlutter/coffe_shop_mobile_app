class PageModel {
  const PageModel({
    required this.title,
    required this.description,
    required this.image,
  });

  final String title;
  final String description;
  final String image;

  @override
  String toString() {
    return 'PageModel(title: $title, description: $description, image: $image)';
  }
}
