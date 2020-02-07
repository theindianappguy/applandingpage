class AppFeatureModel{

  String featureTitle;
  String featureDescription;
  String imagePath;

  AppFeatureModel({this.featureTitle,
  this.featureDescription,
  this.imagePath});

  void setFeatureTitle(String getTitle){
    featureTitle = getTitle;
  }

  void setFeatureDescription(String getDescription){
    featureDescription = getDescription;
  }

  void setImagePath(String getImagePath){
    imagePath = getImagePath;
  }

  String getFeatureTitle(){
    return featureTitle;
  }

  String getFeatureDescription(){
    return featureDescription;
  }

  String getImagePath(){
    return imagePath;
  }

}