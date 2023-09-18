import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:typed_data';
import 'package:learning/post.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(context),
      //floatingActionButton: FloatingActionButton(
      //  child: Icon(Icons.add),
      //  onPressed: () {
      //    //print("botton pressed");
      //    setState(() {
      //      print("JKj");
      //    });
      //  },
      //),
    );
  }

  Widget _buildBody(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection('data').snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) return LinearProgressIndicator();
        print(snapshot);
        return _buildList(context, snapshot.data!.docs);
      },
    );
  }

  Widget _buildList(BuildContext context, List<DocumentSnapshot> snapshot) {
    return ListView(
      //padding: const EdgeInsets.only(top: 0.0),
      children: snapshot.map((data) => _buildListItem(context, data)).toList(),
    );
  }

  Widget _buildListItem(BuildContext context, DocumentSnapshot data) {
    final record = Record.fromSnapshot(data);
    print(record.title);
    Uint8List uint8list = base64Decode(record.photo);
    return Post(
      profileImageBytes: uint8list,
      postImageBytes: uint8list,
      username: "john_doe",
      title: "A Day at the Park",
      startTime: DateTime.now().subtract(Duration(hours: 2)),
      endTime: DateTime.now().add(Duration(hours: 2)),
      caption: "Spent a wonderful day at the park!",
      locationName: "Central Park", // Given name of the location
      position: Position(latitude: 37.422, longitude: -122.084),
    );
  }
}

class Record {
  final String title;
  final String description;
  final String location;
  final String photo;
  final DocumentReference reference;

  Record.fromMap(Map<String, dynamic> map, {required this.reference})
      : assert(map['title'] != null),
        assert(map['description'] != null),
        assert(map['location'] != null),
        assert(map['photo'] != null),
        title = map['title'],
        description = map['description'],
        location = map['location'],
        photo = map['photo'];
  Record.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data()! as Map<String, dynamic>,
            reference: snapshot.reference);

  @override
  String toString() => "Record<$title:$description>";
}
