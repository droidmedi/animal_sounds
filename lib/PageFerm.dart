import 'package:flutter/material.dart';
//import 'package:audioplayers/audio_cache.dart';
//import 'package:firebase_admob/firebase_admob.dart';
import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'ad_helper.dart';

const String testDevice = '';
const int maxFailedLoadAttempts = 3;

class PageFerm extends StatefulWidget {

  final int valuee;



  PageFerm({Key? key, required this.valuee}) : super(key: key);


  @override
  _PageFermState createState() => _PageFermState();
}

class _PageFermState extends State<PageFerm> {


  AssetsAudioPlayer _assetsAudioPlayer = AssetsAudioPlayer();
  late BannerAd _bottomBannerAd;
  bool _isBottomBannerAdLoaded = false;
  InterstitialAd? _interstitialAd;
  int _interstitialLoadAttempts = 0;



  void _createInterstitialAd() {
    InterstitialAd.load(
      adUnitId: AdHelper.interstitialAdUnitId,
      request: AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded: (InterstitialAd ad) {
          _interstitialAd = ad;
          _interstitialLoadAttempts = 0;
        },
        onAdFailedToLoad: (LoadAdError error) {
          _interstitialLoadAttempts += 1;
          _interstitialAd = null;
          if (_interstitialLoadAttempts <= maxFailedLoadAttempts) {
            _createInterstitialAd();
          }
        },
      ),
    );
  }
  void _showInterstitialAd() {
    if (_interstitialAd != null) {
      _interstitialAd!.fullScreenContentCallback = FullScreenContentCallback(
        onAdDismissedFullScreenContent: (InterstitialAd ad) {
          ad.dispose();
          _createInterstitialAd();
        },
        onAdFailedToShowFullScreenContent: (InterstitialAd ad, AdError error) {
          ad.dispose();
          _createInterstitialAd();
        },
      );
      _interstitialAd!.show();
    }
  }

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
    _createInterstitialAd();
  }

  @override
  void dispose() {
    super.dispose();
    _bottomBannerAd.dispose();
    _interstitialAd?.dispose();
  }


  @override
  Widget build(BuildContext context) {



    return MaterialApp(
      home: DefaultTabController(
        length: 4,initialIndex: widget.valuee,
        child: Scaffold(
          bottomNavigationBar: _isBottomBannerAdLoaded
              ? Container(
            height: _bottomBannerAd.size.height.toDouble(),
            width: _bottomBannerAd.size.width.toDouble(),
            child: AdWidget(ad: _bottomBannerAd),
          )
              : null,
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
                              _showInterstitialAd();
                              _assetsAudioPlayer.open(Audio(
                                  "/assets/vache1.mp3",
                              ));

                            },
                            child: Image.asset('assets/images/cow2.jpg')
                        )
                    ),
                    Card(
                        child: InkWell(
                            onTap: () {
                              _assetsAudioPlayer.open(Audio(
                                "/assets/vache1.mp3",
                              ));

                            },
                            child: Image.asset('assets/images/cow4.jpg'))),
                    Card(
                        child: InkWell(
                            onTap: () {

                              _assetsAudioPlayer.open(Audio(
                                "/assets/vache2.mp3",
                              ));
                              //audioCache.play('vache2.mp3');
                            },
                            child: Image.asset('assets/images/cow3.jpg'))),
                    Card(
                        child: InkWell(
                            onTap: () {
                              _assetsAudioPlayer.open(Audio(
                                "/assets/vache3.mp3",
                              ));
                              //audioCache.play('vache3.mp3');
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
                              _showInterstitialAd();
                              _assetsAudioPlayer.open(Audio(
                                "/assets/sheep3.mp3",
                              ));
                              //audioCache.play('sheep4.mp3');
                            },
                            child: Image.asset('assets/images/mouton3.jpg'))),
                    Card(
                        child: InkWell(
                            onTap: () {
                              _assetsAudioPlayer.open(Audio(
                                "/assets/sheep2.mp3",
                              ));
                              //audioCache.play('sheep2.mp3');
                            },
                            child: Image.asset('assets/images/mouton1.jpg'))),
                    Card(
                        child: InkWell(
                            onTap: () {
                              //audioCache.play('sheep3.mp3');
                              _assetsAudioPlayer.open(Audio(
                                "/assets/sheep4.mp3",
                              ));
                            },
                            child: Image.asset('assets/images/mouton2.jpg'))),
                    Card(
                        child: InkWell(
                            onTap: () {
                              _assetsAudioPlayer.open(Audio(
                                "/assets/sheep5.mp3",
                              ));
                              //audioCache.play('sheep5.mp3');
                            },
                            child: Image.asset('assets/images/mouton4.jpg'))),
                    Card(
                        child: InkWell(
                            onTap: () {

                              _assetsAudioPlayer.open(Audio(
                                "/assets/sheep1.mp3",
                              ));
                              //audioCache.play('sheep5.mp3');
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
                              _assetsAudioPlayer.open(Audio(
                                "/assets/hors1.mp3",
                              ));
                              //audioCache.play('hors1.mp3');
                            },
                            child: Image.asset('assets/images/hors4.jpg'))),
                    Card(
                        child: InkWell(
                            onTap: () {
                              _assetsAudioPlayer.open(Audio(
                                "/assets/hors2.mp3",
                              ));
                              //audioCache.play('hors2.mp3');
                            },
                            child: Image.asset('assets/images/hors1.jpg'))),
                    Card(
                        child: InkWell(
                            onTap: () {
                              _showInterstitialAd();
                              _assetsAudioPlayer.open(Audio(
                                "/assets/horswolking.mp3",
                              ));
                              //audioCache.play('horswolking.mp3');
                            },
                            child: Image.asset('assets/images/hors2.jpg'))),
                    Card(
                        child: InkWell(
                            onTap: () {


                              _assetsAudioPlayer.open(Audio(
                                "/assets/hors3.mp3",
                              ));
                              //audioCache.play('hors3.mp3');
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

                              _assetsAudioPlayer.open(Audio(
                                "/assets/canard1.mp3",
                              ));
                              //audioCache.play('canard1.mp3');
                            },
                            child: Image.asset('assets/images/canard1.jpg'))),
                    Card(
                        child: InkWell(
                            onTap: () {
                              _assetsAudioPlayer.open(Audio(
                                "/assets/chiken2.mp3",
                              ));
                              //audioCache.play('chiken2.mp3');
                            },
                            child: Image.asset('assets/images/coq1.jpg'))),
                    Card(
                        child: InkWell(
                            onTap: () {
                              _assetsAudioPlayer.open(Audio(
                                "/assets/coq2.mp3",
                              ));
                              //audioCache.play('coq2.mp3');
                            },
                            child: Image.asset('assets/images/coq2.jpg'))),
                    Card(
                        child: InkWell(
                            onTap: () {
                              _assetsAudioPlayer.open(Audio(
                                "/assets/bibi.mp3",
                              ));
                              //audioCache.play('bibi.mp3');
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