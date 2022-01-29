import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:examen2p_appsmov_g4/constants/colors.dart';
import 'package:examen2p_appsmov_g4/ui/views/home/userinfo.dart';
import 'package:examen2p_appsmov_g4/ui/views/home/spotify.dart';
import 'package:examen2p_appsmov_g4/ui/views/home/logout.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  _HomeView createState() => _HomeView();
}
class _HomeView extends State<HomeView> {
  int _currentPage = 1;
  PageController? _pageController;
  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _currentPage,
        keepPage: true);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: _bottomBar(),
      body: PageView(
        controller: _pageController,
        children: [Explore(),ForYouView(),Settings()],
        onPageChanged: (int index) {
          setState(() {
            _currentPage = index;
          });
        },
      ),
    );
  }
  CurvedNavigationBar _bottomBar() {
    return CurvedNavigationBar(
      index: _currentPage,
      color: AppColors.finalColor,
      backgroundColor: AppColors.background,
      animationDuration: const Duration(milliseconds: 300),
      items: const <Widget>[//auto_awesome_mosaic_rounded
        Icon(Icons.menu, size: 30, color: AppColors.text_dark,),
        Icon(Icons.home, size: 30, color: AppColors.text_dark,),
        Icon(Icons.logout, size: 30, color: AppColors.text_dark,),
      ],
      onTap: (int index) {
        setState(() {
          _currentPage = index;
          _pageController!.animateToPage(index,
              duration: const Duration(milliseconds: 300),
              curve: Curves.ease);
        });
      },
    );
  }
}