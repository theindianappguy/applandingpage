import 'package:applandingpage/data/general_data.dart';
import 'package:applandingpage/model/app_feature_model.dart';
import 'package:applandingpage/model/feature_tile_model.dart';
import 'package:applandingpage/others/responsive_widget.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'model/testimonial_model.dart';

class LandingPage extends StatefulWidget {
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
            child: Column(
          children: <Widget>[
              OneHeader(),
              SecondHeader(),
              AppFeaturesList(),
              FeatureSlider(),
              WatchVideo(),
              Textimonial(),
              Bottom(),
              BelowBottom()
          ],
        )),
      ),
    );
  }
}

class OneHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(vertical: 30),
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [const Color(0xffFEB692), const Color(0xffEA5455)])),
      child: ResponsiveWidget(
        largeScreen: Container(
          width: MediaQuery.of(context).size.width > 1000
              ? 1000
              : MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Row(
            children: <Widget>[
              Container(
                  width: MediaQuery.of(context).size.width > 1000
                      ? 500
                      : MediaQuery.of(context).size.width / 2,
                  child: OneHeaderL()),
              Container(
                  width: MediaQuery.of(context).size.width > 1000
                      ? 500
                      : MediaQuery.of(context).size.width / 2,
                  child: OneHeaderR(
                    assetPath: "header_screenshot.png",
                    fixedSize: true,
                  ))
            ],
          ),
        ),
        smallScreen: Column(
          children: <Widget>[
            Container(
                padding: EdgeInsets.symmetric(vertical: 20),
                child: OneHeaderL()),
            OneHeaderR(
              assetPath: "header_screenshot.png",
              fixedSize: false,
            )
          ],
        ),
      ),
    );
  }
}

class OneHeaderL extends StatelessWidget {
  launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(horizontal: 40),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: MediaQuery.of(context).size.width > 700
            ? CrossAxisAlignment.start
            : CrossAxisAlignment.center,
        children: <Widget>[
          Text(
            appHeading,
            textAlign: MediaQuery.of(context).size.width > 700
                ? null
                : TextAlign.center,
            style: TextStyle(
                color: Colors.white, fontSize: 35, fontWeight: FontWeight.w500),
          ),
          SizedBox(
            height: 16,
          ),
          Text(
            appDescription,
            textAlign: MediaQuery.of(context).size.width > 700
                ? null
                : TextAlign.center,
            style: TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.w300),
          ),
          SizedBox(
            height: 25,
          ),
          Row(
            mainAxisAlignment: MediaQuery.of(context).size.width > 700 ? MainAxisAlignment.start : MainAxisAlignment.center,
            children: <Widget>[
              GestureDetector(
                  onTap: () {
                    launchURL(playStoreUrl);
                  },
                  child: Image.asset(
                    "assets/google_play_button.png",
                    width: 150,
                    height: 50,
                  )),
              SizedBox(width: 2,),
              GestureDetector(
                  onTap: () {
                    launchURL(playStoreUrl);
                  },
                  child: Image.asset(
                    "assets/app_store_badge.png",
                    width: 180,
                    height: 130,
                  )),
            ],
          ),
        ],
      ),
    );
  }
}

class OneHeaderR extends StatelessWidget {
  String assetPath;
  final bool fixedSize;

  OneHeaderR({@required this.assetPath, this.fixedSize});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Image.asset("assets/" + assetPath),
    );
  }
}

class SecondHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.symmetric(vertical: 60, horizontal: 30),
      color: Colors.white,
      child: Column(
        children: <Widget>[
          Image.asset("assets/test.png",width: 40,height: 40,),
          SizedBox(height: 20,),
          Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 25, color: headerColor, fontWeight: FontWeight.w500),
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            description,
            textAlign: TextAlign.center,
            style: TextStyle(fontWeight: FontWeight.w300),
          ),
        ],
      ),
    );
  }
}

class WatchVideo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 150),
      color: Colors.black87,
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: <Widget>[
          Text(
            "Watch the video",
            style: TextStyle(
                color: Colors.white, fontSize: 30, fontWeight: FontWeight.w400),
          ),
          SizedBox(
            height: 30,
          ),
          Icon(
            Icons.play_circle_filled,
            color: Colors.white,
            size: 70,
          )
        ],
      ),
    );
  }
}

class Textimonial extends StatefulWidget {
  @override
  _TextimonialState createState() => _TextimonialState();
}

class _TextimonialState extends State<Textimonial> {
  List<TestimonialModel> myAppTestimonials = new List<TestimonialModel>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    myAppTestimonials = getTestimonials();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [const Color(0xffFEB692), const Color(0xffEA5455)])),
      child: Container(
        width: MediaQuery.of(context).size.width > 800
            ? 800
            : MediaQuery.of(context).size.width,
        alignment: Alignment.center,
        child: SizedBox(
          height: 400,
          child: ListView.builder(
              shrinkWrap: true,
              physics: ClampingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: myAppTestimonials.length,
              itemBuilder: (context, index) {
                return TestimonialTile(
                  description: myAppTestimonials[index].getDescription(),
                  assetPathName: myAppTestimonials[index].getImageAssetName(),
                  name: myAppTestimonials[index].getName(),
                  designation: myAppTestimonials[index].getDesignation(),
                  rating: myAppTestimonials[index].getRating(),
                );
              }),
        ),
      ),
    );
  }
}

class TestimonialTile extends StatelessWidget {
  String description, assetPathName, name, designation;
  double rating;

  TestimonialTile(
      {this.description,
      this.assetPathName,
      this.name,
      this.designation,
      this.rating});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width > 800
          ? 800
          : MediaQuery.of(context).size.width,
      padding: EdgeInsets.symmetric(horizontal: 40, vertical: 40),
      child: Column(
        children: <Widget>[
          Text(
            description,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w300,
            ),
          ),
          SizedBox(
            height: 16,
          ),
          StarRating(
            rating: rating,
          ),
          SizedBox(
            height: 20,
          ),
          ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(60)),
              child: Image.asset(
                "assets/$assetPathName",
                height: 50,
                width: 50,
              )),
          SizedBox(
            height: 8,
          ),
          Text(
            name,
            style: TextStyle(
                color: Colors.white, fontSize: 16, fontWeight: FontWeight.w300),
          ),
          SizedBox(
            height: 4,
          ),
          Text(
            designation,
            style: TextStyle(
                color: Colors.white, fontSize: 14, fontWeight: FontWeight.w300),
          )
        ],
      ),
    );
  }
}

class StarRating extends StatelessWidget {
  final dynamic rating;

  StarRating({this.rating});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Icon(
          rating >= 1 ? Icons.star : Icons.star_border,
          color: Color(0xff262626),
          size: 20,
        ),
        Icon(
          rating >= 2 ? Icons.star : Icons.star_border,
          color: Color(0xff262626),
          size: 20,
        ),
        Icon(
          rating >= 3 ? Icons.star : Icons.star_border,
          color: Color(0xff262626),
          size: 20,
        ),
        Icon(
          rating >= 4 ? Icons.star : Icons.star_border,
          color: Color(0xff262626),
          size: 20,
        ),
        Icon(
          rating >= 5 ? Icons.star : Icons.star_border,
          color: Color(0xff262626),
          size: 20,
        ),
      ],
    );
  }
}

class Bottom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 50, right: 40, left: 40),
      width: MediaQuery.of(context).size.width,
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(
            closingTitle,
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w500,
                color: Color(0xCC262626)),
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            closingDescription,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w300),
          ),
          SizedBox(
            height: 24,
          ),
          Image.asset("assets/" + coverImage)
        ],
      ),
    );
  }
}

class BelowBottom extends StatelessWidget {
  launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 60, horizontal: 40),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [const Color(0xffFEB692), const Color(0xffEA5455)])),
      child: Column(
        children: <Widget>[
          Text(
            finaCalltoAction,
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 23, fontWeight: FontWeight.w300, color: Colors.white),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              GestureDetector(
                  onTap: () {
                    launchURL(playStoreUrl);
                  },
                  child: Image.asset(
                    "assets/google_play_button.png",
                    width: 150,
                    height: 50,
                  )),
              SizedBox(width: 2,),
              GestureDetector(
                  onTap: () {
                    launchURL(playStoreUrl);
                  },
                  child: Image.asset(
                    "assets/app_store_badge.png",
                    width: 180,
                    height: 130,
                  )),
            ],
          )
        ],
      ),
    );
  }
}

class AppFeaturesList extends StatefulWidget {
  @override
  _AppFeaturesListState createState() => _AppFeaturesListState();
}

class _AppFeaturesListState extends State<AppFeaturesList> {
  List<AppFeatureModel> myAppFeatures = new List<AppFeatureModel>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    myAppFeatures = getAppFeatures();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
          itemCount: myAppFeatures.length,
          shrinkWrap: true,
          physics: ClampingScrollPhysics(),
          itemBuilder: (context, index) {
            return AppFeatureTile(
              title: myAppFeatures[index].getFeatureTitle(),
              description: myAppFeatures[index].getFeatureDescription(),
              assetPath: myAppFeatures[index].getImagePath(),
              tileIndex: index,
            );
          }),
    );
  }
}

class AppFeatureTile extends StatelessWidget {
  String assetPath, title, description;
  int tileIndex;

  AppFeatureTile(
      {this.assetPath, this.title, this.description, this.tileIndex});

  @override
  Widget build(BuildContext context) {
    return Container(
      height:  MediaQuery.of(context).size.width > 700 ? 700 : null,
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(
          vertical: 30,
          horizontal: MediaQuery.of(context).size.width > 800 ? 40 : 20),
      decoration: tileIndex % 2 == 0
          ? BoxDecoration(
              gradient: LinearGradient(
                  colors: [const Color(0xffFEB692), const Color(0xffEA5455)]))
          : null,
      child: tileIndex % 2 == 0 ? Container(
        child: MediaQuery.of(context).size.width < 700 ? Column(
          children: <Widget>[
            OneHeaderR(
              assetPath: assetPath,
              fixedSize: false,
            ),
            FeatureTileText(
              title: title,
              description: description,
              myIndex: tileIndex,
            )
          ],
        ): Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              child: OneHeaderR(
                assetPath: assetPath,
                fixedSize: true,
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width > 1000
                  ? 500
                  : MediaQuery.of(context).size.width / 2,
              child: FeatureTileText(
                title: title,
                description: description,
                myIndex: tileIndex,
              ),
            )
          ],
        ),
      ) : Container(
        child: MediaQuery.of(context).size.width < 700 ? Column(
          children: <Widget>[
            OneHeaderR(
              assetPath: assetPath,
              fixedSize: false,
            ),
            FeatureTileText(
              title: title,
              description: description,
              myIndex: tileIndex,
            )
          ],
        ): Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width > 1000
                  ? 500
                  : MediaQuery.of(context).size.width / 2,
              child: FeatureTileText(
                title: title,
                description: description,
                myIndex: tileIndex,
              ),
            ),
            Container(
              child: OneHeaderR(
                assetPath: assetPath,
                fixedSize: true,
              ),
            ),
          ],
        ),
      )
    );
  }
}

class FeatureTileText extends StatelessWidget {
  String title, description;
  int myIndex;

  FeatureTileText({this.title, this.description, this.myIndex});

  launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width > 700 ? 40 : 20,
          vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            appHeading,
            textAlign: MediaQuery.of(context).size.width > 700
                ? null
                : TextAlign.center,
            style: TextStyle(
              color: myIndex % 2 == 0 ? Colors.white : Colors.black87,
              fontSize: 35,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(
            height: 16,
          ),
          Text(
            appDescription,
            textAlign: MediaQuery.of(context).size.width > 700
                ? null
                : TextAlign.center,
            style: TextStyle(
                color: myIndex % 2 == 0 ? Colors.white : Colors.black87,
                fontSize: 20,
                fontWeight: FontWeight.w300),
          ),
          SizedBox(
            height: 16,
          ),
          Row(
            mainAxisAlignment: MediaQuery.of(context).size.width > 700 ?
            MainAxisAlignment.start: MainAxisAlignment.center,
            children: <Widget>[
              GestureDetector(
                  onTap: () {
                    launchURL(playStoreUrl);
                  },
                  child: Image.asset(
                    "assets/google_play_button.png",
                    width: 150,
                    height: 50,
                  )),
              SizedBox(width: 2,),
              GestureDetector(
                  onTap: () {
                    launchURL(playStoreUrl);
                  },
                  child: Image.asset(
                    "assets/app_store_badge.png",
                    width: 180,
                    height: 130,
                  )),
            ],
          )
        ],
      ),
    );
  }
}

class FeatureSlider extends StatefulWidget {
  @override
  _FeatureSliderState createState() => _FeatureSliderState();
}

class _FeatureSliderState extends State<FeatureSlider> {

  List<FeatureTileModel> features = new List<FeatureTileModel>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    features = getFeaturesTiles();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: <Widget>[
          SizedBox(height: 50,),
          Text(
            "Feature Rich. No bloat.",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w500,
                color: Color(0xCC262626)),
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            "Donec sit eget metus odio. Aliqua dolor metus in tincidunt condimentum.",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w300),
          ),
          SizedBox(
            height: 16,
          ),
          Container(
            child: ResponsiveWidget(
              largeScreen: Row(
                children: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width/3,
                    child: ListView.builder(
                      itemCount: 3,
                        shrinkWrap: true,
                        physics: ClampingScrollPhysics(),
                        itemBuilder: (context, index){
                        return FeaturesTile(
                          title: features[index].getTitle(),
                          description: features[index].getDesc(),
                        );
                        }),
                  ),
                  Container(
                    height: 650,
                    width:  MediaQuery.of(context).size.width/3,
                    child: ListView.builder(
                      itemCount: features.length,
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index){
                        return Container(
                            margin: EdgeInsets.symmetric(horizontal: 40),
                            child: Image.asset("assets/"+features[index].getImagePath()));
                        }),
                  ),
                  Container(
                  width: MediaQuery.of(context).size.width/3,
                    child: ListView.builder(
                        itemCount: 3,
                        physics: ClampingScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (context, index){
                          return FeaturesTile(
                            title: features[index+2].getTitle(),
                            description: features[index+2].getDesc(),
                          );
                        }),
                  ),

                ],
              ),
              smallScreen: Column(
                children: <Widget>[
                  Container(
                    child: ListView.builder(
                        itemCount: 3,
                        shrinkWrap: true,
                        physics: ClampingScrollPhysics(),
                        itemBuilder: (context, index){
                          return FeaturesTile(
                            title: features[index].getTitle(),
                            description: features[index].getDesc(),
                          );
                        }),
                  ),
                  SizedBox(
                    height: 650,
                    width: 350,
                    child: ListView.builder(
                      shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: features.length,
                        itemBuilder: (context, index){
                          return Image.asset("assets/"+features[index].getImagePath());
                        }),
                  ),
                  Container(
                    child: ListView.builder(
                        itemCount: 3,
                        physics: ClampingScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (context, index){
                          return FeaturesTile(
                            title: features[index+2].getTitle(),
                            description: features[index+2].getDesc(),
                          );
                        }),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class FeaturesTile extends StatelessWidget {
  String title, description;

  FeaturesTile({this.title, this.description});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16),
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        children: <Widget>[
          Image.asset("assets/test.png",width: 40,height: 40,),
          SizedBox(height: 16,),
          Text(
            closingTitle,
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: Color(0xCC262626)),
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            closingDescription,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w300),
          ),
          SizedBox(
            height: 24,
          ),
        ],
      ),
    );
  }
}
