import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';
import 'package:firebase_admob/firebase_admob.dart';
//import 'package:assets_audio_player/assets_audio_player.dart';



class PageDomestique extends StatefulWidget {

  final int valuee;

  PageDomestique({Key key, this.valuee}) : super(key: key);

  @override
  _PageDomestiqueState createState() => _PageDomestiqueState();
}

class _PageDomestiqueState extends State<PageDomestique> {

  static final MobileAdTargetingInfo targetingInfo = MobileAdTargetingInfo(
    //  testDevices: testDevice != null ? <String>[testDevice] : null
    keywords: ['Animal Sounds', 'animal farm Sounds','sons des animeaux domestique','animeux de le ferme'],
    
    childDirected: true,
  );


  InterstitialAd interstitialAd;
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

    interstitialAd = buildInterstitial()..load();

    return MaterialApp(
      home: DefaultTabController(
        length: 2,initialIndex: widget.valuee,
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
                Tab(text: 'CATS'),
                Tab(
                  text: "DOGS",
                ),

              ],
            ),
            title: Text('Pets'),
          ),
          body: TabBarView(
            children: [


              SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    Card(
                        child: InkWell(
                            onTap: () {

                             audioCache.play('cat3.mp3');
                            },
                            child: Image.asset('assets/images/cat2.jpg'))),
                    Card(
                        child: InkWell(
                            onTap: () {
                              audioCache.play('cat9.mp3');
                            },
                            child: Image.asset('assets/images/cat3.jpg'))),
                    Card(
                        child: InkWell(
                            onTap: () {
                              audioCache.play('cat8.mp3');
                            },
                            child: Image.asset('assets/images/cat4.jpg'))),
                    Card(
                        child: InkWell(
                            onTap: () {
                              audioCache.play('cat4.mp3');
                            },
                            child: Image.asset('assets/images/cat5.jpg'))),
                    Card(
                        child: InkWell(
                            onTap: () {
                              audioCache.play('cat1.mp3');
                            },
                            child: Image.asset('assets/images/cat6.jpg'))),
                    Card(
                        child: InkWell(
                            onTap: () {
                              audioCache.play('cat6.mp3');
                            },
                            child: Image.asset('assets/images/cat7.jpg'))),
                    Card(
                        child: InkWell(
                            onTap: () {

                             audioCache.play('cat7.mp3');

                            },
                            child: Image.asset('assets/images/cat8.jpg'))),
                    Card(
                        child: InkWell(
                            onTap: () {
                              interstitialAd.show();
                              audioCache.play('cat5.mp3');
                            },
                            child: Image.asset('assets/images/cat9.jpg'))),
                    Card(
                        child: InkWell(
                            onTap: () {
                              audioCache.play('cat2.mp3');
                            },
                            child: Image.asset('assets/images/cat1.jpg'))),
                    Card(
                        child: InkWell(
                            onTap: () {
                              audioCache.play('cat7.mp3');
                            },
                            child: Image.asset('assets/images/cat10.jpg'))),
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
                              audioCache.play('dog2.mp3');
                            },
                            child: Image.asset('assets/images/dog1.jpg'))),
                    Card(
                        child: InkWell(
                            onTap: () {
                              audioCache.play('dogdoberman.mp3');
                            },
                            child: Image.asset('assets/images/dog2.jpg'))),
                    Card(
                        child: InkWell(
                            onTap: () {
                              audioCache.play('dog4.mp3');
                            },
                            child: Image.asset('assets/images/dog3.jpg'))),
                    Card(
                        child: InkWell(
                            onTap: () {
                             audioCache.play('dog3.mp3');
                            },
                            child: Image.asset('assets/images/dog4.jpg'))),

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

