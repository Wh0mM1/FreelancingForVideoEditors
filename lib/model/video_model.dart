class Vids {
  final String name;
  final String imagePath;
  final String category;
  final String description;

  Vids({
    required this.name,
    required this.imagePath,
    required this.category,
    required this.description,
  });
}

class Vid {
  final String category;
  final String projectName;
  final String imageURL;
  final String decription;

  Vid(
      {required this.category,
      required this.projectName,
      required this.imageURL,
      required this.decription});
}
