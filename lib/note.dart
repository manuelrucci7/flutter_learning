import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int count = 0;
  int _navigationBarIndex = 0;

  @override
  void initState() {
    // TODO: fetch data from firebase
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar:
            AppBar(backgroundColor: Colors.green, title: const Text("CIAO")),
        body: ListView.builder(
          itemBuilder: (_, index) {
            return Container(
              padding: EdgeInsets.fromLTRB(10, 20, 10, 20),
              decoration: BoxDecoration(
                color: Colors.blueAccent,
                border: Border(
                  bottom: BorderSide(
                    color: Colors.black, // Border color
                    width: 1.0, // Border width
                  ),
                ),
              ),
              child: SizedBox(
                child: Text('$count',
                    style: TextStyle(fontSize: 60),
                    textAlign: TextAlign.center),
              ),
            );
          },
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            //print("botton pressed");
            setState(() {
              count++;
            });
          },
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _navigationBarIndex,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.business), label: 'Business'),
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'School'),
          ],
          onTap: (index) {
            setState(() {
              _navigationBarIndex = index;
            });
            switch (index) {
              case 0:
                // Handle tap on Business
                break;
              case 1:
                // Handle tap on Home
                break;
              case 2:
                // Handle tap on School
                break;
              default:
                break;
            }
          },
        ),
        drawer: Drawer(
          child: Text("Heu"),
        ),
      ),
    );
  }
}

//Column(
//  mainAxisAlignment: MainAxisAlignment.spaceBetween,
//  crossAxisAlignment: CrossAxisAlignment.end,
//  children: const [
//    Expanded(
//      flex: 1,
//      child: Icon(Icons.backpack),
//    ),
//    Icon(Icons.leaderboard),
//    Icon(Icons.person),
//
//  ])

//Container(
//child: const Text("CIAO MANU"),
//margin: const EdgeInsets.fromLTRB(10, 20, 10, 20),
//padding: const EdgeInsets.all(10),
//color: Colors.amberAccent,
//height: 200,
//width: 400
//)

//Positioned(
//  child: Icon(Icons.verified),
//  top: 35,
//  left: 35,
//),
//Align(
//  child: Icon(Icons.backpack),
//  alignment: Alignment.center,
//),
