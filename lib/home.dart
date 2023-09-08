import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
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
      ),
    );
  }
}
