class FeatureTileModel{

  String title;
  String desc;
  String imagePath;

  FeatureTileModel({this.title,this.desc, this.imagePath});

  void setTitle(String gettitle){
    title = gettitle;
  }

  void setDescription(String getDescription){
    desc = getDescription;
  }

  void setImagePath(String getImagePath){
    imagePath = getImagePath;
  }

  String getTitle(){
    return title;
  }

  String getDesc(){
    return desc;
  }

  String getImagePath(){
    return imagePath;
  }

}