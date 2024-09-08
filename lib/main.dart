import 'package:flutter/material.dart';
import 'screens/splash_screen.dart';

void main() {
  runApp(App());
}

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {


  int _currentIndex= 0;
  bool _checked = false;

  @override
  Widget build(BuildContext context) {


    // -- SplashScreen
    final myLogo = Center(
      child: Image.asset("assets/images/beltei_iu_logo.png",
        height: 150,),
    );

    final myGetStart = Padding(
      padding: const EdgeInsets.all(16),
      child: Container(
          width: MediaQuery.of(context).size.width,
          height: 40,
          child: ElevatedButton(onPressed: (){}, child: Text("Get Start"))
      ),
    );

    final mySplashScreen = Scaffold(
      body: Column(
        children: [
          Expanded(child: myLogo),
          myGetStart
        ],
      ),
    );
    // ---------

    // -- Main Screen
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
          Checkbox(value: _checked, onChanged: (v){
            setState(() {
              _checked = !_checked;
            });
          }),
          Text("Hello World")
        ],
      ),
    );


    final classScreen = Scaffold(
      appBar: AppBar(
        title: Text("Classroom"),
        centerTitle: true,
        elevation: 5,
      ),
      body: Center(
        child: Text("No Class"),
      ),
    );


    final notificationCheckBox = Card(
      child: ListTile(
        leading: Icon(Icons.notifications),
        title: Text("Notification"),
        trailing: Checkbox(value: false, onChanged: (v){}),
      ),
    );

    final languageItem = Card(
      child: ListTile(
        leading: Icon(Icons.language),
        title: Text("Language"),
        trailing: Icon(Icons.navigate_next),
      ),
    );


    final moreScreen = Scaffold(
      appBar: AppBar(
        title: Text("More"),
        centerTitle: true,
        elevation: 5,
      ),
      body: ListView(
        children: [
          notificationCheckBox,
          languageItem
        ],
      ),
    );




    List<Widget> screenList = [
      homeScreen,
      classScreen,
      moreScreen
    ];

    List<BottomNavigationBarItem> myBottomNavigationBarItemList = [
      BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
      BottomNavigationBarItem(icon: Icon(Icons.class_rounded), label: "Class"),
      BottomNavigationBarItem(icon: Icon(Icons.more_vert), label: "More"),
    ];

    final mainScreen = Scaffold(
      body: screenList.elementAt(_currentIndex),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        items: myBottomNavigationBarItemList,
        elevation: 5,
        onTap: (index){
            setState(() {
              _currentIndex = index;
            });
        },

      ),
    );

    return MaterialApp(
      title: 'AMAD',
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF018AAA)),
          useMaterial3: false,
          primaryColor: const Color(0xFF018AAA)
      ),
      home: mainScreen,
      debugShowCheckedModeBanner: false,
    );
  }
}