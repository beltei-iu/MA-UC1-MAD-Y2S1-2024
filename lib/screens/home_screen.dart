
import 'dart:async';
import 'dart:math';

import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:mad/routes.dart';
import 'package:mad/screens/news_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  String newsTitle = "ព័ត៏មាន";
  int _current = 0;
  final CarouselSliderController _controller = CarouselSliderController();

  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {

    final imageSlideList = [
      "assets/images/slide0.jpg",
      "assets/images/slide1.jpg",
      "assets/images/slide2.jpg",
      "assets/images/slide3.jpg",
      "assets/images/slide4.jpg",
    ];

    final List<Widget> imageSliders = imageSlideList.map((item) => Container(
      child: Container(
        margin: EdgeInsets.all(2.0),
        child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(5.0)),
            child: Stack(
              children: <Widget>[
                Image.asset(item, fit: BoxFit.cover, width: 1000.0),
                Positioned(
                  bottom: 0.0,
                  left: 0.0,
                  right: 0.0,
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Color.fromARGB(200, 0, 0, 0),
                          Color.fromARGB(0, 0, 0, 0)
                        ],
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                      ),
                    ),
                    padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                    child: Text('Welcome to BELTEI Internation School',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            )),
      ),
    )).toList();

    final homeScreen = Scaffold(
      appBar: AppBar(
        // title: Image.asset("assets/images/BELTEI_international_university_logo.png"),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/images/beltei_iu_logo.png",
              height: 50,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("សាកលវិទ្យាល័យ ប៊ែលធី អន្តរជាតិ"),
                Text("BELTEI International University", style: TextStyle(fontSize: 14),)
              ],
            ),
            SizedBox(height: 2,)
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(Icons.notifications),
          )
        ],
      ),
      body: ListView(
        children: [
          _buildCarouselSliderWidget(imageSliders),
          _buildLanguage,
          _appSloganWidget,
          _menuWidget
        ],
      ),
    );

    return homeScreen;
  }

  Widget _buildCarouselSliderWidget(List<Widget> imageSliders) {
    return SizedBox(
      height: 200,
      child: CarouselSlider(
        items: imageSliders,
        carouselController: _controller,
        options: CarouselOptions(
            autoPlay: true,
            enlargeCenterPage: true,
            aspectRatio: 2.0,
            onPageChanged: (index, reason) {
              setState(() {
                _current = index;
              });
            }),
      ),
    );
  }

  Widget _buildSlideItem(List<String> imageSlideList) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: imageSlideList.asMap().entries.map((entry) {
        return GestureDetector(
          onTap: () => _controller.animateToPage(entry.key),
          child: Container(
            width: 12.0,
            height: 12.0,
            margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: (Theme.of(context).brightness == Brightness.dark
                    ? Colors.white
                    : Colors.black)
                    .withOpacity(_current == entry.key ? 0.9 : 0.4)),
          ),
        );
      }).toList(),
    );
  }

  Widget get _buildLanguage {
    final khmerFlag = Padding(
      padding: const EdgeInsets.only(right: 2),
      child: Image.asset("assets/images/Flag_of_Cambodia.png", width: 40, height: 100,),
    );
    final englishFlag = Padding(
      padding: const EdgeInsets.only(right: 2),
      child: Image.asset("assets/images/Flag_of_United_Kingdom.png", width: 40,height: 100,),
    );
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          khmerFlag,
          englishFlag
        ],
      ),
    );
  }

  Widget get _appSloganWidget {

    final textSlogan = Text("អនាគតភាពជាអ្នកដឹកនាំ",
        style: TextStyle(
          color: Colors.white,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
    );

    final msgSlogan = Container(
      width: MediaQuery.of(context).size.width,
      height: 40,
      child: Center(child: textSlogan),
      color: const Color(0xFF018AAA),
    );
    
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        msgSlogan
      ],
    );
  }

  Widget _cardMenu(String name,{Icon? icon , int widthSize = 4}){
    return Container(
      width: MediaQuery.of(context).size.width / widthSize ,
      child: Card(
        elevation: 4,
        child: Center(
            child: Column(
              children: [
                Icon(Icons.newspaper),
                Text(name)
              ],
            )
        ),
      ),
    );
  }

  Widget get _menuWidget {
    final row1 = Row(
      children: [
        GestureDetector(
          child: _cardMenu(newsTitle),
          onTap: (){
            //RouteGenerator.key.currentState?.pushNamed(RouteGenerator.newsScreen, arguments: "ព័ត៏មាន");
            navigateToNewsScreen();

          },
        ),
        _cardMenu("ព័ត៏មាន"),
        _cardMenu("ព័ត៏មាន"),
        _cardMenu("ព័ត៏មាន"),
      ],
    );

    final row2 = Row(
      children: [
        _cardMenu("ព័ត៏មាន"),
        _cardMenu("ព័ត៏មាន", widthSize: 2),
        _cardMenu("ព័ត៏មាន"),
      ],
    );

    final row3 = Row(
      children: [
        _cardMenu("ព័ត៏មាន"),
        _cardMenu("ព័ត៏មាន"),
        _cardMenu("ព័ត៏មាន"),
        _cardMenu("ព័ត៏មាន"),
      ],
    );

    return Padding(
      padding: const EdgeInsets.only(top: 16),
      child: Column(
        children: [
          row1,
          row2,
          row3
        ],
      ),
    );
  }

  void navigateToNewsScreen() async {
    final route = MaterialPageRoute(builder: (BuildContext context) => NewsScreen(title: "ព័ត៏មាន",));
    final data = await Navigator.push(context, route);
    print("Data from NewsScreen using method POP: $data");
    setState(() {
      newsTitle = data!;
    });
  }
}
