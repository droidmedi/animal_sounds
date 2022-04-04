import 'package:animal_sounds/PageFerm.dart';
import 'package:animal_sounds/PageDomestique.dart';
import 'package:flutter/material.dart';
import 'package:share/share.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import 'ad_helper.dart';

//import 'package:fluttertoast/fluttertoast.dart';

//void main() {
// runApp(new MaterialApp(home: new HomePage()));
//}
//const APP_ID = "ca-app-pub-8252478336271858/6028044195";
//const APP_ID = "ca-app-pub-3940256099942544/1033173712";

//void main() => runApp(AnimalSounds());
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  MobileAds.instance.initialize();


  runApp(AnimalSounds());
}

class AnimalSounds extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: "Animal Sounds",
      home: Acceuil(),
    );
  }
}

class Acceuil extends StatefulWidget {


  @override
  HomePage createState() => HomePage();

}

class HomePage extends State<Acceuil> {
  late BannerAd _bottomBannerAd;
  bool _isBottomBannerAdLoaded = false;
  void _createBottomBannerAd() {
    _bottomBannerAd = BannerAd(
      adUnitId: AdHelper.bannerAdUnitId,
      size: AdSize.banner,
      request: AdRequest(),
      listener: BannerAdListener(
        onAdLoaded: (_) {
          setState(() {
            _isBottomBannerAdLoaded = true;
          });
        },
        onAdFailedToLoad: (ad, error) {
          ad.dispose();
        },
      ),
    );
    _bottomBannerAd.load();
  }


  @override
  void initState() {
    super.initState();
    _createBottomBannerAd();
  }

  @override
  void dispose() {
    super.dispose();
    _bottomBannerAd.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: new Scaffold(
        bottomNavigationBar: _isBottomBannerAdLoaded
            ? Container(
          height: _bottomBannerAd.size.height.toDouble(),
          width: _bottomBannerAd.size.width.toDouble(),
          child: AdWidget(ad: _bottomBannerAd),
        )
            : null,
        backgroundColor: Colors.teal,
        appBar: new AppBar(
          backgroundColor: Colors.blueGrey,
          actions: <Widget>[
            new IconButton(
              icon: Icon(Icons.share),
              onPressed: () {
             //   final RenderBox box = context.findRenderObject();
                final RenderBox box = context.findRenderObject() as RenderBox;
                Share.share(
                    'https://play.google.com/store/apps/details?id=com.farmanimalsounds.petsanimalsounds',
                    sharePositionOrigin:
                        box.localToGlobal(Offset.zero) & box.size);
              },
            ),
          ],
          title: new Text('animal Sounds'),
        ),
        body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
            image: AssetImage("assets/images/fondapp.jpg"),
            fit: BoxFit.cover,
          )
          ),
          alignment: Alignment.center,
          child: SingleChildScrollView(
            child: new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              //crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: new Row(),
                ),
                new Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  //  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: new Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        // crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          new Card(
                            elevation: 8,
                            color: Colors.transparent,
                            child: Column(
                              children: <Widget>[
                                InkWell(
                                    onTap: () {
                                      //    interstitialAd.show();

                                      //showColoredToast();
                                      var route = new MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                            new PageDomestique(valuee: 1),
                                      );
                                      Navigator.of(context).push(route);
                                    },
                                    child: Image.asset(
                                        'assets/images/dogdog.png')),
                                new Text(
                                  "Dogs",
                                  style: TextStyle(
                                      fontSize: 18, color: Colors.amberAccent),
                                ),
                              ],
                            ),
                          ),
                          new Card(
                            elevation: 8,
                            color: Colors.transparent,
                            child: Column(
                              children: <Widget>[
                                InkWell(
                                    onTap: () {
                                      //    interstitialAd.show();

                                      var route = new MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                            new PageDomestique(valuee: 0),
                                      );
                                      Navigator.of(context).push(route);
                                    },
                                    child: Image.asset(
                                        'assets/images/catcat.png')),
                                new Text(
                                  "Cats",
                                  style: TextStyle(
                                      fontSize: 18, color: Colors.amberAccent),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: new Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Card(
                            elevation: 8,
                            color: Colors.transparent,
                            child: Column(
                              children: <Widget>[
                                InkWell(
                                    onTap: () {
                                      //    interstitialAd.show();

                                      var route = new MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                            new PageFerm(valuee: 0),
                                      );
                                      Navigator.of(context).push(route);
                                    },
                                    child: Image.asset(
                                        'assets/images/vachvache.png')),
                                new Text(
                                  "Cows",
                                  style: TextStyle(
                                      fontSize: 18, color: Colors.orange),
                                ),
                              ],
                            ),
                          ),
                          Card(
                            elevation: 8,
                            color: Colors.transparent,
                            child: Column(
                              children: <Widget>[
                                InkWell(
                                    onTap: () {
                                      //    interstitialAd.show();

                                      var route = new MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                            new PageFerm(valuee: 3),
                                      );
                                      Navigator.of(context).push(route);
                                    },
                                    child: Image.asset(
                                        'assets/images/coqcoq.png')),
                                new Text(
                                  "Chikens",
                                  style: TextStyle(
                                      fontSize: 18, color: Colors.deepOrange),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: new Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Card(
                            elevation: 8,
                            color: Colors.transparent,
                            child: Column(
                              children: <Widget>[
                                InkWell(
                                    onTap: () {
                                      //    interstitialAd.show();

                                      var route = new MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                            new PageFerm(valuee: 2),
                                      );
                                      Navigator.of(context).push(route);
                                    },
                                    child: Image.asset(
                                        'assets/images/horshors.png')),
                                new Text(
                                  "Hors",
                                  style: TextStyle(
                                      fontSize: 18, color: Colors.orangeAccent),
                                ),
                              ],
                            ),
                          ),
                          Card(
                            elevation: 8,
                            color: Colors.transparent,
                            child: Column(
                              children: <Widget>[
                                InkWell(
                                    onTap: () {
                                      //    interstitialAd.show();

                                      var route = new MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                            new PageFerm(valuee: 1),
                                      );
                                      Navigator.of(context).push(route);
                                    },
                                    child: Image.asset(
                                        'assets/images/moutonmouton.png')),
                                new Text(
                                  "Sheeps",
                                  style: TextStyle(
                                      fontSize: 18, color: Colors.orange),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
