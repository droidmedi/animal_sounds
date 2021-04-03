import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';
import 'package:firebase_admob/firebase_admob.dart';
//import 'package:assets_audio_player/assets_audio_player.dart';

const String testDevice = '';

class PageFerm extends StatefulWidget {

  final int valuee;

  PageFerm({Key key, this.valuee}) : super(key: key);

  @override
  _PageFermState createState() => _PageFermState();
}

class _PageFermState extends State<PageFerm> {



  static final MobileAdTargetingInfo targetingInfo = MobileAdTargetingInfo(
  //    testDevices: testDevice != null ? <String>[testDevice] : null,
    keywords: ['Animal Sounds', 'animal farm Sounds','sons des animeaux domestique','animeux de le ferme'],
    
    childDirected: true,
  );
 /* BannerAd myBanner = BannerAd(
    // Replace the testAdUnitId with an ad unit id from the AdMob dash.
    // https://developers.google.com/admob/android/test-ads
    // https://developers.google.com/admob/ios/test-ads
    adUnitId: "ca-app-pub-3940256099942544/6300978111",
    size: AdSize.smartBanner,
    targetingInfo: targetingInfo,
    listener: (MobileAdEvent event) {
      print("BannerAd event is $event");
    },
  );*/

  InterstitialAd myInterstitial = InterstitialAd(
    // Replace the testAdUnitId with an ad unit id from the AdMob dash.
    // https://developers.google.com/admob/android/test-ads
    // https://developers.google.com/admob/ios/test-ads
    adUnitId: "ca-app-pub-8252478336271858/6028044195",
    targetingInfo: targetingInfo,
    listener: (MobileAdEvent event) {
      print("InterstitialAd event is $event");
    },
  );
AudioCache audioCache = new AudioCache();
 // AssetsAudioPlayer _assetsAudioPlayer = AssetsAudioPlayer();
  @override
  Widget build(BuildContext context) {

    FirebaseAdMob.instance.initialize(appId: "ca-app-pub-8252478336271858~2076131403");
    // bannerAd = buildBanner()..load()..show();
    /*myBanner
    // typically this happens well before the ad is shown
      ..load()
      ..show(
        // Positions the banner ad 60 pixels from the bottom of the screen
        anchorOffset: 80.0,
        // Banner Position
        anchorType: AnchorType.top,
      );
*/
    return MaterialApp(
      home: DefaultTabController(
        length: 4,initialIndex: widget.valuee,
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
                         //     _assetsAudioPlayer.open(Audio(
                           //       "/assets/sounds/vache1.mp3" ));
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
                              myInterstitial
                                ..load()
                                ..show(
                                  anchorType: AnchorType.bottom,
                                  anchorOffset: 0.0,
                                );
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
                              myInterstitial
                                ..load()
                                ..show(
                                  anchorType: AnchorType.bottom,
                                  anchorOffset: 0.0,
                                );
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
                              myInterstitial
                                ..load()
                                ..show(
                                  anchorType: AnchorType.bottom,
                                  anchorOffset: 0.0,
                                );
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