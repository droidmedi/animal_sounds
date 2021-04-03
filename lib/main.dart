import 'package:animal_sounds/PageFerm.dart';
import 'package:animal_sounds/PageDomestique.dart';
import 'package:firebase_admob/firebase_admob.dart';
import 'package:flutter/material.dart';

import 'fermePic.dart';
import 'package:share/share.dart';

//import 'package:fluttertoast/fluttertoast.dart';

//void main() {
// runApp(new MaterialApp(home: new HomePage()));
//}
//const APP_ID = "ca-app-pub-8252478336271858/6028044195";
//const APP_ID = "ca-app-pub-3940256099942544/1033173712";

void main() => runApp(AnimalSounds());

class AnimalSounds extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    FirebaseAdMob.instance
        .initialize(appId: "ca-app-pub-8252478336271858~2076131403");

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
  /* void showColoredToast() {
    Fluttertoast.showToast(
        msg: "This is Colored Toast",
        toastLength: Toast.LENGTH_SHORT,
        backgroundColor: Colors.red,
        textColor: Colors.white);
  }*/

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: new Scaffold(
        backgroundColor: Colors.teal,
        appBar: new AppBar(
          backgroundColor: Colors.blueGrey,
          actions: <Widget>[
            new IconButton(
              icon: Icon(Icons.share),
              onPressed: () {
                final RenderBox box = context.findRenderObject();
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
          )),
          child: SingleChildScrollView(
            child: new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              //  crossAxisAlignment: CrossAxisAlignment.stretch,
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
                                            new PageFermPic(value: "2"),
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
