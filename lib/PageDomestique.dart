import 'package:flutter/material.dart';
//import 'package:audioplayers/audio_cache.dart';
//import 'package:firebase_admob/firebase_admob.dart';
import 'package:assets_audio_player/assets_audio_player.dart';



class PageDomestique extends StatefulWidget {

  final int valuee;

  PageDomestique({Key? key, required this.valuee}) : super(key: key);

  @override
  _PageDomestiqueState createState() => _PageDomestiqueState();
}

class _PageDomestiqueState extends State<PageDomestique> {


  AssetsAudioPlayer _assetsAudioPlayer = AssetsAudioPlayer();






  //AudioCache audioCache = new AudioCache();
  @override
  Widget build(BuildContext context) {





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
                              _assetsAudioPlayer.open(Audio(
                                "/assets/cat3.mp3",
                              ));

//                             audioCache.play('cat3.mp3');
                            },
                            child: Image.asset('assets/images/cat2.jpg'))),
                    Card(
                        child: InkWell(
                            onTap: () {
                              _assetsAudioPlayer.open(Audio(
                                "/assets/cat9.mp3",
                              ));
  //                            audioCache.play('cat9.mp3');
                            },
                            child: Image.asset('assets/images/cat3.jpg'))),
                    Card(
                        child: InkWell(
                            onTap: () {
                              _assetsAudioPlayer.open(Audio(
                                "/assets/cat8.mp3",
                              ));
    //                          audioCache.play('cat8.mp3');
                            },
                            child: Image.asset('assets/images/cat4.jpg'))),
                    Card(
                        child: InkWell(
                            onTap: () {
                              _assetsAudioPlayer.open(Audio(
                                "/assets/cat4.mp3",
                              ));
      //                        audioCache.play('cat4.mp3');
                            },
                            child: Image.asset('assets/images/cat5.jpg'))),
                    Card(
                        child: InkWell(
                            onTap: () {
                              _assetsAudioPlayer.open(Audio(
                                "/assets/cat1.mp3",
                              ));
  //                            audioCache.play('cat1.mp3');
                            },
                            child: Image.asset('assets/images/cat6.jpg'))),
                    Card(
                        child: InkWell(
                            onTap: () {
                              _assetsAudioPlayer.open(Audio(
                                "/assets/cat6.mp3",
                              ));
    //                          audioCache.play('cat6.mp3');
                            },
                            child: Image.asset('assets/images/cat7.jpg'))),
                    Card(
                        child: InkWell(
                            onTap: () {
                              _assetsAudioPlayer.open(Audio(
                                "/assets/cat7.mp3",
                              ));
      //                       audioCache.play('cat7.mp3');

                            },
                            child: Image.asset('assets/images/cat8.jpg'))),
                    Card(
                        child: InkWell(
                            onTap: () {

                              _assetsAudioPlayer.open(Audio(
                                "/assets/cat5.mp3",
                              ));
        //                      audioCache.play('cat5.mp3');
                            },
                            child: Image.asset('assets/images/cat9.jpg'))),
                    Card(
                        child: InkWell(
                            onTap: () {
                              _assetsAudioPlayer.open(Audio(
                                "/assets/cat2.mp3",
                              ));
     //                         audioCache.play('cat2.mp3');
                            },
                            child: Image.asset('assets/images/cat1.jpg'))),
                    Card(
                        child: InkWell(
                            onTap: () {
                              _assetsAudioPlayer.open(Audio(
                                "/assets/cat7.mp3",
                              ));
       //                       audioCache.play('cat7.mp3');
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
                              _assetsAudioPlayer.open(Audio(
                                "/assets/dog2.mp3",
                              ));
   //                           audioCache.play('dog2.mp3');
                            },
                            child: Image.asset('assets/images/dog1.jpg'))),
                    Card(
                        child: InkWell(
                            onTap: () {
                              _assetsAudioPlayer.open(Audio(
                                "/assets/dogdoberman.mp3",
                              ));
     //                         audioCache.play('dogdoberman.mp3');
                            },
                            child: Image.asset('assets/images/dog2.jpg'))),
                    Card(
                        child: InkWell(
                            onTap: () {
                              _assetsAudioPlayer.open(Audio(
                                "/assets/dog4.mp3",
                              ));
       //                       audioCache.play('dog4.mp3');
                            },
                            child: Image.asset('assets/images/dog3.jpg'))),
                    Card(
                        child: InkWell(
                            onTap: () {
                              _assetsAudioPlayer.open(Audio(
                                "/assets/dog3.mp3",
                              ));
         //                    audioCache.play('dog3.mp3');
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

