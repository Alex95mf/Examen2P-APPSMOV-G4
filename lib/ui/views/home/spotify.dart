import 'package:carousel_slider/carousel_slider.dart';
//import 'package:examen2p_appsmov_g4/utils/info.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:examen2p_appsmov_g4/constants/colors.dart';

class ForYouView extends StatefulWidget {
  const ForYouView({Key? key}) : super(key: key);
  @override
  _ForYouView createState() => _ForYouView();
}
class _ForYouView extends State<ForYouView> {
  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.background,
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(
              Icons.music_note,
              color: AppColors.text_light,
            ),
            onPressed: () => Navigator.of(context)
                .pushNamed("/home"),
          ),
        ],
        title: Text(
          "Spotify",
          style: TextStyle(color: AppColors.text_light),
        ),
      ),*/
      body: _body(),
    );
  }
  Widget _body() {
    return Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [
                Color.fromRGBO(40, 96, 65, 7.0),
                Color(0xFF191414)
              ],
              begin: Alignment.topLeft,
              end: FractionalOffset(0.3, 0.3)
          ),
        ),
        child: ListView(
          children: <Widget>[
            SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.all(45.0),
                    height: 250,
                    child: Column(
                      children: <Widget>[
                        Text('Reproducido Recientemente', style: TextStyle(color: Colors.white.withOpacity(1.0),
                          fontSize: 19.0,
                          fontFamily: 'SpotifyFont',
                          fontWeight: FontWeight.bold,
                        ),),
                      ],
                    ),
                  ),/*
                Padding(padding: EdgeInsets.all(10.0),),
                Container(
                  height: 165.0,
                  child: ListView.builder(
                    itemCount: 10.0,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, int index){
                      return Column(
                        children: <Widget>[
                          SizedBox(
                            height: 100.0,
                            width: 100.0,
                            child: ,
                          )
                        ],
                      )
                    },
                  ),
                ),*/
                ],
              ),
            )
          ],
        )
    );
  }
}