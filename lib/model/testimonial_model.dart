class TestimonialModel {
  String description;
  String name;
  String designation;
  String imageAssetName;
  double rating;

  TestimonialModel(
      {this.description, this.name, this.designation, this.imageAssetName,
      this.rating});

  void setDescription(String getDescription){
    description = getDescription;
  }

  void setName(String getName){
    name = getName;
  }

  void setDesignation(String getDesignation){
    designation = getDesignation;
  }

  void setImageAssetPath(String getImageAssetPath){
    imageAssetName = getImageAssetPath;
  }

  void setRating(double getRating){
    rating = getRating;
  }

  String getDescription(){
    return description;
  }

  String getName(){
    return name;
  }

  String getDesignation(){
    return designation;
  }

  String getImageAssetName(){
    return imageAssetName;
  }

  double getRating(){
    return rating;
  }
}
