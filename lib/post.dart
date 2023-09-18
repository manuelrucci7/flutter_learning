import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Post extends StatelessWidget {
  final Uint8List profileImageBytes;
  final Uint8List postImageBytes;
  final String username;
  final String title;
  final String locationName; // Name of the location
  final DateTime startTime; // Start time of the event
  final DateTime endTime; // End time of the event
  final String caption;
  final Position position;

  Post({
    required this.profileImageBytes,
    required this.postImageBytes,
    required this.username,
    required this.title,
    required this.locationName,
    required this.startTime,
    required this.endTime,
    this.caption = '',
    required this.position,
  });

  Future<void> _openMap() async {
    final url =
        'https://www.google.com/maps/search/?api=1&query=${position.latitude},${position.longitude}';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              // Nested Column for Username, Title, and Date
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(40),
                        child: Image.memory(
                          profileImageBytes,
                          width: 30,
                          height: 30,
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(width: 10),
                      Text(
                        username,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "visita odontoiatrica", // Your title
                          style: TextStyle(fontSize: 15),
                        ),
                        SizedBox(width: 10),
                        Text(
                          "${startTime.day}/${startTime.month}/${startTime.year}", // Date of the event
                          style: TextStyle(fontSize: 15, color: Colors.purple),
                        ),
                        SizedBox(width: 10),
                        Text(
                          "${startTime.hour.toString().padLeft(2, '0')}:${startTime.minute.toString().padLeft(2, '0')} - ${endTime.hour.toString().padLeft(2, '0')}:${endTime.minute.toString().padLeft(2, '0')}",
                          style: TextStyle(fontSize: 15),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        ClipRRect(
          child: Image.memory(
            postImageBytes,
            fit: BoxFit.cover,
          ),
        ),
        SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(Icons.people, size: 20),
              Icon(Icons.share, size: 20),
              InkWell(
                onTap: _openMap,
                child: Row(
                  children: [
                    Icon(Icons.location_on, color: Colors.blue, size: 20),
                    Text(
                      locationName,
                      style: TextStyle(color: Colors.blue, fontSize: 15),
                    ),
                  ],
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  // Handle join action here
                },
                child: Text("Join"),
              ),
            ],
          ),
        ),
        SizedBox(height: 10),
        if (caption.isNotEmpty)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(caption),
          ),
        Divider(
          // This is the separation line
          thickness: 1.0,
          color: Colors.grey[500],
        ),
        // Add icons for like, comment, share, etc. if desired
      ],
    );
  }
}

class Position {
  final double latitude;
  final double longitude;

  Position({required this.latitude, required this.longitude});
}
