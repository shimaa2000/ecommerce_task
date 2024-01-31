
class SliderModel {
  String image;
  String title;
  String description;

  SliderModel({
    required this.image,
    required this.title,
    required this.description,
  });

// getter for image
  String getImage() {
    return image;
  }

  // getter for title
  String getTitle() {
    return title;
  }

  // getter for image
  String getDescription() {
    return description;
  }
}
