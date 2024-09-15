
import 'dart:convert';

import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:mad/model/book.dart';
import 'package:mad/model/data_route_arguments.dart';
import 'package:mad/routes.dart';
import 'package:badges/badges.dart' as badges;

import '../services/book_service.dart';

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
    //insertBook();
    //readBooks();
  }

  void insertBook() async{
    final book = Book(1,"ABC","Mr. Jor");
    BookService().insertBook(book);
    final book2 = Book(2,"XYZ","Mr. Joy");
    BookService().insertBook(book2);
  }

  void readBooks(){
    BookService().getBookList().then((books){
      print(books.length);
      books.forEach((e){
        print(e.title);
        print(e.author);
      });
    }).catchError((error){
      print(error);
    });
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
        title: Padding(
          padding: const EdgeInsets.only(bottom: 16.0, top: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("assets/images/beltei_iu_logo.png",
                width: 40,),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("សាកលវិទ្យាល័យ ប៊ែលធី អន្តរជាតិ", style: TextStyle(color: Colors.cyanAccent, fontWeight: FontWeight.bold),),
                    Text("BELTEI International University", style: TextStyle(fontSize: 16),)
                  ],
                ),
              ),
            ],
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: badges.Badge(
              showBadge: true,
              position: badges.BadgePosition.topEnd(top: 0, end: 10),
              child: IconButton(
                icon: Icon(Icons.notifications),
                onPressed: () {},
              ),
              badgeStyle: badges.BadgeStyle(
                badgeColor: Colors.red
              ),
              badgeContent: Text("10",
                style: TextStyle(color: Colors.white),
              ),
            ),
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
      height: 80,
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

    final menuTitleList1 = ["ព័ត៏មាន","បំប៉នភាសារ","បំប៉នគរុកោសល្យ","កម្មវិធីសិក្សារ"];
    final cardList1 = menuTitleList1.map((item) {
      return GestureDetector(
        child: _cardMenu(item),
        onTap: (){
          navigateToNewsScreen(item);
        },
      );
    }).toList();
    final row1 = Row(
      children: cardList1,
    );

    final menuTitleList2 = ["ទីតាំង","បណ្ណាល័យ","ប្រតិបត្តិការ"];
    final cardList2 = menuTitleList2.map((item) {
      return GestureDetector(
        child: _cardMenu(item , widthSize: item == "បណ្ណាល័យ" ? 2 : 4),
        onTap: (){
          navigateToNewsScreen(item);
        },
      );
    }).toList();
    final row2 = Row(
      children: cardList2,
    );

    final menuTitleList3 = ["អគារស្នាក់នៅ","គេហទំព័រ","បណ្តាញសង្គម","ឧកាសការងារ"];
    final cardList3 = menuTitleList3.map((item) {
      return GestureDetector(
        child: _cardMenu(item),
        onTap: (){
          navigateToNewsScreen(item);
        },
      );
    }).toList();
    final row3 = Row(
      children: cardList3,
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

  void navigateToNewsScreen(String item) async {

    // Method 1
    // final route = MaterialPageRoute(builder: (BuildContext context) => NewsScreen(newsTitle: "ព័ត៏មាន",));
    // final data = await Navigator.push(context, route);

    // Method 2
    DataRouteArguments dataRouteArguments = DataRouteArguments(item);
    final data = await Navigator.pushNamed(context, RouteGenerator.newsScreen, arguments: dataRouteArguments) as String ?? "";
    print("Data from NewsScreen using method POP: $data");
    setState(() {
      newsTitle = data;
    });
  }
}
