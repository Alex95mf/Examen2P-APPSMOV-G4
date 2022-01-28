import 'dart:async';

import 'package:examen2p_appsmov_g4/constants/colors.dart';
import 'package:examen2p_appsmov_g4/utils/util.dart';
import 'package:flutter/material.dart';

class SplashView extends StatefulWidget {
  @override
  _SplashView createState() => _SplashView();
}
class _SplashView extends State<SplashView> {
  Timer? _delaySplash;
  @override
  void initState() {
    super.initState();
    _delaySplash = Timer(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacementNamed("/login");
    });
  }
  @override
  void dispose() {
    super.dispose();
    _delaySplash!.cancel();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: AppColors.text_dark,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: Util.sizeScreen(context: context).width *
                  0.40,
              height: Util.sizeScreen(context: context).width *
                  0.40,
              child: Image(image: AssetImage('assets/images/play.png')
              ),
              //child: Icon(Icons.shopping_cart, color:
              //AppColors.text_dark,size: 150,),
            ),
            const SizedBox(
              height: 16,
            ),
            const Text(
              "BIENVENIDO",
              style: TextStyle(
                  fontSize: 40,
                  color: AppColors.text_light,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}