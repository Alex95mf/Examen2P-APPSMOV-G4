import 'package:carousel_slider/carousel_slider.dart';
//import 'package:examen2p_appsmov_g4/utils/info.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import '/constants/colors.dart';

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
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.background,
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(
              Icons.music_note,
              color: AppColors.text_light,
            ),
            onPressed: (){
              //Navigator.of(context).pushNamed("/home");
            },
          ),
        ],
        title: Text(
          "Inicio",
          style: TextStyle(color: AppColors.text_light),
        ),
      ),
      body: _body(),
    );
  }
  Widget _body() {
    return ListView(
      children: [
        _carousel(),
        /*Padding(
          padding: EdgeInsets.all(10),
          child: Text("Discounts",
              style: TextStyle(
                  color: AppColors.text_light,
                  fontSize: 34,
                  fontWeight: FontWeight.bold)),
        ),
        Padding(
          padding: EdgeInsets.all(10),
          child: Text("Shirts",
              style: TextStyle(
                  color: AppColors.text_light,
                  fontSize: 30,
                  fontWeight: FontWeight.bold)),
        ),
        Padding(
          padding: EdgeInsets.all(10),
          child: Text("Pants",
              style: TextStyle(
                  color: AppColors.text_light,
                  fontSize: 30,
                  fontWeight: FontWeight.bold)),
        ),*/
      ],
    );
  }
  Widget _carousel() {
    return CarouselSlider(
      options: CarouselOptions(
        height: 180,
        enlargeCenterPage: true,
        autoPlay: true,
        aspectRatio: 16 / 9,
        autoPlayCurve: Curves.fastOutSlowIn,
        enableInfiniteScroll: false,
        autoPlayAnimationDuration: Duration(milliseconds: 800),
        autoPlayInterval: Duration(seconds: 8),
      ),
      items: [
        /*_carouselImage("assets/images/carousel1.jpg"),
        _carouselImage("assets/images/carousel2.jpg"),
        _carouselImage("assets/images/carousel3.jpg"),*/
      ],
    );
  }
  Widget _carouselImage(String path) {
    return Container(
      margin: EdgeInsets.all(5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
            image: AssetImage(path),
            fit: BoxFit.cover,
          )),
    );
  }
}