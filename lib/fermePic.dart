import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';
import 'package:firebase_admob/firebase_admob.dart';




//const APP_ID = "ca-app-pub-8252478336271858~2076131403";
//const APP_ID = "ca-app-pub-3940256099942544/1033173712";
//const APP_ID = "ca-app-pub-8252478336271858/6028044195";
//const String testDevice = '';



class PageFermPic extends StatelessWidget {

  final String value;

  PageFermPic({Key key, this.value}) : super(key: key);





  static final MobileAdTargetingInfo targetingInfo = MobileAdTargetingInfo(
  //  testDevices: testDevice != null ? <String>[testDevice] : null
    keywords: ['Animal Sounds', 'animal farm Sounds','sons des animaux domestique','animaux de le ferme'],
    
    childDirected: true,
  );
  BannerAd bannerAd;
  InterstitialAd interstitialAd;
  BannerAd buildBanner() {
    return BannerAd(
        adUnitId: BannerAd.testAdUnitId,
        size: AdSize.banner,
        listener: (MobileAdEvent event) {
          print(event);
        });
  }

  InterstitialAd buildInterstitial() {
    return InterstitialAd(
        adUnitId: "ca-app-pub-8252478336271858/6028044195",
        targetingInfo: targetingInfo,
        listener: (MobileAdEvent event) {
          if (event == MobileAdEvent.failedToLoad) {
            interstitialAd..load();
          } else if (event == MobileAdEvent.closed) {
            interstitialAd = buildInterstitial()..load();
          }
          print(event);
        });
  }
  AudioCache audioCache = new AudioCache();


  @override
  Widget build(BuildContext context) {
    FirebaseAdMob.instance.initialize(appId: "ca-app-pub-8252478336271858~2076131403");
   // bannerAd = buildBanner()..load()..show();

    interstitialAd = buildInterstitial()..load();
    return MaterialApp(
      home: DefaultTabController(
        length: 4,initialIndex: 0,
        child: Scaffold(
          appBar: AppBar(
            actions: <Widget>[

              new IconButton(
                icon: Icon(Icons.home),
                onPressed: (){
                  Navigator.pop(context);
                },
              ),
            ],
            bottom: TabBar(

              indicatorColor: Colors.lightGreenAccent,
              unselectedLabelColor: Colors.white70,
              labelColor: Colors.lightGreenAccent,
              labelStyle: TextStyle(fontSize: 20.0),
              tabs: [

                Tab(

                  text: "cows",

                ),
                Tab(
                  text: "sheep",
                ),
                Tab(
                  text: "HORS",
                ),
                Tab(
                  text: "Poultry",
                ),
              ],
            ),
            title: Text('farm animals'),
          ),
          body: TabBarView(
            children: [


              SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    Card(
                        child: InkWell(
                            onTap: () {
                              audioCache.play('vache1.mp3');
                            },
                            child: Image.asset('assets/images/cow2.jpg'))),
                    Card(
                        child: InkWell(
                            onTap: () {
                              audioCache.play('vache1.mp3');
                            },
                            child: Image.asset('assets/images/cow4.jpg'))),
                    Card(
                        child: InkWell(
                            onTap: () {
                              interstitialAd.show();
                              audioCache.play('vache2.mp3');
                            },
                            child: Image.asset('assets/images/cow3.jpg'))),
                    Card(
                        child: InkWell(
                            onTap: () {
                              audioCache.play('vache3.mp3');
                            },
                            child: Image.asset('assets/images/cow1.jpg'))),
                  ],
                ),
              ),

              SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    Card(
                        child: InkWell(
                            onTap: () {
                              audioCache.play('sheep4.mp3');
                            },
                            child: Image.asset('assets/images/mouton3.jpg'))),
                    Card(
                        child: InkWell(
                            onTap: () {
                              audioCache.play('sheep2.mp3');
                            },
                            child: Image.asset('assets/images/mouton1.jpg'))),
                    Card(
                        child: InkWell(
                            onTap: () {
                              audioCache.play('sheep3.mp3');
                            },
                            child: Image.asset('assets/images/mouton2.jpg'))),
                    Card(
                        child: InkWell(
                            onTap: () {
                              audioCache.play('sheep5.mp3');
                            },
                            child: Image.asset('assets/images/mouton4.jpg'))),
                    Card(
                        child: InkWell(
                            onTap: () {
                            interstitialAd.show();
                              audioCache.play('sheep5.mp3');
                            },
                            child: Image.asset('assets/images/mouton5.jpg'))),
                  ],
                ),
              ),

              SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    Card(
                        child: InkWell(
                            onTap: () {
                              audioCache.play('hors1.mp3');
                            },
                            child: Image.asset('assets/images/hors4.jpg'))),
                    Card(
                        child: InkWell(
                            onTap: () {
                              audioCache.play('hors2.mp3');
                            },
                            child: Image.asset('assets/images/hors1.jpg'))),
                    Card(
                        child: InkWell(
                            onTap: () {
                              audioCache.play('horswolking.mp3');
                            },
                            child: Image.asset('assets/images/hors2.jpg'))),
                    Card(
                        child: InkWell(
                            onTap: () {
                              interstitialAd.show();
                              audioCache.play('hors3.mp3');
                            },
                            child: Image.asset('assets/images/hors3.jpg'))),
                  ],
                ),
              ),

              SingleChildScrollView(
                child: Column(
                  //      crossAxisAlignment: CrossAxisAlignment.center,
                  //    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Card(
                        child: InkWell(
                            onTap: () {
                              audioCache.play('canard1.mp3');
                            },
                            child: Image.asset('assets/images/canard1.jpg'))),
                    Card(
                        child: InkWell(
                            onTap: () {
                              audioCache.play('chiken2.mp3');
                            },
                            child: Image.asset('assets/images/coq1.jpg'))),
                    Card(
                        child: InkWell(
                            onTap: () {
                              audioCache.play('coq2.mp3');
                            },
                            child: Image.asset('assets/images/coq2.jpg'))),
                    Card(
                        child: InkWell(
                            onTap: () {
                              audioCache.play('bibi.mp3');
                            },
                            child: Image.asset('assets/images/dind.jpg'))),
                   /* Card(
                      child: ButtonTheme(
                        minWidth: 150.0,
                        height: 80.0,
                        child: RaisedButton(
                            child: Text(
                              "SELECT",
                              style: new TextStyle(fontSize: 20.0),
                            ),
                            textColor: Colors.deepPurple,
                            elevation: 13.0,
                            color: Colors.green,
                            disabledColor: Colors.red,
                            splashColor: Colors.amber,
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  new MaterialPageRoute(
                                      builder: (context) => new Page1()));
                            }),
                      ),
                    )*/
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}