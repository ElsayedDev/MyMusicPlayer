import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';
import 'package:assets_audio_player/assets_audio_player.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(textTheme: GoogleFonts.robotoTextTheme()),
      home: Scaffold(
        backgroundColor: Colors.grey[90],
        body: MusicPlayer(),
      ),
    );
  }
}

class MusicPlayer extends StatefulWidget {
  @override
  _MusicPlayerState createState() => _MusicPlayerState();
}

class _MusicPlayerState extends State<MusicPlayer> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 20),
            child: Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    left: 10,
                    right: 16,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Hello ',
                        style: GoogleFonts.roboto(
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                          // color: Color.fromRGBO(97, 97, 97, 1),
                          color: Color.fromRGBO(158, 158, 158, 1),
                        ),
                      ),
                      Text(
                        'Adele',
                        style: GoogleFonts.roboto(
                          fontWeight: FontWeight.w100,
                          fontSize: 16,
                          color: Color.fromRGBO(158, 158, 158, 1),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(child: SizedBox()),
                Container(
                  decoration: BoxDecoration(
                      color: Color.fromRGBO(245, 245, 245, 1),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        bottomLeft: Radius.circular(20),
                      )),
                  width: 50,
                  height: 45,
                  alignment: Alignment(-0.8, 0),
                  child: ButtonTheme(
                    height: 45,
                    minWidth: 100,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          bottomLeft: Radius.circular(20)),
                    ),
                    child: FlatButton(
                      onPressed: () {
                        print('clicked');
                        
                          final assetsAudioPlayer = AssetsAudioPlayer();

                          try {
                            assetsAudioPlayer.open(
                              Audio.network(
                                  "http://server11.mp3quran.net/yasser/001.mp3"),
                            );
                            assetsAudioPlayer.play();
                          } catch (t) {
                            print('احااااا');
                            //mp3 unreachable
                          }
                        
                        print('clicked 2 fdsfdsfds fds 24214214241 24124 124');
                      },
                      child: Icon(
                        Icons.search,
                        color: Color.fromRGBO(158, 158, 158, 0.6),
                        size: 20,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          Expanded(child: SizedBox()),
          // Expanded(child: SizedBox()),
          Padding(
            padding: EdgeInsets.only(
              left: 18,
              right: 16,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Hello, it\'s me\n\n',
                  style: GoogleFonts.roboto(
                    fontWeight: FontWeight.normal,
                    fontSize: 18,
                    color: Color.fromRGBO(158, 158, 158, 1),
                  ),
                ),
                Text(
                  'I was wondering if after all these years you\'d like to meet\n\n',
                  style: GoogleFonts.roboto(
                      fontWeight: FontWeight.normal,
                      fontSize: 18,
                      color: Colors.black),
                ),
                Text(
                  'To go over everything',
                  style: GoogleFonts.roboto(
                    fontWeight: FontWeight.normal,
                    fontSize: 18,
                    color: Color.fromRGBO(158, 158, 158, 0.5),
                  ),
                ),
              ],
            ),
          ),
          Expanded(child: SizedBox()),
          Padding(
            padding: EdgeInsets.only(bottom: 20),
            child: Container(
              height: 150,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(245, 245, 245, 1),
                        borderRadius: BorderRadius.all(
                          Radius.circular(70),
                        )),
                    width: 300,
                    height: 50,
                    child: Padding(
                      padding: EdgeInsets.only(left: 20),
                      child: Row(
                        //bar
                        children: [
                          Text('03:10',
                              style: TextStyle(
                                  color: Color.fromRGBO(176, 176, 176, 1))),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    right: 1,
                    child: Stack(children: [
                      CircularSliderWidget(),
                      CircleAvatar(
                        backgroundColor: Colors.amber,
                      )
                    ]),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CircularSliderWidget extends StatelessWidget {
  const CircularSliderWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SleekCircularSlider(
      appearance: CircularSliderAppearance(
        infoProperties: InfoProperties(
            mainLabelStyle: TextStyle(color: Colors.transparent)),
        angleRange: 180,
        startAngle: 180,
        size: 100,
        customColors: CustomSliderColors(
            trackColor: Colors.transparent,
            dotColor: Colors.black87,
            progressBarColor: Colors.black87),
        customWidths: CustomSliderWidths(progressBarWidth: 2, handlerSize: 7),
      ),
      onChange: (double value) {
        print(value.toInt());
      },
    );
  }
}

